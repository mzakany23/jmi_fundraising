import sys
import sendgrid
from env_email import SENDGRID
from fundraiser.models import FundraiserType

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
			self.type = kwargs['type']
		except: 
			self.type = None

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

		# if self.type:
		# 	try:
		# 		ft = FundraiserType.objects.get(id=int(self.type))		
		# 	except:
		# 		ft = None

		# 	print ft.forms
		# 	message.add_attachment(self.form, self.form)

		status, msg = sg.send(message)
		print msg
