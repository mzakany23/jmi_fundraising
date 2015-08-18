from fundraiser.models import Fundraiser, FundraiserType
from account.models import Profile
from shipment.models import Shipment, Selection
from product.models import Product
from address.models import Address


class SessionVariable:
	def __init__(self,request,session_variable_name=None):
		self.request = request
		self.svn = session_variable_name

	def session_fundraiser(self):
		try:
			session_fundraiser = Fundraiser.objects.get(id=self.request.session[self.svn])
		except:
			session_fundraiser = None

		return session_fundraiser

	def session_shipment(self):
		try:
			session_shipment = Shipment.objects.get(fundraiser=self.session_fundraiser())
		except:
			session_shipment = None

		return session_shipment

	def session_fundraiser_profile(self):
		try:
			profile = self.session_fundraiser().profile
		except:
			profile = None

