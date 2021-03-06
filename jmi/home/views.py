# python
import os

# django
from django.shortcuts import render,HttpResponseRedirect
from django.template import *
from django.core.files import File
from django.http import HttpResponse
from django.contrib import messages
from django.core.urlresolvers import reverse

# app
from helper.initialize_helper import SessionVariable
from fundraiser.models import Fundraiser, FundraiserCategory,FundraiserType
from marketing.form import EmailNewsLetterForm
from product.models import Product,Category
from jmi.settings import DOCS_ROOT,SERVER

# form
from product.forms import ProductSearchForm

def error(request):
	context = {}
	template = 'home/error.html'
	return render(request,template,context)

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
def download_forms(request,id):
	try:
		option = FundraiserType.objects.get(id=id)
	except:
		option = None

	try:
		if option.forms:
			import urllib
			f = open(option.forms, 'r')
			myfile = File(f)
			response = HttpResponse(myfile, content_type='application/zip')
			response['Content-Disposition'] = 'attachment; filename=fundraising-forms-packet.zip'
			return response
	except:
		messages.error(request,"There are no forms to download at this time. Call backoffice to get forms. ")
		return HttpResponseRedirect(reverse('home'))

	# import urllib
 # 	file = 'jmsf.zip'
	# file_path = DOCS_ROOT+'/%s' % file
	# f = open(file_path, 'r')
	# myfile = File(f)

	# response = HttpResponse(myfile, content_type='application/zip')
	# response['Content-Disposition'] = 'attachment; filename=%s' % file
	# return response
	

def plan_type(request,id):
	try: 
		plan = FundraiserCategory.objects.get(id=id)
	except:
		plan = None

	context = {'plan' : plan,'server' : SERVER}
	template = 'plans/index.html'
	return render(request,template,context)

