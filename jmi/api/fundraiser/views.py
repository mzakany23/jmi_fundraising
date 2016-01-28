# python
import stripe
import math

# djangorest
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from serializers import FundraisersSerializer

# django
from django.http import Http404
from django.shortcuts import HttpResponseRedirect
from django.core.urlresolvers import reverse
from helper.initialize_helper import SessionVariable

# app
from fundraiser.models import Fundraiser
from payment.models import Payment
from comment.models import FundraiserOrderComment
from jmi.env_var import STRIPE_API_KEY

from django.core.paginator import Paginator

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


class FundraisersViewSet(APIView):
	
	def get(self,request):
		try:
			page_num = int(request.GET['page'])
			
			if page_num < 1:
				page_num = 1

			try:
				results_per_page = int(request.GET['results'])
			except:
				results_per_page = 10
			# results_per_page = 10
		except:
			page_num = 1
			results_per_page = 10

		try:
			fundraisers = Fundraiser.objects.all().order_by('-created')
		except:
			fundraisers = None

		paginator = Paginator(fundraisers, results_per_page)
		page = paginator.page(page_num)
			
		max_pages = int(math.ceil(float(paginator.object_list.count())/float(results_per_page)))
		
		pagination = {
			'description' : str(page),
			'pages' : str(results_per_page),
			'current_page' : str(page.number),
			'start_index' : str(page.start_index()),
			'end_index' : str(page.end_index()),
			'total_records' : str(paginator.object_list.count()),
			'has_next' : str(page.has_next()),
			'max_pages' : str(max_pages)
		}

		serializer_class = FundraisersSerializer()

		serializer = FundraisersSerializer(page,many=True)
		
		return Response({'results':serializer.data,'pagination': pagination},status=status.HTTP_200_OK)

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

				response = Response('Success', status=status.HTTP_200_OK)
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

			  	pass

			# if session fundraiser exists and payment was successful:
			# then create a payment and set the fundraise blah blah blah
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
				response = Response('Success', status=status.HTTP_200_OK)
		else:
			response = Response('Error', status=status.HTTP_200_OK)

		
		return response



