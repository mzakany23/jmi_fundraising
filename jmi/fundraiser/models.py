import stripe
from django.conf import settings
from django.utils.text import slugify

from django.db.models.signals import post_save, post_delete, pre_save, pre_delete

from django.db import models

from django.contrib.auth.models import User
from product.models import Product
from account.models import Profile


class Fundraiser(models.Model):
	title        = models.CharField(max_length=40,blank=True,null=True)
	description  = models.TextField(max_length=200,blank=True,null=True)
	type         = models.ForeignKey('FundraiserType',null=True,blank=True)
	status       = models.CharField(
		max_length=40,
		choices=(('in-process','in-process'),('done-unpaid','done-unpaid'),('done-paid','done-paid'),),blank=True,null=True
	)
	profile      = models.ForeignKey(Profile,blank=True,null=True)
	account      = models.ForeignKey(User,blank=True,null=True)
	created      = models.DateTimeField(auto_now_add=True,auto_now=False)
	updated      = models.DateTimeField(auto_now_add=False,auto_now=True)
	discount     = models.DecimalField(max_digits=10,decimal_places=2,default=0.00)
	slug         = models.SlugField(blank=True,null=True)

	def __unicode__(self):
		return "Fundraiser: " + str(self.title)

	def total_cost(self):
		shipment_cost = 0
		for shipment in self.shipment_set.all():
			shipment_cost += shipment.get_total_cost()
		return shipment_cost - self.discount


	def organization(self):
		return self.profile.organization

	def shipment(self):
		try:
			shipment = self.shipment_set.first()
		except:
			shipment = None

		return shipment


	def selections(self):
		try:
			shipment = self.shipment_set.first()
			selections = shipment.selection_set.filter(quantity__gt=0)
		except:
			selections = None

		return selections
	
	

class FundraiserCategory(models.Model):
	title        = models.CharField(max_length=40,blank=True,null=True)

	def __unicode__(self):
		return self.title

class FundraiserType(models.Model):
	jar_price  = models.DecimalField(max_digits=10,decimal_places=2,default=3.00)
	slug       = models.SlugField(blank=True,null=True)
	image      = models.ImageField(upload_to='fundraiser_types',blank=True,null=True)
	title      = models.CharField(max_length=40)
	selections = models.ManyToManyField(Product,blank=True,null=True)


	def __unicode__(self):
		return self.title

	def selection_count(self):
		return self.selections.count()

	  

# -----------------------------------------------------------------------------------
# signals
# -----------------------------------------------------------------------------------

# on fundraisertype save
def create_fundraiser_type_slug(sender,instance,created,*args,**kwargs):
	if created:
		try:
			instance.slug = "fundraiser-type-%s" %instance.id
			instance.save()
		except:
			pass

# create stripe id after have email address
def create_stripe_id_receiver(sender,instance,created,*args,**kwargs):
	if created:
		try:
			email_address = instance.profile.email
			stripe.api_key = settings.STRIPE_API['key']
			new_stripe_id = stripe.Customer.create(email=email_address)
			profile.stripe_id = str(new_stripe_id['id'])
		except:
			pass
# make sure stripe has an email address
def update_profile_receiver(instance,*args,**kwargs):
	try:
		profile = Profile.objects.get(profile=instance.profile)

		if instance.email and profile:
			stripe.api_key = settings.STRIPE_API['key']
			cu = stripe.Customer.retrieve(profile.stripe_id)
			cu.email = instance.email
			cu.save()
	except:
		pass

# delete profile and stripe through their api
def delete_profile_and_stripe_account(sender,instance,*args,**kwargs):
	try:
		profile = Profile.objects.get(contact=instance)	
		stripe.api_key = settings.STRIPE_API['key']
		cu = stripe.Customer.retrieve(profile.stripe_id)
		cu.delete()
		profile.delete()
	except:
		pass


post_save.connect(create_fundraiser_type_slug,sender=FundraiserType)
pre_save.connect(update_profile_receiver,sender=Fundraiser)
pre_delete.connect(delete_profile_and_stripe_account,sender=Fundraiser)


