from rest_framework import serializers, routers, viewsets,permissions
from account.models import Profile
from address.models import Address
from django.contrib.auth.models import User

class UserSerializer(serializers.ModelSerializer):
	class Meta:
		model = User
		fields = [
			"is_superuser", 
	        "username",
	        "first_name",
	        "last_name",
	        "email",
	        "is_staff",
	        "is_active",
	        "date_joined",
	        "groups",
	        "user_permissions",
		]

class AddressSerializer(serializers.ModelSerializer):
	class Meta:
		model = Address 

class ProfileSerializer(serializers.ModelSerializer):
	address = AddressSerializer()
	account = UserSerializer()

	title = serializers.SerializerMethodField('make_title')

	def make_title(self,profile):
		return profile.organization

	class Meta:
		model = Profile
		fields = ['id','title','organization','first_name','last_name','phone_number','email','org_photo','address','account']	

	

