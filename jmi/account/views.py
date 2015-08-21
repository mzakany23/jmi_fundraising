from django.shortcuts import render,HttpResponseRedirect
from django.contrib.auth import authenticate,login,logout
from django.core.urlresolvers import reverse
from django.contrib import messages
from django.contrib.auth.models import User
from models import Profile
from fundraiser.models import Fundraiser
from form import LoginForm,RegisterUserForm,SimpleSignUpForm
from helper.initialize_helper import SessionVariable
from django.contrib.auth.decorators import login_required


def auth_login(request):
	login_form = LoginForm(request.POST or None)
	print login_form.is_valid()
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
			user.save()
			profile = Profile.objects.get(contact=user)
			profile.organization = organization
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
			user.set_password(password)
			user.save()
			session_fundraiser = Fundraiser.objects.get(id=request.session['finalized_order'])
			if session_fundraiser is None:
				title = 'session expired. call back office to set up account.'
				messages.error(request,title)
				return HttpResponseRedirect(reverse('describe_fundraiser'))

			session_fundraiser.account = user
			session_fundraiser.save()
			
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
		

# profile
@login_required(login_url='/account/login')
def profile_show(request):
	user = SessionVariable(request)
	print user.fundraisers()
	print user.profile()
	context = {'session' : user}
	template = 'account/profile/index.html'
	return render(request,template,context)




