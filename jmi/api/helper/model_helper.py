from fundraiser.models import FundraiserType,Fundraiser
from account.models import Profile 
from product.models import Product,Category
from fundraiser.models import Fundraiser
from api.product.serializers import ProductSerializer

class ProductHelper():
	def get_serialized_products__by_category(self):
		categories = Category.objects.all()
		products_by_category = {}
		for category in categories:
			serializer_class = ProductSerializer
			product_list = ProductSerializer(category.product_set.all(),many=True).data
			products_by_category[category] = product_list
		return products_by_category

class FundraiserTypesHelper():
	def fundraiser_types(self):
		try:
			fundraiser_types = FundraiserType.objects.all()
		except:
			fundraiser_types = None
		return fundraiser_types

class FundraiserHelper():
	def get_fundraiser_by_profile(self,profile):
		try:
			fundraiser = Fundraiser.objects.get(profile=profile)
		except:
			fundraiser = None
		return fundraiser
	
	def filter_by_id(self,request,id):
		
		try:
			id = request.GET['filter']
			profile = Profile.objects.get(id=id)
		except:
			id = None
			profile = None
		
		try:
			fundraisers = Fundraiser.objects.filter(profile=profile)
		except:
			fundraisers = None

		if profile and fundraisers:
			return fundraisers
		else:
			return None

class ProfileHelper():
	def organizations(self):
		try:
			profiles = Profile.objects.all().order_by('organization')
		except:
			profiles = None 
		return profiles
	
	def title_param(self,request):
		try:
			title = request.GET['title']
		except:
			title = None
		return title

	def get_by_title(self,title):
		try:
			profile = Profile.objects.get(organization=title)
		except:
			profile = None
		return profile

	def get_by_id(self,id):
		try:
			profile = Profile.objects.get(id=id)
		except:
			profile = None 
		return profile

class ModelHelper(object,FundraiserTypesHelper,ProfileHelper,FundraiserHelper,ProductHelper): pass