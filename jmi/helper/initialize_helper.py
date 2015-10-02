from django.conf import settings

from fundraiser.models import Fundraiser, FundraiserType
from account.models import Profile
from shipment.models import Shipment, Selection
from product.models import Product
from address.models import Address

'''
	to access everything except the session fundraiser
	session = SessionVariable(request)
	to access everything
	session = SessionVariable(request,'current_fundraiser')
'''

class SessionUser(object):
	def __init__(self,request):
		self.request = request
		
	def user(self):
		try:
			user = self.request.user 
		except:
			user = None 
		return user
	def logo(self):
		return settings.LOGO 

	def get_first_profile_image_absoulute_url(self):
		if self.profiles():
			return self.profiles()[0].get_absolute_url()
		else:
			return settings.PLACEHOLDER_PIC

	def user_has_fundraiser(self):
		return True if self.fundraisers() else False

	def fundraisers(self):
		try:
			fundraisers = self.profile().fundraiser_set.all()
			print fundraisers
		except:
			fundraisers = None
		return fundraisers

	def profiles(self):
		return self.__get_profiles()

	def shipments(self):
		pass

	def user_has_a_profile(self):
		return True if self.profiles() else False

	def user_is_logged_in(self):
		return self.user().is_authenticated()

	def user_has_address(self):
		return self.profile().address

	
	# private
	def __get_profiles(self):
		try:
			profiles = Profile.objects.filter(account=self.user())
		except:
			profiles = None 
		return profiles

class SessionFundraiser(object):
	def __init__(self,request):
		self.request = request

	def session_fundraiser(self):
		try:
			session_fundraiser = Fundraiser.objects.get(id=self.request.session[self.svn])
		except:
			session_fundraiser = None

		return session_fundraiser

	def session_finalized_fundraiser(self):
		try:
			session_fundraiser = Fundraiser.objects.get(id=self.request.session['finalized_order'])
		except:
			session_fundraiser = None
		return session_fundraiser
		
	def session_fundraiser_profile(self):
		try:
			profile = self.session_fundraiser().profile
		except:
			profile = None
		return profile

	def has_fundraiser(self):
		return True if self.session_fundraiser() else False

	def has_order_steps(self):
		try:
			order_step = self.request.session['order_step']
		except:
			order_step = None

		return True if order_step is not None else False

	def order_step(self):
		return request.session['order_step']

	def get_product_set_by_category(self):

		try:
			fundraiser_type = self.session_fundraiser().type
			product_set = {}
		except:
			fundraiser_type = None
			product_set = None


		if fundraiser_type:
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


class SessionShipment(object):
	def session_shipment(self):
		try:
			session_shipment = Shipment.objects.get(fundraiser=self.session_fundraiser())
		except:
			session_shipment = None
		
		return session_shipment


class SessionVariable(SessionUser,SessionFundraiser,SessionShipment):
	def __init__(self,request,session_variable_name=None):
		self.request = request
		self.svn = session_variable_name
		super(SessionVariable,self).__init__(request)

	
	


	
			








	
