from django.db import models
from fundraiser.models import Fundraiser

class GenericDiscount(models.Model):
	title = models.CharField(max_length=40)
	special_code = models.CharField(max_length=40,blank=True,null=True)
	active = models.BooleanField(default=False)
	expires_after = models.IntegerField(default=10)
	used = models.IntegerField(default=0)
	percent = models.DecimalField(max_digits=10,decimal_places=2,default=0.00)
	dollars = models.DecimalField(max_digits=10,decimal_places=2,default=0.00)
	fundraiser = models.ForeignKey(Fundraiser,blank=True,null=True)
	
	def __unicode__(self):
		return self.title


class SingleDiscount(models.Model):
	title = models.CharField(max_length=40)
	special_code = models.CharField(max_length=40,blank=True,null=True)
	active = models.BooleanField(default=False)
	expires_after = models.IntegerField(default=10)
	used = models.IntegerField(default=0)
	percent = models.DecimalField(max_digits=10,decimal_places=2,default=0.00)
	dollars = models.DecimalField(max_digits=10,decimal_places=2,default=0.00)
	fundraiser = models.OneToOneField(Fundraiser,blank=True,null=True)
	
	def __unicode__(self):
		return self.title