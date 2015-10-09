# django
from celery import Celery
from jmi.celery_app import app
from celery.task.schedules import crontab
from celery.decorators import periodic_task
from django.utils.text import slugify

# helper
from helper.email_helper import EmailHelper
from helper.fundraiser_process_helper import DescribeFundraiser


@app.task
def send_fundraiser_receipt_email(subject,message,from_email,to_list,form=None,html_message=None):
	email_helper = EmailHelper(
		subject=subject, 
		message=message,
		from_email=from_email,
		to_list=to_list,
		form=form,
		html_message=html_message
	)
	email_helper.send_sendgrid()

@app.task
def send_password_reset_email(subject,from_email,to_list,html_message):
	email_helper = EmailHelper(
		subject=subject,
		from_email=from_email, 
		to_list=to_list,
		html_message=html_message
	)
	email_helper.send_sendgrid_html_version()
