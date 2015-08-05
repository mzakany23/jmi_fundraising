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

	try:
		sp = session_fundraiser

		if sp.profile and sp.type and sp.shipment_set.first():
			ready_to_checkout = True
		else:
			ready_to_checkout = False
	except:
		ready_to_checkout = False

	try:
		current_shipment = session_fundraiser.shipment_set.first()
	except:
		current_shipment = None

	try:
		if current_shipment:
			already_has_shipment = True
		else:
			already_has_shipment = False
	except:
		already_has_shipment = False

	
	return {
			'session_fundraiser' : session_fundraiser,
			'ready_to_checkout' : ready_to_checkout,
			'already_has_shipment' : already_has_shipment,
			'current_shipment' : current_shipment
	}

