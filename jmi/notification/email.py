from django.template.loader import render_to_string, get_template
from django.core.mail import EmailMessage
from django.template import Context


class EmailHelper:
	def __init__(self,**kwargs):
		self.subject = kwargs['subject']
		self.message = kwargs['message']
		self.from_email = kwargs['from_email']
		self.to_list = kwargs['to_list']

		
	def send_html_email(self,template_html,context=None):
		message = get_template(template_html).render(Context(context))
		msg = EmailMessage(self.subject,message,self.to_list,self.from_email)
		msg.content_subtype = 'html'
		msg.send()
		
# email = EmailHelper(subject='some subject', message='some message', from_email='mzakany@gmail.com',to_list=['mzakany@gmail.com'])

# email.send_html_email('email/index.html',{'user' : 'mzakany'})
