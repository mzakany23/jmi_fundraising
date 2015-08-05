from django.db import models


COUNTRIES = (
	('USA','USA'),
)

class Address(models.Model):
	shipping   = models.BooleanField(default=False)
	title      = models.CharField(max_length=40,null=True,blank=True)
	street     = models.CharField(max_length=40,null=True,blank=True)
	line_2	   = models.CharField(max_length=40,null=True,blank=True)
	city	   = models.CharField(max_length=40,null=True,blank=True)
	state      = models.CharField(max_length=40,null=True,blank=True)
	zip_code   = models.CharField(max_length=40,null=True,blank=True)
	country    = models.CharField(choices=COUNTRIES,max_length=40,null=True,blank=True)

	def __unicode__(self):
		return str(self.street)