from django import forms
from django.forms import ModelForm
from product.models import Product
from account.models import Profile

class ShipmentProfileForm(ModelForm):
	class Meta:
		model = Profile
		fields = ['first_name','last_name','phone_number','email',]
		widgets = {
		'first_name' : forms.TextInput(attrs={
			"name" : "selection",
			"id" : "selection",
			"class" : "form-control",
			"size" : "20",
			"placeholder" : "First Name",
			"type" : "text",
		}),
		'last_name' : forms.TextInput(attrs={
			"name" : "selection",
			"id" : "selection",
			"class" : "form-control",
			"size" : "20",
			"placeholder" : "Last Name",
			"type" : "text",
		}),
		'phone_number' : forms.TextInput(attrs={
			"name" : "selection",
			"id" : "selection",
			"class" : "form-control",
			"size" : "20",
			"placeholder" : "000-000-0000",
			"type" : "text",
		}),
		'email' : forms.TextInput(attrs={
			"name" : "selection",
			"id" : "selection",
			"class" : "form-control",
			"size" : "20",
			"placeholder" : "name@email.com",
			"type" : "text",
		}),
			}
		


class ShipmentSelectionForm(forms.Form):
	quantity = forms.CharField(widget=forms.TextInput(attrs={
		"name" : "selection",
		"id" : "selection",
		"class" : "form-control",
		"size" : "20",
		"placeholder" : "0",
		"type" : "text",
	}))