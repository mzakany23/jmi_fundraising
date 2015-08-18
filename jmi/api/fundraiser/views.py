import stripe
from rest_framework.views import APIView
from django.http import Http404

from rest_framework.response import Response
from rest_framework import status
from serializers import FundraiserFormSerializer

class FundraiserProcessView(APIView):
	
	def post(self,request,format=None):
		print 'hello'
		post   = request.POST
		check  = post['type'] == 'check'
		credit = post['type'] == 'credit'

		if check:
			# mark the fundraiser as check order
			# mark as unpaid
			pass
		elif credit:
			# mark the fundraiser as credit
			# update the payment object
			token = post['token']

			# charge card
			# send email confirm
			# save anything else to the fundraiser

		response = Response('Success', status=status.HTTP_200_OK)
		return response



