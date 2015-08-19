from django.db import models
from helper.form_helper import STATES, COUNTRIES

class Address(models.Model):
	shipping   = models.BooleanField(default=True)
	billing    = models.BooleanField(default=False)
	title      = models.CharField(max_length=40,null=True,blank=True)
	street     = models.CharField(max_length=40,null=True,blank=True)
	line_2	   = models.CharField(max_length=40,null=True,blank=True)
	city	   = models.CharField(max_length=40,null=True,blank=True)
	state      = models.CharField(choices=STATES,max_length=40,null=True,blank=True)
	zip_code   = models.CharField(max_length=40,null=True,blank=True)
	country    = models.CharField(choices=COUNTRIES,max_length=40,null=True,blank=True)

	def __unicode__(self):
		return str(self.street)