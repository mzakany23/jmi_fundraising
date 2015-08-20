import stripe
from rest_framework.views import APIView
from django.http import Http404

from django.shortcuts import HttpResponseRedirect
from django.core.urlresolvers import reverse

from helper.initialize_helper import SessionVariable
from payment.models import Payment

from rest_framework.response import Response
from rest_framework import status
from serializers import FundraiserFormSerializer

class FundraiserProcessView(APIView):
	
	def post(self,request,format=None):
		session_fundraiser = SessionVariable(request,'current_fundraiser').session_fundraiser()
		post   = request.POST
		check  = post['type'] == 'check'
		credit = post['type'] == 'credit'

		response = None 

		if check:
			if session_fundraiser:
				payment = Payment.objects.create(type='check')
				payment.fundraiser = session_fundraiser
				fundraiser.status = 'unpaid'
				fundraiser.finalized = True
				payment.save()
				fundraiser.save()

				response = Response('Success', status=status.HTTP_200_OK)
		elif credit:
			
			# use stripe to charge the card
			# get the last 4 of the card to store
			# get the card type
			# get stripe id i think

			token = post['token']
			
			# if session fundraiser exists and payment was successful:
			# then create a payment and set the fundraise blah blah blah
			if session_fundraiser:

				# payment = Payment.objects.create(type='credit')
				# payment.fundraiser = session_fundraiser
				response = Response('Success', status=status.HTTP_200_OK)
		else:
			response = Response('Error', status=status.HTTP_200_OK)

		
		return response



