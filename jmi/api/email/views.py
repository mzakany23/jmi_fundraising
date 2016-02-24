from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
import sendgrid
from helper.env_email import SENDGRID
from django import forms
from django.template import loader
from jmi.settings import EMAIL_TEMPLATE_DIR	
from fundraiser.models import FundraiserType

class APISendEmail(APIView):

	def post(self,request,format=None):
		email = request.POST['email'] 
		id = request.POST['id']
		plan_title = request.POST['plan']

		try:
			fundraiser_type = FundraiserType.objects.get(id=id)
		except:
			fundraiser_type = None 


		f = forms.EmailField()

		try:
			email = f.clean(email)
		except:
			email = None
		
		try:
			fundraiser_forms = fundraiser_type.fundraiserform_set.all()
		except:
			fundraiser_forms = None

		if fundraiser_type and email and email != 'user@email.com' and fundraiser_forms:
			data = {
				'option' : fundraiser_type.title,
				'plan' : plan_title
			}

			template_name  = EMAIL_TEMPLATE_DIR + 'email_forms.txt'
			text_email     = loader.render_to_string(template_name,data)

			sg = sendgrid.SendGridClient(SENDGRID['username'], SENDGRID['password'])
			message = sendgrid.Mail()

			message.set_headers({'X-Sent-Using': 'SendGrid-API', 'X-Transport': 'web'});
			message.add_to(email)
			message.set_subject('Jose Madrid Salsa Fundraising Forms')
			message.set_text(text_email)
			message.set_from('Jose Madrid Salsa Fundraising <mike@josemadridsalsa.com>')
			for form in fundraiser_forms:
				message.add_attachment(form.url, open(form.url, 'rb'))
			status, msg = sg.send(message)
			return Response('Successfully Sending email to ')
		return Response('Email is invalid to ')






