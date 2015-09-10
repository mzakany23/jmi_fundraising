from django.core.mail import send_mail


class EmailHelper:
	def __init__(self,**kwargs):
		self.subject       = kwargs['subject']
		self.message       = kwargs['message']
		self.from_email    = kwargs['from_email']
		self.to_list       = kwargs['to_list']
		self.fail_silently = False
		
		try:
			self.html_message = kwargs['html_message']
		except:
			self.html_message = None
		


	def send_email(self):
		message = None
		result  = None
		try:
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

