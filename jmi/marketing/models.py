from django.db import models
from fundraiser.models import Fundraiser
from helper.initialize_helper import SessionVariable


class AbstractDiscount(models.Model):
	title = models.CharField(max_length=40)
	special_code = models.CharField(max_length=40,blank=True,null=True)
	active = models.BooleanField(default=False)
	expires_after = models.IntegerField(default=10)
	used = models.IntegerField(default=0)
	percent = models.DecimalField(max_digits=10,decimal_places=2,default=0.00)
	dollars = models.DecimalField(max_digits=10,decimal_places=2,default=0.00)

	class Meta:
		abstract = True

	def expired(self):
		return self.used > self.expires_after

	def to_percent(self):
		return float(self.percent)*.01

class GenericDiscount(AbstractDiscount):
	
	def __unicode__(self):
		return self.title

class SingleDiscount(AbstractDiscount):
	fundraiser = models.OneToOneField(Fundraiser,blank=True,null=True)
	
	def __unicode__(self):
		return self.title

class EmailNewsLetter(models.Model):
	email = models.EmailField(max_length=40)

	def __unicode__(self):
		return self.email

class Discount:
	def __init__(self,request,code):
		self.request = request
		self.code = code 
		self.type = None
		self.discount  = None
		self.session_fundraiser = SessionVariable(request,'current_fundraiser').session_fundraiser()

	def check_if_generic_code(self):
		try:
			generic_code = GenericDiscount.objects.get(special_code=self.code)
			if generic_code.active == False:
				generic_code = False
			else:

				self.type = 'generic'
				self.discount = generic_code
		except:
			generic_code = False	

		return generic_code

	def check_if_single_code(self):
		try:
			single_code = SingleDiscount.objects.get(special_code=self.code)
			if single_code.active == False:
				single_code = False
			else:
				self.type = 'single'
				self.discount = single_code
		except:
			single_code = False	

		return single_code

	def is_valid(self):
		if self.check_if_generic_code():
			return self.check_if_generic_code()
		elif self.check_if_single_code():
			return self.check_if_single_code()
		else:
			return False
		

	def set_discount(self):
		if self.discount.percent and self.discount.dollars:
			discount = (self.session_fundraiser.total_cost() * self.discount.to_percent())
			discount += self.discount.dollars
			self.session_fundraiser.discount = discount 
			self.session_fundraiser.save()
		elif self.discount.percent:
			discount = (self.session_fundraiser.total_cost() * self.discount.to_percent())
			self.session_fundraiser.discount = discount
			self.session_fundraiser.save()
		elif self.discount.dollars:
			self.session_fundraiser.discount = self.discount.dollars
			self.session_fundraiser.save()
		else:
			return False

	def use_discount(self):

		if self.type:
			if self.discount.active == False:
				return False
			else:
				if self.type == 'single':
					self.discount.fundraiser = self.session_fundraiser
				
				self.discount.used += 1
				
				self.set_discount()

				if self.discount.expired():
					self.discount.active = False

				self.discount.save()

				return True
				
		


