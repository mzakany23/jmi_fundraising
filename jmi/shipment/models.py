from django.db.models.signals import post_save
from django.db import models
from fundraiser.models import Fundraiser
from address.models import Address
from product.models import Product

class Shipment(models.Model):
	fundraiser = models.ForeignKey(Fundraiser)
	address    = models.ForeignKey(Address,blank=True,null=True)
	created    = models.DateTimeField(auto_now_add=True,auto_now=False)
	updated    = models.DateTimeField(auto_now_add=False,auto_now=True)

	def __unicode__(self):
		return str(self.fundraiser)

class Selection(models.Model):
	shipment   = models.ForeignKey(Shipment)
	product    = models.ForeignKey(Product)
	quantity   = models.IntegerField(default=0)	

	def __unicode__(self):
		return str(self.shipment)


def create_shipment_receiver(sender,instance,created,*args,**kwargs):
	if created:
		try:
			shipment = Shipment()
			shipment.fundraiser = instance
			shipment.save()
		except:
			pass

post_save.connect(create_shipment_receiver,sender=Fundraiser)