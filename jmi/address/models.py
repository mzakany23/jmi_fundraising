from django.db import models


COUNTRIES = (
	('USA','USA'),
)

class Address(models.Model):
	title      = models.CharField(max_length=40,blank=True)
	street     = models.CharField(max_length=40,blank=True)
	line_2	   = models.CharField(max_length=40,blank=True)
	state      = models.CharField(max_length=40,blank=True)
	postcode   = models.CharField(max_length=40,blank=True)
	country    = models.CharField(choices=COUNTRIES,max_length=40,blank=True)

	def __unicode__(self):
		return str(self.title)