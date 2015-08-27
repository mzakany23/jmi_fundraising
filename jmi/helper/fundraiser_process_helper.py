from fundraiser.models import Fundraiser, FundraiserType
from account.models import Profile
from shipment.models import Shipment, Selection
from product.models import Product
from address.models import Address

from django.utils.text import slugify
from django.contrib import messages
from django.shortcuts import render, HttpResponseRedirect
from django.core.urlresolvers import reverse

from initialize_helper import SessionVariable
from product.models import Category

class DescribeFundraiser:
	def __init__(self,request,form):
		self.request = request
		self.describe_form = form
		self.title = None
		self.organization = None
		self.description = None
		self.profile = None
		self.org_photo = None

	def form_is_valid(self):
		return self.describe_form.is_valid()

	def fundraiser_is_unique(self,**kwargs):
		title = kwargs['title']
		organization = kwargs['organization']
		description = kwargs['description']
		try:
			org_photo = kwargs['org_photo']
		except:
			org_photo = None

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
			self.org_photo = org_photo

			return True

	def create_fundraiser_with_profile(self):
		profile, created = Profile.objects.get_or_create(organization=self.organization)
		session = SessionVariable(self.request)
		if created:	
			if session.user_is_logged_in():
				profile.account = session.user()
			profile.slug = (slugify(profile.organization) + "-" + str(profile.id)).lower()
			profile.org_photo = self.org_photo
			profile.save()
			self.profile = profile

		fundraiser, created = Fundraiser.objects.get_or_create(
			title=self.title,
			profile=self.profile,
			description=self.description,
			status='in-process'
		)

		if created:
			if session.user_is_logged_in():
				fundraiser.account = session.user()
				fundraiser.slug = slugify(fundraiser.title)+'-'+str(fundraiser.id)
				fundraiser.save()
				
		self.request.session['current_fundraiser'] = fundraiser.id
		self.request.session['session_finalized_order'] = fundraiser.id

class ProductSetHelper:
	def __init__(self,slug=None):
		self.slug = slug

	def get_category(self):
		try:
			category = Category.objects.get(slug=self.slug)
		except:
			category = None
		return category
			
	def categories(self):
		try:
			categories = Category.objects.all()
		except:
			categories = None
		return categories

	def products_by_category(self):
		try:
			category = Category.objects.get(slug=self.slug)
			products = Product.objects.filter(category=category)
		except:
			products = None 
		return products

	def all(self):
		try:
			products = Product.objects.all()
		except:
			products = None
		return products 

	def all_by_category(self):
		product_set = {}
		products = Product.objects.all()
	
		for product in products:
			category = product.category.first()
			keys     = product_set.keys()
			if category in keys:
				product_set[category].append(product)
			else:
				product_set[category] = []
				product_set[category].append(product)

		return product_set


class OptionFundraiser:
	def __init__(self,slug=None):
		self.slug = slug 

	def generate_product_set_by_category(self):
		product_set = {}
		fundraiser_type = self.get_fundraiser_by_slug()
		
		for product in fundraiser_type.selections.all():
			try:
				category = product.category.first()
			except: 
				category = None 

			if category and category in product_set.keys():
				product_set[category].append(product)
			elif category and not category in product_set.keys():
				product_set[category] = []
				product_set[category].append(product)
		
		return product_set



	def get_fundraiser_by_slug(self,):
		try:
			fundraiser_type = FundraiserType.objects.get(slug=self.slug)
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







