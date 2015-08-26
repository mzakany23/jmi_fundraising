from django.db import models
from fundraiser.models import Fundraiser

class Payment(models.Model):
	type       = models.CharField(max_length=40, choices=(('check','check'),('credit','credit'),),blank=True,null=True)
	stripe_id  = models.CharField(max_length=40,blank=True,null=True)
	fundraiser = models.ForeignKey(Fundraiser,blank=True,null=True)
	last_4     = models.CharField(max_length=4,blank=True,null=True)
	card_type  = models.CharField(max_length=10,blank=True,null=True)
	
	def __unicode__(self):
		return self.type


