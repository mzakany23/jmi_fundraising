import stripe
from django.conf import settings
from django.utils.text import slugify
from django.db import models
from address.models import Address
from django.contrib.auth.models import User
from django.db.models.signals import post_save, pre_save, pre_delete

class Profile(models.Model):
	organization = models.CharField(max_length=40,blank=True,null=True)
	contact		 = models.ForeignKey(User)
	slug 		 = models.SlugField(blank=True,null=True)
	org_photo    = models.ImageField(upload_to='organization_photos')
	address 	 = models.ForeignKey(Address,null=True,blank=True)
	stripe_id    = models.CharField(max_length=100,blank=True,null=True)

	def __unicode__(self):
		return str(self.contact)

# -----------------------------------------------------------------------------------
# signals
# -----------------------------------------------------------------------------------


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
	

post_save.connect(create_profile_receiver,sender=User)
pre_save.connect(update_profile_receiver,sender=User)
pre_delete.connect(delete_profile_and_stripe_account,sender=User)


