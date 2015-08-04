from django import forms
from product.models import Product

# class Selection(models.Model):
# 	shipment   = models.ForeignKey(Shipment)
# 	product    = models.ForeignKey(Product)
# 	quantity   = models.IntegerField(default=0)	

# 	def __unicode__(self):
# 		return str(self.shipment)

# class FundraiserDescribeForm(forms.Form):
# 	title = forms.CharField(widget=forms.TextInput(attrs={
# 		"name" : "title",
# 		"id" : "title",
# 		"class" : "form-control",
# 		"size" : "20",
# 		"placeholder" : "Title of your Fundraiser",
# 		"type" : "text",
# 	}))


class ShipmentSelectionForm(forms.Form):
	quantity = forms.IntegerField(widget=forms.TextInput(attrs={
		"name" : "selection",
		"id" : "selection",
		"class" : "form-control",
		"size" : "20",
		"placeholder" : "0",
		"type" : "text",
	}))