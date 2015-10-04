from product.models import Product
from serializers import ProductSerializer
from rest_framework.response import Response
from rest_framework import status
from rest_framework.views import APIView



class QueryProductView(APIView):
	
	def get(self,request,id):
		try:
			product = Product.objects.get(id=id)
		except: 
			product = None

		serializer_class = ProductSerializer()
		serializer = ProductSerializer(product)
		return Response(serializer.data)

