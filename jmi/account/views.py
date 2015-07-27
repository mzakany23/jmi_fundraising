from django.shortcuts import render,HttpResponseRedirect
from django.contrib.auth import authenticate,login,logout
from django.core.urlresolvers import reverse
from django.contrib import messages
from django.contrib.auth.models import User
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
			user = None

		if user:
			login(request,user_auth)
			messages.success(request,'You successfully logged in!')
		else:
			messages.error(request, "Failure!")
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
		try:
			user_already_registered = User.objects.get(email=register_form.cleaned_data['email'])
		except:
			pass

		if not user_already_registered:
			pass
			

	context = {'register_form' : register_form}
	template = 'account/sign_up.html'
	return render(request,template,context)











