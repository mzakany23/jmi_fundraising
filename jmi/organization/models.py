from django.db import models
from django.db.models.signals import post_save, post_delete, pre_save, pre_delete
from address.helper.form_helper import STATES, COUNTRIES

class Organization(models.Model):
	type = models.ForeignKey('OrganizationType',blank=True,null=True)
	name = models.CharField(max_length=40,null=True,blank=True)
	number_of_employees = models.CharField(max_length=50,blank=True,null=True)
	info = models.TextField(max_length=500,blank=True,null=True)
	created = models.DateTimeField(auto_now_add=True,auto_now=False,blank=True,null=True)

	def __unicode__(self):
		return str(self.name)

	def main_contact(self):
		return (self.contact_set.first() or None)

	def contacts(self):
		return (self.contact_set.all() or None)

	def addresses(self):
		return (self.address_set.all() or None)

	def fundraisers(self):
		return (self.fundraiser_set.all() or None)
	



class OrganizationType(models.Model):
	name = models.CharField(max_length=40,null=True,blank=True)

	def __unicode__(self):
		return self.name

class Industry(models.Model):
	name = models.CharField(max_length=40,null=True,blank=True)
	def __unicode__(self):
		return self.name



