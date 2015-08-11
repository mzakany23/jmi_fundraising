from rest_framework.authentication import SessionAuthentication,BasicAuthentication
from rest_framework import serializers, routers, viewsets,permissions

from rest_framework.views import APIView
from django.http import Http404
from rest_framework.response import Response


# serializer the viewset
class FundraiserFormSerializer(serializers.HyperlinkedModelSerializer):
	pass

	

