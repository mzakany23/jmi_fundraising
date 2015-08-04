from django.shortcuts import render
from django.template import *
from django.conf import settings

from fundraiser.models import Fundraiser

def home(request):
	context = {}
	template = 'home/index.html'
	return render(request,template,context)

def get_home_variables(request):
	try:
		session_fundraiser = Fundraiser.objects.get(id=request.session['current_fundraiser'])
	except:
		session_fundraiser = None

	return {
			'session_fundraiser' : session_fundraiser,
	}

