from django.db.models.signals import post_save
from django.db import models
from fundraiser.models import Fundraiser
from address.models import Address
from product.models import Product
from comment.models import FundraiserOrderComment

from helper.number_format_helper import NumberFormat

class Shipment(models.Model):
	fundraiser = models.ForeignKey(Fundraiser)
	address    = models.ForeignKey(Address,blank=True,null=True)
	comment    = models.ForeignKey(FundraiserOrderComment,blank=True,null=True)
	created    = models.DateTimeField(auto_now_add=True,auto_now=False)
	updated    = models.DateTimeField(auto_now_add=False,auto_now=True)
	
	
	def __unicode__(self):
		return str(self.fundraiser.title)

	def has_selections(self):
		return True if self.selection_set.first() else False
		
	def remove_selections(self):
		if self.has_selections():	
			for selection in self.selection_set.all():
				selection.delete()
		
	def shipping_cost(self):
		if self.free_shipping():
			return "FREE Shipping!"
		else:
			return 30.00

	def pre_tax_cost(self):
		try:
			price = float(self.fundraiser.type.jar_price)
		except:
			price = 0.00
		qty   = self.total_jars()
		return (price*qty)

	def pre_tax_cost_in_dollars(self):
		cost = self.pre_tax_cost()
		return '{:,.2f}'.format(cost)
		
	def total_jars(self):
		total = 0
		for selection in self.selection_set.all():
			total += selection.quantity
		return total

	def free_shipping(self):
		return True if self.total_jars() >= 96 else False

	def get_total_cost(self):
		total_cost = 0
		for selection in self.selection_set.all():
			total_cost += float(selection.product.price )
		return total_cost

	def total_cost_with_shipping(self):
		if self.free_shipping():
			return '%.2f' % float(self.pre_tax_cost())
		else:
			return '%.2f' % (float(self.pre_tax_cost()) + float(self.shipping_cost()))


class Selection(models.Model):
	shipment   = models.ForeignKey(Shipment)
	product    = models.ForeignKey(Product)
	quantity   = models.IntegerField(default=0)	

	def __unicode__(self):
		return str(self.shipment)

	def cost(self):
		return (float(self.quantity) * float(self.product.price))

	def cost_in_dollars(self):
		return '{:,.2f}'.format(self.cost())


def create_shipment_receiver(sender,instance,created,*args,**kwargs):
	if created:
		try:
			shipment = Shipment()
			shipment.fundraiser = instance
			shipment.save()
		except:
			pass

post_save.connect(create_shipment_receiver,sender=Fundraiser)