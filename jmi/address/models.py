from django.db import models


COUNTRIES = (
	('USA','USA'),
)


STATES = (
	('AK','AK'),
	('AL','AL'),
	('AR','AR'),
	('AZ','AZ'),
	('CA','CA'),
	('CO','CO'),
	('CT','CT'),
	('DE','DE'),
	('FL','FL'),
	('GA','GA'),
	('HI','HI'),
	('IA','IA'),
	('ID','ID'),
	('IL','IL'),
	('IN','IN'),
	('KS','KS'),
	('KY','KY'),
	('LA','LA'),
	('MA','MA'),
	('MD','MD'),
	('ME','ME'),
	('MI','MI'),
	('MN','MN'),
	('MO','MO'),
	('MS','MS'),
	('MT','MT'),
	('NC','NC'),
	('ND','ND'),
	('NE','NE'),
	('NH','NH'),
	('NJ','NJ'),
	('NM','NM'),
	('NV','NV'),
	('NY','NY'),
	('OH','OH'),
	('OK','OK'),
	('OR','OR'),
	('PA','PA'),
	('RI','RI'),
	('SC','SC'),
	('SD','SD'),
	('TN','TN'),
	('TX','TX'),
	('UT','UT'),
	('VA','VA'),
	('VT','VT'),
	('WA','WA'),
	('WI','WI'),
	('WV','WV'),
	('WY','WY'),
)

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