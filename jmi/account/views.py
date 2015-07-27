from django.shortcuts import render,HttpResponseRedirect
from django.contrib.auth import authenticate,login,logout
from django.core.urlresolvers import reverse

def auth_login(request):
	context = {}
	template = 'account/authenticate.html'
	return render(request,template,context)

def auth_logout(request):
	logout(request)
	return HttpResponseRedirect(reverse('home'))	

def auth_create_account(request):
	context = {}
	template = 'account/sign_up.html'
	return render(request,template,context)