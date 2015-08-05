import json
from django.utils.text import slugify

from django import forms
from django.shortcuts import render, HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.contrib import messages
from django.http import HttpResponse
from django.conf import settings
from django.template import RequestContext

from fundraiser.models import Fundraiser, FundraiserType
from account.models import Profile
from shipment.models import Shipment, Selection
from product.models import Product
from address.models import Address

from home.views import get_home_variables

from shipment.form import ShipmentProfileForm
from form import FundraiserDescribeForm
from address.form import AddressForm,BillingAddressForm


def describe_fundraiser(request):
	form = FundraiserDescribeForm(request.POST or None)
	
	if form.is_valid():

		title         = form.cleaned_data['title']
		organization  = form.cleaned_data['organization']
		description   = form.cleaned_data['description']

		
		try:
			fr = Fundraiser.objects.get(title=title)
		except:
			fr = None

		try:
			pr = Profile.objects.get(organization=organization)
		except:
			pr = None

		if fr and pr:
			messages.error(
				request, "Woops, choose a more unique fundraiser name, there already exists one with the same name.")
			return HttpResponseRedirect(reverse('describe_fundraiser'))
		else:
			profile, created = Profile.objects.get_or_create(organization=organization)
			if created:
				profile.slug = profile.organization + "-" + str(profile.id)
				profile.save()

			fundraiser, created = Fundraiser.objects.get_or_create(
				title=title,
				profile=profile,
				description=description,
				status='in-process'
			)
			request.session['current_fundraiser'] = fundraiser.id
			return HttpResponseRedirect(reverse('choose_fundraiser'))

	context = {'form' : form}
	template = 'fundraiser/describe.html'

	return render(request,template,context,context_instance=RequestContext(request, processors=[get_home_variables]))
	
def choose_fundraiser(request):
	try:
		fundraiser_options = FundraiserType.objects.all()
	except:
		fundraiser_options = None

	context = {'types' : fundraiser_options,'settings' : settings}
	template = 'fundraiser/choose.html'
	return render(request,template,context)

def chosen_fundraiser_type(request,slug):
	
	try:
		fundraiser_type = FundraiserType.objects.get(slug=slug)
	except:
		fundraiser_type = None

	try:
		session_fundraiser = Fundraiser.objects.get(id=request.session['current_fundraiser'])
	except:
		session_fundraiser = None

	print fundraiser_type
	print session_fundraiser

	if session_fundraiser and fundraiser_type:
		session_fundraiser.type = fundraiser_type
		session_fundraiser.save()

	context = {
		'fundraiser_type' : fundraiser_type, 
	}

	template = 'fundraiser/choose-salsas.html'
	return render(request,template,context)

def choose_salsas(request):
	post = request.POST or None

	if post:
		product   = post.getlist('product')
		quantity  = post.getlist('quantity')
		fund_type = post['type']
		length = len(product)

		if quantity.count("0") == length:
			messages.error(
				request, "Please make at least one selection!")
			return HttpResponseRedirect(reverse('chosen_fundraiser_type',args=(fund_type,)))
		else:
			# create and save the selections to the shipment
			try:
				session_fundraiser = Fundraiser.objects.get(id=request.session['current_fundraiser'])
				session_shipment = Shipment.objects.get(fundraiser=session_fundraiser)
			except:
				session_fundraiser = None
				session_shipment = None

			if session_shipment:

				for i in range(length):	
					sel, created = Selection.objects.get_or_create(
						shipment=session_shipment,
						product=Product.objects.get(id=product[i]),
					)

					if created:
						sel.quantity = quantity[i]
						sel.save()
					else:
						sel.quantity=quantity[i]
						sel.save()


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

		try:
			session_fundraiser = Fundraiser.objects.get(id=request.session['current_fundraiser'])
			profile = session_fundraiser.profile
		except:
			profile = None

		try:
			shipment = Shipment.objects.get(fundraiser=session_fundraiser)
		except:
			shipment = None

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
	context = {}
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

	try:
		current_fundraiser = Fundraiser.objects.get(id=request.session['current_fundraiser']) 
	except:
		current_fundraiser = None

	try:
		shipments = Shipment.objects.get(fundraiser=current_fundraiser)
		selections = shipments.selection_set.all()
	except:
		shipments = None
		selections = None

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

