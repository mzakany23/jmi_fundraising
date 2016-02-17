from django.db import models
from helper.form_helper import STATES, COUNTRIES
from organization.models import Organization

class Address(models.Model):
	organization = models.ForeignKey(Organization,null=True,blank=True)
	business_address = models.BooleanField(default=False)
	shipping   = models.BooleanField(default=True)
	billing    = models.BooleanField(default=False)
	title      = models.CharField(max_length=40,null=True,blank=True)
	street     = models.CharField(max_length=40,null=True)
	line_2	   = models.CharField(max_length=40,null=True,blank=True)
	city	   = models.CharField(max_length=40,null=True)
	state      = models.CharField(choices=STATES,max_length=40,null=True)
	zip_code   = models.CharField(max_length=40,null=True)
	country    = models.CharField(choices=COUNTRIES,max_length=40,null=True,blank=True)

	def __unicode__(self):
		return str(self.street)

