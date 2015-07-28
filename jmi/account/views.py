from django.shortcuts import render,HttpResponseRedirect
from django.contrib.auth import authenticate,login,logout
from django.core.urlresolvers import reverse
from django.contrib import messages
from django.contrib.auth.models import User
from models import Profile
from form import LoginForm,RegisterUserForm


def auth_login(request):
	login_form = LoginForm(request.POST or None)
	
	if login_form.is_valid():
		email_address = login_form.cleaned_data['email']
		password      = login_form.cleaned_data['password']
		
		try:
			user      = User.objects.get(email=email_address)
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











