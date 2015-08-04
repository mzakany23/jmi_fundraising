from django.db.models.signals import post_save, pre_save, pre_delete

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

	def __unicode__(self):
		return "Fundraiser: " + str(self.title)

	def shipments(self):
		return self.shipment_set.all()

	

class FundraiserCategory(models.Model):
	title        = models.CharField(max_length=40,blank=True,null=True)

	def __unicode__(self):
		return self.title

class FundraiserType(models.Model):
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


# create profile too
def create_profile_receiver(sender,instance,created,*args,**kwargs):
	if created:
		# instance == User
		try:
			profile = Profile()
			profile.slug = instance	
			profile.contact = instance
			stripe.api_key = settings.STRIPE_API['key']
			new_stripe_id = stripe.Customer.create(email=instance.email)
			profile.stripe_id = str(new_stripe_id['id'])
			profile.save()
		except:
			pass

# make sure stripe has an email address
def update_profile_receiver(instance,*args,**kwargs):
	try:
		profile = Profile.objects.get(contact=instance)

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
post_save.connect(create_profile_receiver,sender=Fundraiser)
pre_save.connect(update_profile_receiver,sender=Fundraiser)
pre_delete.connect(delete_profile_and_stripe_account,sender=Fundraiser)


