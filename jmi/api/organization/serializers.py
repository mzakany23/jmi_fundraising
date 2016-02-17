from rest_framework import serializers, routers, viewsets,permissions
from organization.models import Organization,OrganizationType

class OrganizationTypeSerializer(serializers.ModelSerializer):
	class Meta:
		model = OrganizationType
		
	


class OrganizationsSerializer(serializers.ModelSerializer):
	class Meta:
		model = Organization
		
	

