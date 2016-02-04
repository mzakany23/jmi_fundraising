# djangorest
from rest_framework.response import Response
from rest_framework import status
from rest_framework.views import APIView
from rest_framework.authentication import SessionAuthentication
from rest_framework.permissions import IsAuthenticated

# app
from product.models import Product,Category

# serializers
from serializers import ProductSerializer

# helper
from api.helper.model_helper import ModelHelper


class APIProductList(APIView):
	authentication_classes = (SessionAuthentication,)
	permission_classes = (IsAuthenticated,)

	def get(self,request):
		helper = ModelHelper()
	
		categories = Category.objects.all()
		products_by_category = {}

		for category in categories:
			serializer_class = ProductSerializer
			product_list = ProductSerializer(category.product_set.all(),many=True).data
			products_by_category[str(category.title)] = product_list
	
		return Response(products_by_category)

class QueryProductView(APIView):
	
	def get(self,request,id):
		try:
			product = Product.objects.get(id=id)
		except: 
			product = None

		serializer_class = ProductSerializer()
		serializer = ProductSerializer(product)
		return Response(serializer.data)

