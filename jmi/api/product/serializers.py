from rest_framework.authentication import SessionAuthentication,BasicAuthentication
from rest_framework import serializers, routers, viewsets,permissions
from product.models import Product

from rest_framework.views import APIView
from django.http import Http404
from rest_framework.response import Response


class ProductSerializer(serializers.ModelSerializer):
	category = serializers.StringRelatedField(many=True)
	class Meta:
		model = Product
		fields = ['id','image','title','description','category','price']