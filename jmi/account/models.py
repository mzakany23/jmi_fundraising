import stripe
from django.conf import settings
from django.db.models.signals import post_save, post_delete, pre_save, pre_delete

from django.utils.text import slugify
from django.db import models
from address.models import Address
from django.contrib.auth.models import User 

class Profile(models.Model):
	organization = models.CharField(max_length=40,blank=True,null=True)
	first_name   = models.CharField(max_length=20,null=True)
	last_name    = models.CharField(max_length=20,null=True)
	phone_number = models.CharField(max_length=10,null=True)
	email        = models.EmailField(max_length=40,null=True)
	slug 		 = models.SlugField(blank=True,null=True)
	org_photo    = models.ImageField(upload_to='organization_photos',blank=True,null=True)
	address 	 = models.ForeignKey(Address,null=True,blank=True)
	stripe_id    = models.CharField(max_length=100,blank=True,null=True)
	account      = models.ForeignKey(User,null=True,blank=True)

	def __unicode__(self):
		return str(self.organization)

	def contact_person(self):
		return self.first_name + ' ' + self.last_name
	
	def has_stripe_id(self):
		return self.has_stripe_id

	def single_line_address(self):
		street = self.address.street
		city   = self.address.city 
		state  = self.address.state 
		zip    = self.address.zip_code
		return "%s %s %s, %s" % (street,city,state,zip)


