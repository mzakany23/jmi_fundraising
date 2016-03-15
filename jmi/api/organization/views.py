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

		try:

			contacts_length = int(form['contactsLength'])
			addresses_length = int(form['addressesLength'])

			# add organization detail to object
			number_of_emp = form['number_of_employees']
			info = form['info']
			org_name = form['name']
			org_type,created = OrganizationType.objects.get_or_create(name=form['type'])
			
			
			organization,created = Organization.objects.get_or_create(
				type=org_type,
				name=org_name,
				number_of_employees=number_of_emp,
				info=info,
			)

			# add contacts to organization object
			for contact_i in range(0,contacts_length):
				try:
					contact_id = form['contacts[0][id]']
				except:
					contact_id = None
				if contact_id:
					contact = Contact.objects.get(id=int(contact_id))
					contact.organization = organization
					contact.save()

			# add addresses to organization object
			for address_i in range(0,addresses_length):
				type = form['addresses[%s][typeField]' % address_i]
				if type == 'Shipping': 
					shipping = True
					billing = False
				else:
					shipping = False
					billing = True

				address,created = Address.objects.get_or_create(
					organization=organization,
					business_address=True,
					shipping=shipping,  
					billing=billing,   
					title=form['addresses[%s][titleField]'% address_i] ,     
					street=form['addresses[%s][titleField]' % address_i],    
					line_2=form['addresses[%s][line2Field]'% address_i] ,	  
					city=form['addresses[%s][cityField]'% address_i] ,	  
					state=form['addresses[%s][stateSelect]'% address_i] ,     
					zip_code=form['addresses[%s][zipField]'% address_i] ,    
				)
				

			return Response('You have Successfully created an Organization')
		except:
			return Response('There was a problem creating the organization')



