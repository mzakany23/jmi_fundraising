import json
from django.utils.text import slugify

from django.shortcuts import render, HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.contrib import messages
from django.http import HttpResponse
from django.conf import settings
from django.template import RequestContext

# app import
from fundraiser.models import Fundraiser, FundraiserType
from account.models import Profile
from shipment.models import Shipment, Selection
from product.models import Product
from address.models import Address
from marketing.models import GenericDiscount,SingleDiscount

# helper
from home.views import get_home_variables
from helper.initialize_helper import SessionVariable
from helper.fundraiser_process_helper import DescribeFundraiser, OptionFundraiser, ChooseSalsasFundraiser, ShipmentFundraiser
from helper.method_helper import return_all_objects

# forms
from django import forms
from shipment.form import ShipmentProfileForm
from form import FundraiserDescribeForm
from address.form import AddressForm,BillingAddressForm



def describe_fundraiser(request):
	form = FundraiserDescribeForm(request.POST or None)
	
	describe = DescribeFundraiser(request,form)
	
	if describe.form_is_valid():
		title         = form.cleaned_data['title']
		organization  = form.cleaned_data['organization']
		description   = form.cleaned_data['description']

		if describe.fundraiser_is_unique(title,organization,description):
			describe.create_fundraiser_with_profile()
			return HttpResponseRedirect(reverse('choose_fundraiser'))
		else:
			title = 'Woops, choose a more unique fundraiser name, there already exists one with the same name.'
			messages.error(request,title)
			return HttpResponseRedirect(reverse('describe_fundraiser'))

	context = {'form' : form}
	template = 'fundraiser/describe.html'

	return render(request,template,context,context_instance=RequestContext(request, processors=[get_home_variables]))
	

def choose_fundraiser(request):
	fundraiser_options = return_all_objects(FundraiserType)

	context = {'types' : fundraiser_options,'settings' : settings}
	template = 'fundraiser/choose.html'
	return render(request,template,context)

def chosen_fundraiser_type(request,slug):
	session_fundraiser = SessionVariable(request,'current_fundraiser').session_fundraiser()
	fundraiser_type = OptionFundraiser().get_fundraiser_by_slug(slug)

	if session_fundraiser and fundraiser_type:
		session_fundraiser.type = fundraiser_type
		session_fundraiser.save()

	context = {
		'fundraiser_type' : fundraiser_type, 
	}

	template = 'fundraiser/choose-salsas.html'
	return render(request,template,context)

def choose_salsas(request):
	session_shipment = SessionVariable(request,'current_fundraiser').session_shipment()
	print session_shipment
	salsas = ChooseSalsasFundraiser(request)
	
	if salsas.form_is_valid():
		salsas.set_product_and_qty_selection()
		if salsas.theres_no_selections_made():
			title = 'Please make at least one selection!'
			messages.error(request,title)
			return HttpResponseRedirect(reverse('chosen_fundraiser_type',args=(salsas.fund_type,)))
		else:

			if session_shipment:
				salsas.save_selections()

			return HttpResponseRedirect(reverse('create_shipment'))

	context = {}
	template = 'fundraiser/shipment.html'
	return render(request,template,context)


def create_shipment(request):
	shipment_profile_form = ShipmentProfileForm(request.POST or None)
	shipment_address_form = AddressForm(request.POST or None)
	billing_address_form  = AddressForm(request.POST or None)

	if shipment_profile_form.is_valid() and shipment_address_form.is_valid():
		a = shipment_address_form.cleaned_data
		p = shipment_profile_form.cleaned_data

		title    = a['title']
		street   = a['street']
		line_2   = a['line_2']
		city     = a['city']
		state    = a['state']
		zip_code = a['zip_code']

		first_name = p['first_name']
		last_name  = p['last_name']
		phone      = p['phone_number']
		email      = p['email']
		
		
		address, created = Address.objects.get_or_create(
			title=title,
			street=street,
			line_2=line_2,
			city=city,
			state=state,
			zip_code=zip_code
		)

		profile  = SessionVariable(request,'current_fundraiser').session_fundraiser_profile()
		session_shipment    = SessionVariable(request,'current_fundraiser').session_shipment()


		if profile is None:
			messages.error(
				request, "Your profile was deleted from logging out, you'll have to recreate it.")
			return HttpResponseRedirect(reverse('describe_fundraiser'))
		else:
			shipment.address = address
			shipment.save()

			profile.first_name   = first_name
			profile.last_name    = last_name
			profile.phone_number = phone
			profile.email        = email
			profile.address      = address
			profile.save()

			return HttpResponseRedirect(reverse('checkout'))
	

	context = {
		'shipment_profile_form' : shipment_profile_form,
		'shipment_address_form' : shipment_address_form,
		'billing_address_form' : billing_address_form
	}

	template = 'fundraiser/shipment.html'
	return render(request,template,context)


def checkout(request):
	post = request.POST or None
	if post: 
		discount = post['discount']
		# process discount and return to checkout

	session_fundraiser = SessionVariable(request,'current_fundraiser')
	
	try:
		stripe_api_key = settings.STRIPE_API_KEY 
	except:
		stripe_api_key = None

	context = {'stripe_api_key' : stripe_api_key}
	template = 'fundraiser/checkout.html'
	return render(
		request,template,context,
		context_instance=RequestContext(request, processors=[get_home_variables])
	)

def process_checkout(request):
	context = {}
	template = 'fundraiser/checkout-invoice.html'
	return render(
		request,template,context,
		context_instance=RequestContext(request, processors=[get_home_variables])
	)

def get_back_on_track(request):
	''' 
		will look at the fundraiser and determine where at in the order you should
		be redirected to.
	'''

	current_fundraiser = SessionVariable(request,'current_fundraiser').session_fundraiser()
	selections = current_fundraiser.selections()

	if current_fundraiser:

		if current_fundraiser.type is None:
			return HttpResponseRedirect(reverse('choose_fundraiser'))
		elif selections is None:
			fund_type = current_fundraiser.type
			return HttpResponseRedirect(reverse('chosen_fundraiser_type',args=(fund_type.slug,)))
		elif current_fundraiser.shipment_set.first():
			return HttpResponseRedirect(reverse('checkout'))
		else:
			return HttpResponseRedirect(reverse('create_shipment'))

	context = {}
	template = 'fundraiser/shipment.html'
	return render(request,template,context)	

def get_fundraiser_selections_via_ajax(request,id):
	try:
		fundraiser_type = FundraiserType.objects.get(id=id)
		selections = fundraiser_type.selections.all()
		sel_list = []

		for sel in selections:
			sel_dict = {
				'id' : sel.id,
				'title' : sel.title,
				'image' : str(sel.image)
			}
			
			sel_list.append(sel_dict)
		
	except:
		fundraiser_type = None

	
	return HttpResponse(
            json.dumps(sel_list),
            content_type="application/json")

