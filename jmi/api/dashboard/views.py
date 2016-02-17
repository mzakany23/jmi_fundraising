# rest
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

# models
from fundraiser.models import Fundraiser,FundraiserType
from product.models import Product
from account.models import Profile

class APIDashboardStats(APIView):

	def get(self,request,format=None):
		products = Product.objects.all().count()
		fundraisers = Fundraiser.objects.all().count()
		profiles = Profile.objects.all().count()
		plans = FundraiserType.objects.all().count()

		stats = {
			'product_count' : products,
			'fundraiser_count' : fundraisers,
			'profile_count' : profiles,
			'plan_count' : plans
		}
		return Response(stats,status=status.HTTP_200_OK)