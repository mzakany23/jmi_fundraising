import stripe
from django.conf import settings
from django.utils.text import slugify
from django.db import models
from address.models import Address

class Profile(models.Model):
	organization = models.CharField(max_length=40,blank=True,null=True)
	first_name   = models.CharField(max_length=20,blank=True,null=True)
	last_name    = models.CharField(max_length=20,blank=True,null=True)
	phone_number = models.CharField(max_length=10,blank=True,null=True)
	email        = models.EmailField(max_length=40,blank=True,null=True)
	slug 		 = models.SlugField(blank=True,null=True)
	org_photo    = models.ImageField(upload_to='organization_photos',blank=True,null=True)
	address 	 = models.ForeignKey(Address,null=True,blank=True)
	stripe_id    = models.CharField(max_length=100,blank=True,null=True)

	def __unicode__(self):
		return str(self.organization)

	