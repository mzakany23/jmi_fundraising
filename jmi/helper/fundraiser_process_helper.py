from fundraiser.models import Fundraiser, FundraiserType
from account.models import Profile
from shipment.models import Shipment, Selection
from product.models import Product
from address.models import Address

from django.contrib import messages
from django.shortcuts import render, HttpResponseRedirect
from django.core.urlresolvers import reverse

from initialize_helper import SessionVariable

class DescribeFundraiser:
	def __init__(self,request,form):
		self.request = request
		self.describe_form = form
		self.title = None
		self.organization = None
		self.description = None
		self.profile = None

	def form_is_valid(self):
		return self.describe_form.is_valid()

	def fundraiser_is_unique(self,title,organization,description):
		
		try:
			fr = Fundraiser.objects.get(title=title)
		except:
			fr = None

		try:
			pr = Profile.objects.get(organization=organization)
		except:
			pr = None

		if fr and pr:
			return False 
		else:
			self.title = title
			self.organization = organization
			self.description = description
			self.profile = pr

			return True

	def create_fundraiser_with_profile(self):
		profile, created = Profile.objects.get_or_create(organization=self.organization)

		if created:
			profile.slug = profile.organization + "-" + str(profile.id)
			profile.save()

		fundraiser, created = Fundraiser.objects.get_or_create(
			title=self.title,
			profile=self.profile,
			description=self.description,
			status='in-process'
		)

		self.request.session['current_fundraiser'] = fundraiser.id
	


class OptionFundraiser:
	
	def get_fundraiser_by_slug(self,slug):
		try:
			fundraiser_type = FundraiserType.objects.get(slug=slug)
		except:
			fundraiser_type = None

		return fundraiser_type


class ChooseSalsasFundraiser:
	def __init__(self,request):
		self.form = request.POST or None
		self.request = request
		self.product = None
		self.quantity = None
		self.fund_type = None
		self.product_length = None


	def form_is_valid(self):
		return self.form

	def set_product_and_qty_selection(self):
		self.product   = self.form.getlist('product')
		self.quantity  = self.form.getlist('quantity')
		self.fund_type = self.form['type']
		self.product_length = len(self.product)

	def theres_no_selections_made(self):
		return self.quantity.count("0") == self.product_length
	
	
	def save_selections(self):
		session_shipment = SessionVariable(self.request,'current_fundraiser').session_shipment()
		
		if session_shipment:
			for i in range(self.product_length):	
				sel, created = Selection.objects.get_or_create(
					shipment=session_shipment,
					product=Product.objects.get(id=self.product[i]),
				)

				if created:
					sel.quantity = self.quantity[i]
					sel.save()
				else:	
					sel.quantity=self.quantity[i]
					sel.save()
	


class ShipmentFundraiser:
	def __init__(self,request, profile,address,billing):
		self.request = request
		self.profile_form = profile,
		self.address_form = address
		self.billing_form = billing

		self.title = None
		self.street = None 
		self.line_2 = None 
		self.city = None 
		self.state = None  
		self.zip_code = None 

		self.first_name = None 
		self.last_name = None 
		self. phone = None 
		self.email = None

		self.completed_address = None

	
	def pass_validation(self):
		return True if self.profile_form.is_valid() and self.address_form.is_valid() else False
			
	def create_address(self):
		
		address_form = self.address.cleaned_data
		profile_form = self.shipment.cleaned_data

		self.title    = address_form['title']
		self.street   = address_form['street']
		self.line_2   = address_form['line_2']
		self.city     = address_form['city']
		self.state    = address_form['state']
		self.zip_code = address_form['zip_code']

		address, created = Address.objects.get_or_create(
			title=self.title,
			street=self.street,
			line_2=self.line_2,
			city=self.city,
			state=self.state,
			zip_code=self.zip_code
		)

		if created:
			self.completed_address = address

	def fill_profile(self):
		self.first_name = profile_form['first_name']
		self.last_name  = profile_form['last_name']
		self.phone      = profile_form['phone_number']
		self.email      = profile_form['email']
		profile.address      = address
		profile.save()
		

class FundraiserCheckoutHelper:
	def __init__(self,request):
		self.request = request

	def process_stripe_payment(self,form):
		pass

	def process_discount(self):
		pass






