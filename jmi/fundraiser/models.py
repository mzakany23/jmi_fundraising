# django
import stripe
from django.conf import settings
from django.utils.text import slugify
from django.db.models.signals import post_save, post_delete, pre_save, pre_delete
from django.db import models

# app
from django.contrib.auth.models import User
from product.models import Product
from account.models import Profile
from helper.number_format_helper import NumberFormat
from jmi.settings import DOCS_ROOT

class Fundraiser(models.Model):
	STATUS_CHOICES = (('paid','paid'),('unpaid','unpaid'))
	title        = models.TextField(max_length=100,blank=True,null=True)
	description  = models.TextField(max_length=500,blank=True,null=True)
	plan         = models.ForeignKey('FundraiserCategory',blank=True,null=True)
	type         = models.ForeignKey('FundraiserType',null=True,blank=True)
	status       = models.CharField(
		max_length=40,
		choices=(('paid','paid'),('unpaid','unpaid'),),blank=True,null=True
	)
	finalized    = models.BooleanField(default=False)
	profile      = models.ForeignKey(Profile,blank=True,null=True)
	account      = models.ForeignKey(User,blank=True,null=True)
	created      = models.DateTimeField(auto_now_add=True,auto_now=False)
	updated      = models.DateTimeField(auto_now_add=False,auto_now=True)
	discount     = models.DecimalField(max_digits=10,decimal_places=2,default=0.00)
	slug         = models.SlugField(max_length=400,blank=True,null=True)
	receipt_email_sent = models.BooleanField(default=False)

	def __unicode__(self):
		return "Fundraiser: " + str(self.title)

	def selection_list(self):
		return [("product: %s qty: %s") % (str(sel.product.title),str(sel.quantity))  for sel in self.selections()]

	def selections_str(self):
		output_str = ""
		for sel in self.selections():
			output_str += "product: %s qty: %s \n" % (str(sel.product.title),str(sel.quantity))
		return output_str

	def selections(self):
		return self.shipment().selection_set.all()

	def is_discount(self):
		return "Yes" if self.discount else 'No'

	def discount_in_dollars(self):
		return '{:,.2f}'.format(self.discount)

	def total_cost(self):	
		shipment_cost = 0.00
		for shipment in self.shipment_set.all():
			shipment_cost += shipment.pre_tax_cost()
		return shipment_cost

	def total_cost_in_dollars(self):
		return '{:,.2f}'.format(self.total_cost())

	def free_shipping(self):
		count = 0
		for shipment in self.shipment_set.all():
			if shipment.free_shipping():
				count += 1
		return True if count > 0 else False

	def net_total(self):
		if self.free_shipping():
			return self.total_cost() - float(self.discount)
		else:
			return self.total_cost() - float(self.discount) + 30.00

	def net_total_in_dollars(self):
		total = self.net_total()
		return '{:,.2f}'.format(total)
			

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

	
	def get_payment_type(self):
		try: 
			payments = self.payment_set.first()
		except:
			payments = None
		return payments

	def get_comment(self):
		try:
			comment = self.user_comment_set.first()
		except:
			comment = None
		return comment

class FundraiserTypeTitle(models.Model):
	title = models.CharField(max_length=40, blank=True,null=True)
	
	def __unicode__(self):
		return self.title

class FundraiserCategory(models.Model):
	choices=(('paid','paid'),('unpaid','unpaid'),)
	
	popular	     = models.BooleanField(default=False)
	show_top_sellers = models.BooleanField(default=False)
	name         = models.CharField(max_length=40,blank=True,null=True)
	type  		 = models.ForeignKey(FundraiserTypeTitle,blank=True,null=True)
	title        = models.TextField(max_length=100,blank=True,null=True)
	description  = models.TextField(max_length=500,blank=True,null=True)
	options      = models.ManyToManyField('FundraiserType',blank=True,null=True)
	image 		 = models.ImageField(upload_to='fundraiser_types', blank=True, null=True)
	forms        = models.FilePathField(path=DOCS_ROOT,null=True,blank=True)
	
	def __unicode__(self):
		return self.name

	def get_options(self):
		return [str(o.title) for o in self.options.all()]

	def get_absolute_url(self):
		return "%s/media/%s" % (settings.SERVER, self.image)

class FundraiserType(models.Model):
	jar_price  = models.DecimalField(max_digits=10,decimal_places=2,default=3.00)
	slug       = models.SlugField(blank=True,null=True)
	image      = models.ImageField(upload_to='fundraiser_types',blank=True,null=True)
	title      = models.CharField(max_length=40)
	selections = models.ManyToManyField(Product,blank=True,null=True)
	

	def __unicode__(self):
		return self.title

	def get_plan(self):
		try:
			plan = [str(p.name) for p in FundraiserCategory.objects.filter(options=self)]
		except: 
			plan = None
		return plan

	def selection_count(self):
		return self.selections.count()

	def all_selections(self):
		return [prod for prod in self.selections.all()]

	  

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
		profile = Profile.objects.get(id=instance.profile.id)	
		stripe.api_key = settings.STRIPE_API['key']
		cu = stripe.Customer.retrieve(profile.stripe_id)
		cu.delete()
		profile.delete()
	except:
		pass


post_save.connect(create_fundraiser_type_slug,sender=FundraiserType)
pre_save.connect(update_profile_receiver,sender=Fundraiser)
pre_delete.connect(delete_profile_and_stripe_account,sender=Fundraiser)


