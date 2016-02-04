from rest_framework import serializers, routers, viewsets,permissions
from account.models import Profile
from address.models import Address

class AddressSerializer(serializers.ModelSerializer):
	class Meta:
		model = Address 

class ProfileSerializer(serializers.ModelSerializer):
	address = AddressSerializer()
	title = serializers.SerializerMethodField('make_title')

	def make_title(self,profile):
		return profile.organization

	class Meta:
		model = Profile
		fields = ['id','title','organization','first_name','last_name','phone_number','email','org_photo','address','account']	

	

