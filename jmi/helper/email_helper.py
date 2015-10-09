from django.core.mail import send_mail
import reachmail
import json
import sys
import sendgrid
from env_email import EMAIL_KEY, SENDGRID

class EmailHelper:
	def __init__(self,**kwargs):
		self.subject       = kwargs['subject']
		try:
			self.message   = kwargs['message']
		except: 
			self.message   = None
		self.from_email    = kwargs['from_email']
		self.to_list       = kwargs['to_list']
		self.fail_silently = False
		
		try:
			self.form = kwargs['form']
		except: 
			self.form = None

		try:
			self.html_message = kwargs['html_message']
		except:
			self.html_message = None
		
	def send_sendgrid_html_version(self):
		sg = sendgrid.SendGridClient(SENDGRID['username'], SENDGRID['password'])
		message = sendgrid.Mail()

		message.set_headers({'X-Sent-Using': 'SendGrid-API', 'X-Transport': 'web'});
		message.add_to(self.to_list)
		message.set_from('Jose Madrid Salsa Fundraising <mike@josemadridsalsa.com>')
		message.set_subject(self.subject)
		message.set_html(self.html_message)
		
		# message.add_attachment(self.form, self.form)
		status, msg = sg.send(message)
		print msg

	def send_sendgrid(self):
		sg = sendgrid.SendGridClient(SENDGRID['username'], SENDGRID['password'])

		message = sendgrid.Mail()
		message.set_headers({'X-Sent-Using': 'SendGrid-API', 'X-Transport': 'web'});
		message.add_to(self.to_list)
		message.set_subject(self.subject)
		message.set_text(self.message)
		message.set_from('Jose Madrid Salsa Fundraising <mike@josemadridsalsa.com>')
		# message.add_attachment(self.form, self.form)
		status, msg = sg.send(message)
		print msg

	def send_email(self):
		message = None
		result  = None
		try:
			if self.html_message is None:
				send_mail(
					self.subject,
					self.message,
					self.from_email,
					self.to_list,
					self.fail_silently,	
				)
			else:
				send_mail(
					self.subject,
					self.message,
					self.from_email,
					self.to_list,
					self.fail_silently,	
					html_message=self.html_message,
				)
			message = 'email was sent successfully'
			result  = True
		except:
			message = 'there was an error sending error'
			result  = False 

		return message,result

	def getAccountGuid(self,api):
		res = api.adminsitration.users_current()
		if res[0] == 200 :
			data=json.loads(res[1]) #parse json response
			return data['AccountId']
		else:
			print "Oops. Could not find your Account Guid. \nStatus Code: %s \nResponse: %s" % (res[0], res[1])
			exit(1)

	def sendEmail(self,api, AccountId):
		body={
		'FromAddress': 'mike@josemadridsalsa.com',
		'Recipients': [
		{
			'Address': self.to_list[0]
	        },
		],
	  	'Headers': { 
			'Subject': self.subject , 
			'From': self.from_email, 
			'X-Company': 'Jose Madrid Salsa Fundraising', 
			'X-Location': 'location' 
		}, 
		'BodyText': self.message,
		'Tracking': 'true'
		}
		
		send = api.easysmtp.delivery(AccountId=AccountId, Data=body)
		
		if send[0] == 200:
			return send[1] 
		else:
			print "Could not Deliver message.  \nStatus Code: %s \nResponse: %s" % (send[0], send[1])
			exit(1)

	def send_reachmail(self):
		api = reachmail.ReachMail(EMAIL_KEY)
		AccountId=self.getAccountGuid(api)
		send=self.sendEmail(api, AccountId)
		print "Messgae Sent. \nResponse: %s" % send


