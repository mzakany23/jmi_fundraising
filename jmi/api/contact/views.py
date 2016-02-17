from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.authentication import SessionAuthentication
from rest_framework.permissions import IsAuthenticated

from api.helper.model_helper import ModelHelper
from serializers import ContactSerializer,ContactTypeSerializer

from contact.models import Contact,ContactType

class APIContactTypes(APIView):
	def get(self,request,format=None):
		try:
			contact_types = ContactType.objects.all()
		except:
			contact_types = None 

		return Response(ContactTypeSerializer(contact_types,many=True).data)

class APIContactsList(APIView):
	authentication_classes = (SessionAuthentication,)
	permission_classes = (IsAuthenticated,)

	def get(self,request,format=None):
		params = request.GET 
		helper = ModelHelper()

		if 'firstName' in params:
			results = helper.filter_by_first_name(params['firstName'])
			serialized_results = ContactSerializer(results,many=True).data
			return Response(serialized_results)
		elif 'lastName' in params:
			results = helper.filter_by_last_name(params['lastName'])
			serialized_results = ContactSerializer(results,many=True).data
			return Response(serialized_results)

		return Response('Failure')


class APIContactsCreate(APIView):
	authentication_classes = (SessionAuthentication,)
	permission_classes = (IsAuthenticated,)

	def post(self,request,format=None):
		post = request.POST

		typeField            = post['typeField']
		firstNameField       = post['firstNameField']
		lastNameField        = post['lastNameField']
		email1Field          = post['email1Field']
		email2Field          = post['email2Field']
		email3Field          = post['email3Field']
		phone1Field          = post['phone1Field']
		phone2Field          = post['phone2Field']	
		phone3Field          = post['phone3Field']
		notesField           = post['notesField']
		jobTitleField        = post['jobTitleField']
		ageField             = post['ageField']		
		csrfmiddlewaretoken  = post['csrfmiddlewaretoken']

		try:
			contact_type = ContactType.objects.get(title=typeField)
		except:
			contact_type = None 

		contact,created = Contact.objects.get_or_create(
			type = contact_type,
			first_name = firstNameField,
			last_name = lastNameField,
			age = ageField,
			job_title = jobTitleField,
			phone1 = phone1Field,
			phone2 = phone2Field,
			phone3 = phone3Field,
			email1 = email1Field,
			email2 = email2Field,
			email3 = email3Field,
			info = notesField
		)

		
		return Response(ContactSerializer(contact).data)


		
		
		
		
		
		
		
		
		
		
		
		
		
		




		return Response('ok test')