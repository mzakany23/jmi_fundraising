# rest
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

# serializers
from serializers import OrganizationTypeSerializer,OrganizationsSerializer
from api.contact.serializers import ContactSerializer

# helper
from api.helper.model_helper import ModelHelper

class APIOrganizationTypes(APIView):
	def get(self,request,format=None):
		types = ModelHelper().get_organization_types()
		serialized_types = OrganizationTypeSerializer(types,many=True).data
		return Response(serialized_types)

class APIOrganizationsList(APIView):
	def get(self,request,format=None):
		organizations = ModelHelper().get_organizations()
		serlialized_orgs = OrganizationsSerializer(organizations,many=True).data
		return Response(serlialized_orgs)

class APIOrganizationById(APIView):
	def get(self,request,id):
		organization = ModelHelper().get_organization_by_id(id)
		serlialized_org = OrganizationsSerializer(organization).data
		return Response(serlialized_org)

class APIOrganizationsContacts(APIView):
	def get(self,request,id):
		contacts = ModelHelper().get_organization_contacts(id)
		serlialized_contacts = ContactSerializer(contacts,many=True).data
		return Response(serlialized_contacts)
