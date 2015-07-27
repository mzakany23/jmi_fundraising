
from django.db import models
from django.contrib.auth.models import User
from product.models import Product

class Fundraiser(models.Model):
	type      = models.ForeignKey('FundraiserType',null=True,blank=True)
	title     = models.CharField(max_length=40)
	account   = models.ForeignKey(User)
	created   = models.DateTimeField(auto_now_add=True,auto_now=False)
	updated   = models.DateTimeField(auto_now_add=False,auto_now=True)

	def __unicode__(self):
		return "Fundraiser: " + str(self.title)


class FundraiserCategory(models.Model):
	title        = models.CharField(max_length=40,blank=True,null=True)

	def __unicode__(self):
		return self.title

class FundraiserType(models.Model):
	image      = models.ImageField(upload_to='fundraiser_types',blank=True,null=True)
	title      = models.CharField(max_length=40)
	selections = models.ManyToManyField(Product)

	def __unicode__(self):
		return self.title


