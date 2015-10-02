# python
import os

# django
from django.shortcuts import render
from django.template import *
from django.core.files import File
from django.http import HttpResponse

# app
from helper.initialize_helper import SessionVariable
from fundraiser.models import Fundraiser, FundraiserCategory
from marketing.form import EmailNewsLetterForm
from product.models import Product,Category
from jmi.settings import DOCS_ROOT

# form
from product.forms import ProductSearchForm

def home(request):
	try:
		featured = Product.objects.filter(featured=True)[:16]
	except:
		featured = None

	try: 
		plans = FundraiserCategory.objects.all().order_by('name')
	except:
		plans = None

	context = {'featured_products' : featured,'plans' : plans}
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

# Plans
def download_forms(request):
	import urllib
 	file = 'jmsf.zip'
	file_path = DOCS_ROOT+'/%s' % file
	f = open(file_path, 'r')
	myfile = File(f)

	response = HttpResponse(myfile, content_type='application/zip')
	response['Content-Disposition'] = 'attachment; filename=%s' % file
	return response
	

def plan_type(request,id):
	try: 
		plan = FundraiserCategory.objects.get(id=id)
	except:
		plan = None

	context = {'plan' : plan}
	template = 'plans/index.html'
	return render(request,template,context)

