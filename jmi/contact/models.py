from django.db import models
from organization.models import Organization
from address.models import Address 
from django.contrib.auth.models import User 

class Contact(models.Model):
	account = models.ForeignKey(User,null=True,blank=True)
	address = models.ForeignKey(Address,blank=True,null=True)
	type = models.ForeignKey('ContactType',blank=True,null=True)
	organization = models.ForeignKey(Organization,blank=True,null=True)
	first_name = models.CharField(max_length=40,blank=True,null=True)
	last_name = models.CharField(max_length=40,blank=True,null=True)
	age = models.CharField(max_length=3,blank=True,null=True)
	job_title = models.CharField(max_length=40,blank=True,null=True)
	phone1 = models.CharField(max_length=40,blank=True,null=True)
	phone2 = models.CharField(max_length=40,blank=True,null=True)
	phone3 = models.CharField(max_length=40,blank=True,null=True)
	email1 = models.EmailField(max_length=100,blank=True,null=True)
	email2 = models.EmailField(max_length=100,blank=True,null=True)
	email3 = models.EmailField(max_length=100,blank=True,null=True)
	info = models.TextField(max_length=500,blank=True,null=True)
	created = models.DateField(blank=True,null=True,auto_now_add=True)

	def __unicode__(self):
		return str(self.first_name)
	
class ContactType(models.Model):
	title = models.CharField(max_length=40,blank=True,null=True)

	def __unicode__(self):
		return self.title