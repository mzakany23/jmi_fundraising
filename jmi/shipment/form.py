from django import forms
from product.models import Product


class ShipmentProfileForm(forms.Form):
	first_name = forms.CharField(widget=forms.TextInput(attrs={
		"name" : "selection",
		"id" : "selection",
		"class" : "form-control",
		"size" : "20",
		"placeholder" : "First Name",
		"type" : "text",
	}))
	last_name = forms.CharField(widget=forms.TextInput(attrs={
		"name" : "selection",
		"id" : "selection",
		"class" : "form-control",
		"size" : "20",
		"placeholder" : "Last Name",
		"type" : "text",
	}))
	phone_number = forms.CharField(widget=forms.TextInput(attrs={
		"name" : "selection",
		"id" : "selection",
		"class" : "form-control",
		"size" : "20",
		"placeholder" : "000-000-0000",
		"type" : "text",
	}))
	email = forms.CharField(widget=forms.TextInput(attrs={
		"name" : "selection",
		"id" : "selection",
		"class" : "form-control",
		"size" : "20",
		"placeholder" : "name@email.com",
		"type" : "text",
	}))


class ShipmentSelectionForm(forms.Form):
	quantity = forms.CharField(widget=forms.TextInput(attrs={
		"name" : "selection",
		"id" : "selection",
		"class" : "form-control",
		"size" : "20",
		"placeholder" : "0",
		"type" : "text",
	}))