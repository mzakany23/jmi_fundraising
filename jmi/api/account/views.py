# python 
import math

# djangorest
from rest_framework.response import Response
from rest_framework import status
from rest_framework.authentication import SessionAuthentication
from rest_framework.permissions import IsAuthenticated

# django
from django.core.paginator import Paginator

# forms
from api.forms.address import APIAddressForm
from api.forms.profile import APIProfileForm

# app
from rest_framework.views import APIView

# models
from address.models import Address 
from account.models import Profile

# serializers
from serializers import ProfileSerializer

# helpers
from api.helper.model_helper import ModelHelper
from api.helper.form_helper import FormHelper
from api.helper.generics.api_manager import APIGenericGenerator

# test 
class APITest(APIView):
	def get(self,request):
		return Response('test get')

	def post(self,request):
		print request.FILES
		return Response('test post')

# list
class APIProfileView(APIView):
	authentication_classes = (SessionAuthentication,)
	permission_classes = (IsAuthenticated,)

	def get(self,request,format=None):
		# query params
		title = ModelHelper().title_param(request)
		if title:
			profile = ModelHelper().get_by_title(title)
			if profile:
				serializer_class = ProfileSerializer 
				serialized_profile = ProfileSerializer(profile).data
				return Response(serialized_profile,status=status.HTTP_200_OK)
			else:
				return Response('There was no title matching that query param')
		
		profiles = APIGenericGenerator(model=Profile,serializer=ProfileSerializer)
		
		return Response(profiles.list(),status=status.HTTP_200_OK)

class APIPaginatedProfilesView(APIView):
	authentication_classes = (SessionAuthentication,)
	permission_classes = (IsAuthenticated,)

	def get(self,request):
		profiles = APIGenericGenerator(model=Profile,serializer=ProfileSerializer)
		return Response(profiles.list_paginated_results(request,sort='organization'))
		
# update
class APIProfileUpdateView(APIView):
	authentication_classes = (SessionAuthentication,)
	permission_classes = (IsAuthenticated,)
	
	def post(self,request,id):
		id = int(id)
		form_helper = FormHelper(request)
		address_form = form_helper.get_address_form()
		profile_form = form_helper.get_profile_form()
		
		if address_form.is_valid() and profile_form.is_valid():

			profile,updated = form_helper.update_profile(id)
			
			if updated:
				serializer_class = ProfileSerializer
				serialized_profile = ProfileSerializer(profile).data
				return Response(serialized_profile,status=status.HTTP_200_OK)
			else:
				return Response('Failure to update',status=status.HTTP_404_NOT_FOUND)
		else:
			return Response({
				'profile_errors' : profile_form.errors,
				'address_errors' : address_form.errors
			},status=status.HTTP_404_NOT_FOUND)
			
		return Response('in progress')


# create
class APIProfileCreateView(APIView):
	authentication_classes = (SessionAuthentication,)
	permission_classes = (IsAuthenticated,)
	
	def post(self,request):
		form_helper = FormHelper(request)
		address_form = form_helper.get_address_form()
		profile_form = form_helper.get_profile_form()

		if address_form.is_valid() and profile_form.is_valid():
			
			address,created = Address.objects.get_or_create(
				title=address_form.cleaned_data['title'],
				street=address_form.cleaned_data['street'],
				city=address_form.cleaned_data['city'],
				state=address_form.cleaned_data['state'],
				zip_code=address_form.cleaned_data['zip']
			)

			profile,created = Profile.objects.get_or_create(
				organization=profile_form.cleaned_data['organization'],
				first_name=profile_form.cleaned_data['firstName'],
				last_name=profile_form.cleaned_data['lastName'],
				phone_number=profile_form.cleaned_data['phoneNumber'],
				email=profile_form.cleaned_data['email'],
				address=address
			)
			
			serializer_class = ProfileSerializer
			serialized_profile = ProfileSerializer(profile).data

			return Response(serialized_profile,status=status.HTTP_200_OK)

		else:

			return Response({
				'profile_errors' : profile_form.errors,
				'address_errors' : address_form.errors
			},status=status.HTTP_404_NOT_FOUND)
		

		return Response('nothing to report')
