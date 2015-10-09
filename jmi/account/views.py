# django
from django.shortcuts import render,HttpResponseRedirect
from django.contrib.auth import authenticate,login,logout
from django.core.urlresolvers import reverse
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.template import loader

# app
from django.contrib.auth.models import User
from models import Profile,PasswordReset
from fundraiser.models import Fundraiser
from jmi.settings import APP_SERVER

# forms
from form import LoginForm,RegisterUserForm,SimpleSignUpForm,ProfileEditForm,AddressEditForm,PasswordResetForm

# helper
from helper.initialize_helper import SessionVariable

# tasks
from fundraiser.tasks import send_fundraiser_receipt_email, send_password_reset_email


def auth_login(request):
	login_form = LoginForm(request.POST or None)
	if login_form.is_valid():
		username = login_form.cleaned_data['username']
		# email_address = login_form.cleaned_data['email']
		password      = login_form.cleaned_data['password']
		
		try:
			user      = User.objects.get(username=username)
			user_auth = authenticate(username=user.username,password=password)
		except:
			user_auth = None

		if user_auth:
			login(request,user_auth)
			messages.success(request,'You successfully logged in!')
		else:
			messages.error(request, "Incorrect: Username and Password!")
			return HttpResponseRedirect(reverse('auth_login'))
		return HttpResponseRedirect(reverse('home'))

	context = {'login_form' : login_form}
	template = 'account/login.html'
	return render(request,template,context)

def auth_logout(request):
	logout(request)
	return HttpResponseRedirect(reverse('home'))	

def auth_create_account(request):
	register_form = RegisterUserForm(request.POST or None)
	
	if register_form.is_valid():
		rf = register_form.cleaned_data
		username = rf['username']
		organization = rf['organization']
		first_name = rf['first_name']
		last_name = rf['last_name']
		email = rf['email']
		password = rf['password']

		try:
			user_is_already_registered = User.objects.get(email=email)
		except:
			user_is_already_registered = None

		try:
			organization_already_exists = Profile.objects.get(organization=organization)
		except:
			organization_already_exists = None

		if user_is_already_registered or organization_already_exists:
			messages.error(request, "Either user exists or organization exists")
			return HttpResponseRedirect(reverse('auth_create_account'))
		else:
			
			user = User.objects.create_user(
				username=username,
				first_name=first_name,
				last_name=last_name,
				password=password,
				email=email
			)

			profile, created = Profile.objects.get_or_create(
				organization=organization,
				first_name=first_name,
				last_name=last_name,
				account=user
			)
			profile.email = email
			profile.save()
			authenticated_user = authenticate(username=username,password=password)
			login(request,authenticated_user)
			messages.success(request, str(user.username) + ', You have successfully signed up!')
			
			return HttpResponseRedirect(reverse('home'))
		
			
	context = {'register_form' : register_form}
	template = 'account/sign_up.html'
	return render(request,template,context)

def auth_login_and_add_account_to_fundraiser(request):
	pass

def auth_simple_sign_up(request):
	form = SimpleSignUpForm(request.POST or None)
	
	if form.is_valid():
		
		cleaned_form = form.cleaned_data
		username     = cleaned_form['username']
		password     = cleaned_form['password']
		confirmation = cleaned_form['confirm']

		user,created = User.objects.get_or_create(username=username)
		
		if created:
			session_finalized_fundraiser = SessionVariable(request).session_finalized_fundraiser()
			user.set_password(password)
			user.save()
			if session_finalized_fundraiser is None:
				title = 'session expired. call back office to set up account.'
				messages.error(request,title)
				return HttpResponseRedirect(reverse('describe_fundraiser'))

			profile = session_finalized_fundraiser.profile
			profile.account = user 
			profile.save()
			session_finalized_fundraiser.account = user
			session_finalized_fundraiser.save()
			
			auth = authenticate(username=username,password=password)
			
			login(request,auth)

			title = str(user.username) + ', You have successfully signed up! See your profile to manage your Organization.'
			messages.success(request,title)
			return HttpResponseRedirect(reverse('process_checkout'))
		else:
			title = 'Username exists, pick a more unique username!'
			messages.error(request,title)
			return HttpResponseRedirect(reverse('process_checkout'))
	else:
		title = 'There was an error in creating your account. Make sure passwords match!'
		messages.error(request,title)
		return HttpResponseRedirect(reverse('process_checkout'))

def send_reset_email(request):
	if request.POST:
		username = request.POST['username']

		try:
			account = User.objects.get(username=username)
			user_profile = Profile.objects.get(account=account)
		except:
			account = None
			user_profile = None

		if user_profile and username:
			reset = PasswordReset.objects.create(user=user_profile.account)

			password_reset_link =  APP_SERVER+reset.generate_reset_link()
		
			template = '../../static/templates/emails/password_reset.html'
			context = {'profile' : user_profile,'password_reset_link' : password_reset_link}
			html_email = loader.render_to_string(template,context)

			send_password_reset_email.delay(
				str(user_profile.organization+' Fundraiser'), 
				'Jose Madrid Salsa fundraising <mike@josemadridsalsa.com>',
				[user_profile.email],
				html_email
			)
			messages.success(request,'Password reset email sent.')
		else:
			messages.error(request,'Email and Username does not exist in our system. Please call our back office.')


	return HttpResponseRedirect(reverse('home'))

def receive_password_reset(request,key):
	try:
		reset = PasswordReset.objects.get(key=key)
	except:
		reset = None

	try:
		profile = Profile.objects.get(account=reset.account)
	except:
		profile = None

	if reset:
		template = 'account/password_reset.html'
		context = {'form' : PasswordResetForm, 'profile' : profile, 'reset' : reset}
		return render(request,template,context)
	else:
		messages.error(request,'Your password token is expired. Call our backoffice to reset.')
		return HttpResponseRedirect(reverse('home'))

def submited_password_reset(request):
	form = PasswordResetForm(request.POST or None)

	if form.is_valid():
		key = request.POST['key']
		pwd = request.POST['password']
		cfm = request.POST['confirm']
		username = request.POST['username']
		
		if pwd == cfm:
			try:
				account = User.objects.get(username=username)
			except:
				account = None

			if account:
				account.set_password(pwd)
				account.save()
				messages.success(request,'Password updated successfully.')
			else:
				messages.error(request,'There was a problem. Call backoffice to reset.')
		else:
			messages.error(request,"Your passwords didn't match. Please try again or call backoffice.")
			return HttpResponseRedirect(reverse('receive_password_reset',args=(key,)))

	return HttpResponseRedirect(reverse('home'))

# profile
@login_required(login_url='/account/login')
def profile_show(request):
	session = SessionVariable(request)
	context = {'user_profiles' : session.profiles()}
	template = 'account/profile/show.html'
	return render(request,template,context)

@login_required(login_url='/account/login')
def profile_edit(request,slug):

	try:
		profile = Profile.objects.get(slug=slug)
	except: 
		profile = None

	if profile:
		profile_form = ProfileEditForm(instance=profile)
		address_form = AddressEditForm(instance=profile.address)
	else:
		profile_form = None
		address_form = None

	if request.POST:
		try:
			address_form = AddressEditForm(request.POST,instance=profile)
			profile_form = ProfileEditForm(request.POST,instance=profile)
			address_form.save()
			profile_form.save()
			messages.success(request,'Address and Profile updated successfully.')
		except ValueError:
			messages.error(request,'You submitted no changes!')
		return HttpResponseRedirect(reverse('profile_show'))

	
	context = {'profile': profile,'profile_form' : profile_form,'address_form' : address_form}
	template = 'account/profile/edit.html'
	return render(request,template,context)

@login_required(login_url='/account/login')
def profile_detail(request,slug):

	try:
		profile = Profile.objects.get(slug=slug)
	except:
		profile = None

	try:
		fundraiser = profile.fundraisers().first()
	except:
		fundraiser = None
	
	if profile and profile.fundraiser_set.all().count() == 1:
		return HttpResponseRedirect(reverse('profile_fundraiser_detail',args=(fundraiser.id,)))
	
	try:
		fundraiser_set = profile.fundraiser_set.filter(finalized=True)
	except:
		fundraiser_set = None

	context = {'fundraiser_set' : fundraiser_set,'profile' : profile}
	template = 'account/profile/detail.html'
	return render(request,template,context)

@login_required(login_url='/account/login')
def profile_fundraiser_detail(request,id):

	try:
		fundraiser = Fundraiser.objects.get(id=id)
	except:
		fundraiser = None

	context = {'fundraiser' : fundraiser}
	template = 'account/profile/fundraiser_detail.html'
	return render(request,template,context)


