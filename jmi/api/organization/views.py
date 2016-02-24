# rest
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

# serializers
from serializers import OrganizationTypeSerializer,OrganizationsSerializer
from api.contact.serializers import ContactSerializer

# helper
from api.helper.model_helper import ModelHelper

# models
from contact.models import Contact,ContactType
from address.models import Address
from organization.models import Organization,OrganizationType

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

class APIOrganizationsCreate(APIView):
	def post(self,request):
		form = request.POST

		contacts_length = int(form['contactsLength'])
		addresses_length = int(form['addressesLength'])

		# organization
		print form['type']
		print form['name']
		print form['number_of_employees']
		print form['info']
		# print form['created']

		print form['parentOrg']
		print form['child_organizations']
		print form['sibling_organizations']

		# # contact
		# for i in range(0,contacts_length):

		# 	print form['contacts[%s][type]' % (i)]
		# 	print form['contacts[%s][organization]' % (i)]
		# 	print form['contacts[%s][first_name]' % (i)]
		# 	print form['contacts[%s][last_name]' % (i)]
		# 	print form['contacts[%s][age]' % (i)]
		# 	print form['contacts[%s][job_title]' % (i)]
		# 	print form['contacts[%s][phone1]' % (i)]
		# 	print form['contacts[%s][phone2]' % (i)]
		# 	print form['contacts[%s][phone3]' % (i)]
		# 	print form['contacts[%s][email1]' % (i)]
		# 	print form['contacts[%s][email2]' % (i)]
		# 	print form['contacts[%s][email3]' % (i)]
		# 	print form['contacts[%s][info]' % (i)]
		# 	print form['contacts[%s][created]' % (i)]

		# for i in range(0,addresses_length):
		# # addresses
		# 	print form['addresses[%s][organization]' % (i)]
		# 	print form['addresses[%s][business_address]' % (i)]
		# 	print form['addresses[%s][shipping]' % (i)]
		# 	print form['addresses[%s][billing]' % (i)]
		# 	print form['addresses[%s][title]' % (i)]
		# 	print form['addresses[%s][street]' % (i)]
		# 	print form['addresses[%s][line_2]' % (i)]
		# 	print form['addresses[%s][city]' % (i)]
		# 	print form['addresses[%s][state]' % (i)]
		# 	print form['addresses[%s][zip_code]' % (i)]
		# 	print form['addresses[%s][country]' % (i)]
		

		return Response('ok test')