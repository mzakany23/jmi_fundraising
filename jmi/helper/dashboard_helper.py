from fundraiser.models import Fundraiser, FundraiserType
from product.models import Product,Category
from marketing.models import GenericDiscount, SingleDiscount
from shipment.models import Shipment,Selection
from payment.models import Payment
from comment.models import FundraiserOrderComment 
from address.models import Address

from helper.initialize_helper import SessionVariable

class ProductHelper(object):
	def all_products(self):
		try:
			products = Product.objects.all()
		except:
			products = None
		return products

class FundraiserHelper(object):
	def all_fundraisers(self):
		try:
			fundraisers = Fundraiser.objects.all()
		except:
			fundraisers = None
		return fundraisers

	def fundraisers_that_need_shipped(self):
		try:
			fundraisers = Payment.objects.filter(type='credit')
		except:
			fundraisers = None
		
		return fundraisers

class DashboardHelper(ProductHelper,FundraiserHelper):
	def __init__(self):
		super(DashboardHelper,self).__init__()