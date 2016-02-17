from rest_framework import serializers, routers, viewsets,permissions
from contact.models import Contact,ContactType
from api.organization.serializers import OrganizationsSerializer

class ContactTypeSerializer(serializers.ModelSerializer):
	class Meta:
		model = ContactType

class ContactSerializer(serializers.ModelSerializer):
	type = ContactTypeSerializer()
	organization = OrganizationsSerializer()

	class Meta:
		model = Contact
		fields = [
			'id',
			'type',
			'organization',
			'first_name',
			'last_name',
			'age',
			'job_title',
			'phone1',
			'phone2',
			'phone3',
			'email1',
			'email2',
			'email3',
			'info',
		]
		

	

