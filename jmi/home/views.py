from django.shortcuts import render
from django.template import *
from django.conf import settings

from helper.initialize_helper import SessionVariable
from fundraiser.models import Fundraiser
from marketing.form import EmailNewsLetterForm
from product.models import Category

from product.forms import ProductSearchForm

def home(request):
	context = {}
	template = 'home/index.html'
	return render(request,template,context)

def get_home_variables(request):
	try:
		categories = Category.objects.all().order_by('order')
	except:
		categories = None 

	try:
		session_fundraiser = Fundraiser.objects.get(id=request.session['current_fundraiser'])
	except:
		session_fundraiser = None

	try:
		session = SessionVariable(request,'current_fundraiser')
	except:
		session = None

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
		if current_shipment.address:
			already_has_shipment = True
		else:
			already_has_shipment = False
	except:
		already_has_shipment = False


	return {
		'session' : session,
		'categories' : categories,
		'session_fundraiser' : session_fundraiser,
		'ready_to_checkout' : ready_to_checkout,
		'already_has_shipment' : already_has_shipment,
		'current_shipment' : current_shipment,
		'newsletter_form' : EmailNewsLetterForm,
		'search_form' : ProductSearchForm()
	}

