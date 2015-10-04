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
def send_fundraiser_receipt_email(subject,message,from_email,to_list,html_message=None):
	email_helper = EmailHelper(
		subject=subject, 
		message=message,
		from_email=from_email,
		to_list=to_list,
		html_message=html_message
	)
	email_helper.send_email()

# @app.task
# def create_fundraiser_with_profile_task(is_auth,user,title,organization,description,org_photo):
# 	# describe = DescribeFundraiser(request,form)
# 	# describe_object.create_fundraiser_with_profile()
# 	from account.models import Profile
# 	from django.contrib.auth.models import User 
# 	from fundraiser.models import Fundraiser

# 	profile, created = Profile.objects.get_or_create(organization=organization)
# 	session_user = User.objects.get_or_none(username=user)

# 	if created:	
# 		if is_auth:
			
# 			profile.account = session_user
# 		profile.slug = (slugify(profile.organization) + "-" + str(profile.id)).lower()
# 		profile.org_photo = self.org_photo
# 		profile.save()
		
# 	fundraiser, created = Fundraiser.objects.get_or_create(
# 		title=title,
# 		profile=profile,
# 		description=description,
# 		status='in-process'
# 	)

# 	if created:
# 		if is_auth:
# 			fundraiser.account = session_user
# 			fundraiser.slug = slugify(fundraiser.title)+'-'+str(fundraiser.id)
# 			fundraiser.save()
			
# 	self.request.session['current_fundraiser'] = fundraiser.id
# 	self.request.session['session_finalized_order'] = fundraiser.id

