import stripe
from rest_framework.views import APIView
from django.http import Http404

from django.shortcuts import HttpResponseRedirect
from django.core.urlresolvers import reverse

from helper.initialize_helper import SessionVariable
from payment.models import Payment
from comment.models import FundraiserOrderComment
from jmi.env_var import STRIPE_API_KEY

from rest_framework.response import Response
from rest_framework import status
from serializers import FundraiserFormSerializer

class TrackEmailOrder(APIView):
	def get(self,request,format=None):
		print request.GET['token']
		return Response('Success',status=status.HTTP_200_OK)

class FundraiserProcessView(APIView):
	
	def post(self,request,format=None):
		session            = SessionVariable(request,'current_fundraiser')
		session_fundraiser = session.session_fundraiser()
		session_shipment   = session.session_shipment()

		post     = request.POST
		check    = post['type'] == 'check'
		credit   = post['type'] == 'credit'
		comment  = post['comment']
		response = None 

		if check:
			if session_fundraiser:
				comment_form,created = FundraiserOrderComment.objects.get_or_create(fundraiser=session_fundraiser,comment=comment)
				if created:
					session_shipment.comment = comment_form
					session_shipment.save()
				payment = Payment.objects.create(type='check')
				payment.fundraiser = session_fundraiser
				session_fundraiser.status = 'unpaid'
				session_fundraiser.finalized = True
				payment.save()
				session_fundraiser.save()

				response = Response('Success', status=status.HTTP_200_OK)
		elif credit:
			
			stripe.api_key = STRIPE_API_KEY['key']

			token                 = post['token']
			amount                = post['amount']
			description           = post['description'] 
			transaction_succeeded = False

		
			try:
				charge = stripe.Charge.create(
					amount=1000, # amount in cents, again
					currency="usd",
					source=token,
					description=description
			  	)
			  	transaction_succeeded = True

			except stripe.error.CardError, e:

			  	pass

			# if session fundraiser exists and payment was successful:
			# then create a payment and set the fundraise blah blah blah
			if session_fundraiser and transaction_succeeded:
				payment = Payment.objects.create(type='credit')
				payment.fundraiser = session_fundraiser
				response = Response('Success', status=status.HTTP_200_OK)
		else:
			response = Response('Error', status=status.HTTP_200_OK)

		
		return response



