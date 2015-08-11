from django.shortcuts import render

from rest_framework.views import APIView
from django.http import Http404
from rest_framework.response import Response
from rest_framework import status

from serializers import FundraiserFormSerializer

class FundraiserProcessView(APIView):

	def post(self,request,format=None):
		print request.POST
		response = Response('ok', status=status.HTTP_200_OK)
		return response



