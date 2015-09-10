from celery import Celery
from jmi.celery_app import app
from celery.task.schedules import crontab
from celery.decorators import periodic_task
from helper.email_helper import EmailHelper


@app.task
def send_fundraiser_receipt_email(subject,message,from_email,to_list,html_message):
	email_helper = EmailHelper(
		subject=subject, 
		message=message,
		from_email=from_email,
		to_list=to_list,
		html_message=html_message
	)
	email_helper.send_email()

