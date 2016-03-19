# python
import stripe
import math
import json

# djangorest
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from serializers import FundraisersSerializer
from rest_framework.authentication import SessionAuthentication
from rest_framework.permissions import IsAuthenticated

# django
from django.http import Http404
from django.shortcuts import HttpResponseRedirect
from django.core.urlresolvers import reverse
from helper.initialize_helper import SessionVariable

# app
from fundraiser.models import Fundraiser
from payment.models import Payment
from comment.models import FundraiserOrderComment
from serializers import FundraiserTypeSerializer
from jmi.env_var import STRIPE_API_KEY
from api.helper.model_helper import ModelHelper
from django.core.paginator import Paginator
from shipment.models import Shipment,Selection

# helper
from api.helper.generics.api_manager import APIGenericGenerator

class APIFundrasierCreate(APIView):
	def post(self,request):
		data = request.POST
		try:
			# right now only has one address used in profile
			profile = json.loads(data['profile'])

			# multiple selections
			selections = json.loads(data['selections'])

			# plan,title,description, note
			details = json.loads(data['details'])

			# shipping notes
			shippingNote = json.loads(data['shippingNotes'])

		except:
			profile = None
			selections = None
			details = None

		if profile and selections and details:
			# fudraiser,created = Fundraiser.objects.get_or_create()

			# organizations = None
			# title = None
			# description = None
			# plan = None
			# type = None
			# status = None
			# finalized = None
			# profile = None
			# account = None
			# created = None
			# updated = None
			# discount = None
			# slug = None
			# receipt_email_sent = None


			# shipment = Shipment
			# shippingNote
			# print profile

			return Response('ok works')

		return Response('test')

class FundraiserTypesView(APIView):
	def get(self,request):
		types = ModelHelper().fundraiser_types()
		if types:
			serializer_class = FundraiserTypeSerializer 
			serialized_types = FundraiserTypeSerializer(types,many=True).data
			return Response(serialized_types,status=status.HTTP_200_OK)
		return Response('Failure',status=status.HTTP_404_NOT_FOUND)

class FundraiserBySlugViewSet(APIView):
	def get(self,request,id):
		try:
			fundraiser = Fundraiser.objects.get(id=id)			
		except:
			fundraiser = None

		serializer_class = FundraisersSerializer
		serializer = FundraisersSerializer(fundraiser)

		if fundraiser:
			return Response(serializer.data,status=status.HTTP_200_OK)
		return Response('There was a problem',status=status.HTTP_404_NOT_FOUND)

# /api/fundraisers/all
class APIAllFundraisers(APIView):
	authentication_classes = (SessionAuthentication,)
	permission_classes = (IsAuthenticated,)
	
	def get(self,request):
		fundraisers = ModelHelper().filter_by_id(request,id)

		if fundraisers:
			return Response(FundraisersSerializer(fundraisers,many=True).data,status=status.HTTP_200_OK)
		return Response('Failure',status=status.HTTP_404_NOT_FOUND)

		fundraisers = APIGenericGenerator(model=Fundraiser,serializer=FundraisersSerializer)
		return Response(fundraisers.list(sort='-created'),status=status.HTTP_200_OK)

# /api/fundraisers
class FundraisersViewSet(APIView):
	authentication_classes = (SessionAuthentication,)
	permission_classes = (IsAuthenticated,)

	def get(self,request):
		fundraisers = APIGenericGenerator(model=Fundraiser,serializer=FundraisersSerializer)
		return Response(fundraisers.list_paginated_results(request,sort='-created'),status=status.HTTP_200_OK)
		

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

		comment_form,created = FundraiserOrderComment.objects.get_or_create(fundraiser=session_fundraiser,comment=comment)
		
		if created:
			session_shipment.comment = comment_form
			session_shipment.save()

		if check:
			if session_fundraiser:
				payment = Payment.objects.create(type='check')
				payment.fundraiser = session_fundraiser
				session_fundraiser.status = 'unpaid'
				session_fundraiser.finalized = True
				payment.save()
				session_fundraiser.save()

				return Response('Success', status=status.HTTP_200_OK)
		elif credit:
			
			stripe.api_key = STRIPE_API_KEY['key']

			token                 = post['token']
			amount                = float(post['amount'])
			description           = post['description'] 
			transaction_succeeded = False

			amount_in_cents = (int(amount*100))
			
			try:
				charge = stripe.Charge.create(
					amount=amount_in_cents, # amount in cents, again
					currency="usd",
					source=token,
					description=description
			  	)

			  	transaction_succeeded = True

			except stripe.error.CardError, e:
				return Response(e,status=status.HTTP_404_NOT_FOUND)

			# if session fundraiser exists and payment was successful:
			# then create a payment and set the fundraiser
			if session_fundraiser and transaction_succeeded:
				payment = Payment.objects.create(type='credit')
				payment.fundraiser = session_fundraiser
				session_fundraiser.status = 'paid'
				session_fundraiser.finalized = True
				last_4 = charge['card']['last4']
				card_type = charge['card']['brand']
				payment.last_4 = last_4
				payment.card_type = card_type
				payment.stripe_id = charge['balance_transaction']
				payment.save()
				session_fundraiser.save()
				return Response('Success', status=status.HTTP_200_OK)
		
		return Response('failure is not credit or check',status=status.HTTP_404_NOT_FOUND)
		
		



