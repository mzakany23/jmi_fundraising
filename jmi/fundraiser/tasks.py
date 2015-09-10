from celery import Celery
from jmi.celery_app import app
from celery.task.schedules import crontab
from celery.decorators import periodic_task
from helper.email_helper import EmailHelper


@app.task
def send_fundraiser_receipt_email(email_object):
	email_object.send_email()

