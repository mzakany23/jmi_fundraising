# python
import json

# django
from django.utils.text import slugify
from django.shortcuts import render, HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.contrib import messages
from django.http import HttpResponse
from django.conf import settings
from django.template import RequestContext
from django.template import loader

# app 
from fundraiser.models import Fundraiser, FundraiserType, FundraiserCategory
from account.models import Profile
from shipment.models import Shipment, Selection
from product.models import Product
from address.models import Address
from marketing.models import GenericDiscount,SingleDiscount
from jmi.settings import EMAIL_TEMPLATE_DIR	

# helper
from home.views import get_home_variables
from helper.initialize_helper import SessionVariable
from helper.fundraiser_process_helper import DescribeFundraiser, OptionFundraiser, ChooseSalsasFundraiser, ShipmentFundraiser
from helper.method_helper import return_all_objects
from helper.email_helper import EmailHelper

# forms
from django import forms
from form import FundraiserDescribeForm, LoggedInFundraiserDescribeForm
from shipment.form import ShipmentProfileForm
from address.form import AddressForm,BillingAddressForm
from account.form import SimpleSignUpForm

# tasks
from tasks import send_fundraiser_receipt_email


def start_process(request):
	session = SessionVariable(request)

	if session.user():
		if session.user_has_a_profile():
			return HttpResponseRedirect(reverse('choose_profile_for_fundraiser'))
		else:
			return HttpResponseRedirect(reverse('describe_fundraiser'))
	else:
		return HttpResponseRedirect(reverse('describe_fundraiser'))

def start_over(request):
	try:
		request.session['order_step'] = None 
		title = 'fundraiser cleared'
		messages.success(request,title)
	except:
		title = 'there was no fundraiser'
		messages.error(request,title)

	return HttpResponseRedirect(reverse('describe_fundraiser'))


def choose_profile_for_fundraiser(request):
	session = SessionVariable(request)
	try:
		user_profiles = Profile.objects.filter(account=session.user())
	except:
		user_profiles = None

	template = "fundraiser/choose_profile_for_fundraiser.html"
	context = {'user_profiles' : user_profiles}
	return render(request,template,context)


def logged_in_describe_fundraiser(request,slug):
	try:
		profile = Profile.objects.get(slug=slug)
	except:
		profile = None 

	form = LoggedInFundraiserDescribeForm(request.POST or None)

	describe = DescribeFundraiser(request,form)

	if describe.form_is_valid():
		title = form.cleaned_data['title']
		organization = profile.organization
		description = form.cleaned_data['description']

		if describe.fundraiser_is_unique(title=title,organization=organization,description=description):
			describe.create_fundraiser_with_profile()
			return HttpResponseRedirect(reverse('choose_fundraiser'))
		else:
			title = 'Woops, choose a more unique fundraiser name, there already exists one with the same name.'
			messages.error(request,title)
			return HttpResponseRedirect(reverse('describe_fundraiser'))
		

	template = 'fundraiser/describe_logged_in.html'
	context = {
		'profile' : profile,
		'form' : form
	}
	return render(request,template,context)

# lets-do-a-fundraiser
def describe_fundraiser(request):
	
	try:
		del request.session['session_finalized_order']
	except:
		request.session['session_finalized_order'] = None
	
	if request.POST:
		form = FundraiserDescribeForm(request.POST,request.FILES)
	else:
		form = FundraiserDescribeForm(None)
	
	describe = DescribeFundraiser(request,form)
	
	if describe.form_is_valid():

		title         = form.cleaned_data['title']
		organization  = form.cleaned_data['organization']
		description   = form.cleaned_data['description']
		try:
			org_photo = request.FILES['org_photo']
		except:
			org_photo = None

		if describe.fundraiser_is_unique(title=title,organization=organization,description=description,org_photo=org_photo):
			describe.create_fundraiser_with_profile()
			# session = SessionVariable(request)
			# user = session.user().username
			# user_is_authenticated = session.user_is_logged_in()
			# create_fundraiser_with_profile_task.delay(user_is_authenticated,user,title,organization,description,org_photo)
			return HttpResponseRedirect(reverse('choose_fundraiser'))
		else:
			title = 'Woops, choose a more unique fundraiser name, there already exists one with the same name.'
			messages.error(request,title)
			return HttpResponseRedirect(reverse('describe_fundraiser'))

	
	context = {'form' : form}
	template = 'fundraiser/describe.html'

	return render(request,template,context,context_instance=RequestContext(request, processors=[get_home_variables]))
	

def choose_fundraiser(request):
	request.session['order_step'] = 'choose_fundraiser'

	if request.POST:
		try: 
			slug = request.POST['option']
			option = FundraiserType.objects.get(slug=slug)
		except:
			slug = None
			option = None

		try:
			plan_id = request.POST['plan']
			plan = FundraiserCategory.objects.get(id=plan_id)
		except:
			plan_id = None
			plan = None


		if option is None:
			messages.error(request,'Please select an option.')
			return HttpResponseRedirect(reverse('choose_fundraiser'))
		else:
			session = SessionVariable(request,'current_fundraiser')
			session_fundraiser = session.session_fundraiser()

			session_fundraiser.plan = plan
			session_fundraiser.type = option
			session_fundraiser.save()

			return HttpResponseRedirect(reverse('chosen_fundraiser_type'))
	
	fundraiser_options = return_all_objects(FundraiserType)
	plans = return_all_objects(FundraiserCategory)
	context = {
		'types' : fundraiser_options,
		'plans' : plans,
		'settings' : settings}
	template = 'fundraiser/choose.html'
	return render(request,template,context)

def chosen_fundraiser_type(request):
	request.session['order_step'] = 'selections'
	session = SessionVariable(request,'current_fundraiser')
	session_shipment = session.session_shipment()

	if request.POST:
		salsas = ChooseSalsasFundraiser(request)
		salsas.set_product_and_qty_selection()
		
		if salsas.theres_no_selections_made():
			title = 'Please make at least one selection!'
			messages.error(request,title)
			return HttpResponseRedirect(reverse('chosen_fundraiser_type'))
		else:
			if session_shipment.has_selections():
				session_shipment.remove_selections()
			if session_shipment:
				try:
					salsas.save_selections()
				except:
					title = 'There was an error. Make sure you use only numbers in quantities!'
					messages.error(request,title)
					return HttpResponseRedirect(reverse('chosen_fundraiser_type'))

			return HttpResponseRedirect(reverse('create_shipment'))

	context = {
		'session' : session,
		'settings' : settings
	}

	template = 'fundraiser/choose-salsas.html'
	return render(request,template,context)

# fundraiser/fundraiser-type-type-5
def choose_salsas(request):
	request.session['order_step'] = 'choose_salsas'
	session_shipment = SessionVariable(request,'current_fundraiser').session_shipment()
	session_fundraiser = SessionVariable(request,'current_fundraiser').session_fundraiser()
	session_fundraiser.discount = 0
	session_fundraiser.save()
	
	print request.POST
	# salsas = ChooseSalsasFundraiser(request)
	
	# if salsas.form_is_valid():
	# 	salsas.set_product_and_qty_selection()
	# 	if salsas.theres_no_selections_made():
	# 		title = 'Please make at least one selection!'
	# 		messages.error(request,title)
	# 		return HttpResponseRedirect(reverse('chosen_fundraiser_type'))
	# 	else:
	# 		if session_shipment.has_selections():
	# 			session_shipment.remove_selections()
	# 		if session_shipment:
	# 			try:
	# 				salsas.save_selections()
	# 			except:
	# 				title = 'There was an error. Make sure you use only numbers in quantities!'
	# 				messages.error(request,title)
	# 				return HttpResponseRedirect(reverse('chosen_fundraiser_type'))

	# 		return HttpResponseRedirect(reverse('create_shipment'))

	context = {}
	template = 'fundraiser/shipment.html'
	return render(request,template,context)


# fundraiser-shipment
def create_shipment(request):
	request.session['order_step'] = 'create_shipment'
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
		
		try:
			address, created = Address.objects.get_or_create(
				title=title,
				street=street,
				line_2=line_2,
				city=city,
				state=state,
				zip_code=zip_code
			)
		except:
			address = Address.objects.filter(street=street).first()


		session_fundraiser  = SessionVariable(request,'current_fundraiser').session_fundraiser()
		session_shipment    = SessionVariable(request,'current_fundraiser').session_shipment()


		if session_fundraiser.profile is None:
			messages.error(
				request, "Your profile was deleted from logging out, you'll have to recreate it.")
			return HttpResponseRedirect(reverse('describe_fundraiser'))
		else:
			session_shipment.address = address
			session_shipment.title   = title
			session_shipment.save()

			session_fundraiser.profile.first_name   = first_name
			session_fundraiser.profile.last_name    = last_name
			session_fundraiser.profile.phone_number = phone
			session_fundraiser.profile.email        = email
			session_fundraiser.profile.address      = address
			session_fundraiser.profile.save()

			return HttpResponseRedirect(reverse('checkout'))


	context = {
		'shipment_profile_form' : shipment_profile_form,
		'shipment_address_form' : shipment_address_form,
		'billing_address_form' : billing_address_form
	}

	template = 'fundraiser/shipment.html'
	return render(request,template,context)

def edit_shipment(request,id):
	request.session['order_step'] = 'checkout'

	session            = SessionVariable(request,'current_fundraiser')
	session_fundraiser = session.session_fundraiser()
	session_shipment   = session.session_shipment()

	profile_form = ShipmentProfileForm(request.POST or None,instance=session_fundraiser.profile)
	address_form = AddressForm(request.POST or None, instance=session_shipment.address)
	
	if profile_form.is_valid() and address_form.is_valid():
		profile_form.save()
		address_form.save()
		title = 'You have successfully updated your shipment.'
		messages.success(request,title)
		return HttpResponseRedirect(reverse('create_shipment'))

	template = 'fundraiser/edit_shipment.html'
	context = {
		'shipment_address_form' : address_form, 
		'shipment_profile_form' : profile_form,
		'session_shipment' : session_shipment
	}
	return render(request,template,context)		

def checkout(request):
	request.session['order_step'] = 'checkout'
	session = SessionVariable(request,'current_fundraiser')
	session_shipment = session.session_shipment()
	session_fundraiser = session.session_fundraiser()
	
	try:
		stripe_api_key = settings.STRIPE_API_KEY 
	except:
		stripe_api_key = None

	context = {
		'stripe_api_key' : stripe_api_key,
		'session_shipment' : session_shipment,
		'session_fundraiser' : session_fundraiser
	}

	template = 'fundraiser/checkout.html'
	return render(
		request,template,context,
		context_instance=RequestContext(request, processors=[get_home_variables])
	)

def process_checkout(request):
	request.session['order_step'] = None

	try:
		if request.session['current_fundraiser']:
			request.session['finalized_order'] = request.session['current_fundraiser']
			del request.session['current_fundraiser']
	except:
		pass

	try:
		finalized_order = Fundraiser.objects.get(id=request.session['finalized_order'])
		order_type      = str(finalized_order.get_payment_type())
	except:
		finalized_order = None
		order_type = None

	session_finalized_fundraiser = SessionVariable(request).session_finalized_fundraiser()
	context = {
		'finalized_order' : finalized_order,
		'order_type' : order_type, 
		'form' : SimpleSignUpForm
	}
	if session_finalized_fundraiser.profile.email:
	# if session_finalized_fundraiser.profile.email and not session_finalized_fundraiser.receipt_email_sent:
		
		data = {'fundraiser' : finalized_order}
		template_name  = EMAIL_TEMPLATE_DIR + 'email_fundraiser_receipt.html'
		html_email     = loader.render_to_string(template_name,data)
		
		send_fundraiser_receipt_email.delay(
			str(finalized_order.organization())+' Fundraiser', 
			'From Jose Madrid Salsa Fundraising',
			'mzakany@gmail.com',
			['mzakany@gmail.com'],
			html_email
			)
	
		session_finalized_fundraiser.receipt_email_sent = True
		session_finalized_fundraiser.save()
	template = 'fundraiser/checkout-invoice.html'
	return render(request,template,context)

def get_back_on_track(request):
	''' 
		will look at the fundraiser and determine where at in the order you should
		be redirected to.
	'''

	session = SessionVariable(request,'current_fundraiser')
	
	if session.has_fundraiser():
		order_step = request.session['order_step']
		if order_step == 'choose_fundraiser':
			return HttpResponseRedirect(reverse('choose_fundraiser'))
		elif order_step == 'selections':
			fund_type = session.session_fundraiser().type
			return HttpResponseRedirect(reverse('chosen_fundraiser_type',args=(fund_type.slug,)))
		elif order_step == 'choose_salsas':
			return HttpResponseRedirect(reverse('choose_salsas'))
		elif order_step == 'create_shipment':
			return HttpResponseRedirect(reverse('create_shipment'))
		elif order_step == 'checkout':
			return HttpResponseRedirect(reverse('checkout'))
		elif order_step == 'process_checkout':
			return HttpResponseRedirect(reverse('process_checkout'))
		else:
			return HttpResponseRedirect(reverse('describe_fundraiser'))
	else:
		return HttpResponseRedirect(reverse('describe_fundraiser'))


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

