# django
from rest_framework.authentication import SessionAuthentication,BasicAuthentication
from rest_framework import serializers, permissions, pagination
from rest_framework.views import APIView
from django.http import Http404
from rest_framework.response import Response

# app
from fundraiser.models import Fundraiser, FundraiserCategory, FundraiserType
from account.models import Profile
from django.contrib.auth.models import User
from address.models import Address
from product.models import Product
from shipment.models import Shipment,Selection

class FundraiserTypeSerializer(serializers.ModelSerializer):
	class Meta:
		model = FundraiserType
		fields = ['id','image','title']

class ProductSerializer(serializers.ModelSerializer):
	class Meta:
		model = Product

class SelectionsSerializer(serializers.ModelSerializer):
	product = ProductSerializer()
	class Meta:
		model = Selection
		fields = [
			'id',
			'quantity',
			'shipment',
			'product'
		]

class AddressSerializer(serializers.ModelSerializer):
	class Meta:
		model = Address

class ProfileSerializer(serializers.ModelSerializer):
	contact_full_name = serializers.SerializerMethodField('get_full_name')

	def get_full_name(self,profile):
		return "%s %s" % (profile.first_name,profile.last_name)

	address = AddressSerializer()
	class Meta:
		model = Profile
		fields = [
			'id',
			'organization',
			'contact_full_name',
			'first_name',
			'last_name',
			'phone_number',
			'email',
			'slug',
			'org_photo',
			'address',
			'stripe_id',
		]


# this is the options field in fundraiser serializer
class FundraiserCategorySerializer(serializers.ModelSerializer):
	selections = SelectionsSerializer(many=True)

	class Meta:
		model = FundraiserType
		fields = [
			'jar_price',
			'image',
			'title',
			'selections',
			'order'
		]


class FundraiserCategorySerializer(serializers.ModelSerializer):
	# options = FundraiserCategorySerializer(many=True)
	
	class Meta:
		model = FundraiserCategory
		fields = [
			'name',
			'title',
		]

class ShipmentSerializer(serializers.ModelSerializer):
	address = AddressSerializer()
	class Meta:
		fields = [
			'address',
			'comment'
		]
		model = Shipment


class FundraisersSerializer(serializers.ModelSerializer):
	profile = ProfileSerializer()
	plan = FundraiserCategorySerializer()
	type = serializers.StringRelatedField()
	shipments = serializers.SerializerMethodField('get_the_shipments')
	selections = serializers.SerializerMethodField('get_the_selections')

	def get_the_selections(self,fundraiser):
		try:
			shipment = Shipment.objects.get(fundraiser=fundraiser)
			selections = shipment.selection_set.all().filter(quantity__gt=0)
		except:
			shipment = None
			selections = None


		serializer_class = SelectionsSerializer
		serializer = SelectionsSerializer(selections,many=True)
		
		return serializer.data

	def get_the_shipments(self, fundraiser):
		try:
			shipments = Shipment.objects.get(fundraiser=fundraiser)
		except:
			shipments = None

		serializer_class = ShipmentSerializer
		serializer = ShipmentSerializer(shipments)
		
		return serializer.data

	class Meta:
		model = Fundraiser
		fields = [
			'id',
			'title',       
			'description',
			'plan',        
			'type',        
			'status',
			'finalized',
			'profile',      
			'created',      
			'updated',      
			'discount',     
			'receipt_email_sent',
			'shipments',
			'selections'
		]
