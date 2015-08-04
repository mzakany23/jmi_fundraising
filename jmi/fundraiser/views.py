import json

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

from home.views import get_home_variables

from form import FundraiserDescribeForm



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
			fundraiser = Fundraiser.objects.create(title=title,profile=profile,status='in-process')
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
	context = {}
	template = 'fundraiser/shipment.html'
	return render(request,template,context)

def get_back_on_track(request):
	try:
		current_fundraiser = Fundraiser.objects.get(id=request.session['current_fundraiser']) 
	except:
		current_fundraiser = None

	try:
		shipments = Shipment.objects.filter(fundraiser=current_fundraiser)
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

