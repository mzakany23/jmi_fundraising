from django import forms
from django.forms import ModelForm
from helper.form_helper import STATES,STATES_LIST
from models import Address

class AddressForm(ModelForm):
	class Meta:
		model = Address
		fields = ['title','street','line_2','city','state','zip_code']
		widgets = {
			'title' : forms.TextInput(attrs={
				"name" : "title",
				"id" : "title",
				"class" : "form-control",
				"size" : "20",
				"placeholder" : "Title",
				"type" : "text",
			}),
			'street' : forms.TextInput(attrs={
				"name" : "title",
				"id" : "title",
				"class" : "form-control",
				"size" : "20",
				"placeholder" : "Title",
				"type" : "text",
			}),
			'line_2': forms.TextInput(attrs={
				"name" : "line_2",
				"id" : "line_2",
				"class" : "form-control",
				"size" : "20",
				"placeholder" : "extra line",
				"type" : "text",
			}),
			'city': forms.TextInput(attrs={
				"name" : "line_2",
				"id" : "line_2",
				"class" : "form-control",
				"size" : "20",
				"placeholder" : "City",
				"type" : "text",
			}),
			'state': forms.Select(attrs={
				"name" : "state",
				"id" : "state",
				"class" : "form-control",
				"size" : "20",
				"placeholder" : "State",
				"type" : "text",
			},
			choices=STATES,
			),
			'zip_code': forms.TextInput(attrs={
				"name" : "zip_code",
				"id" : "zip_code",
				"class" : "form-control",
				"size" : "20",
				"placeholder" : "Zip",
				"type" : "text",
			})

		}


	def all_states(self):
		return STATES_LIST

class BillingAddressForm(forms.Form):
	title = forms.CharField(required=False,widget=forms.TextInput(attrs={
		"name" : "title",
		"id" : "title",
		"class" : "form-control",
		"size" : "20",
		"placeholder" : "Title",
		"type" : "text",
	}))
	street = forms.CharField(required=False,widget=forms.TextInput(attrs={
		"name" : "street",
		"id" : "street",
		"class" : "form-control",
		"size" : "20",
		"placeholder" : "Street",
		"type" : "text",
	}))
	line_2 = forms.CharField(required=False,widget=forms.TextInput(attrs={
		"name" : "line_2",
		"id" : "line_2",
		"class" : "form-control",
		"size" : "20",
		"placeholder" : "extra line",
		"type" : "text",
	}))
	city = forms.CharField(required=False,widget=forms.TextInput(attrs={
		"name" : "line_2",
		"id" : "line_2",
		"class" : "form-control",
		"size" : "20",
		"placeholder" : "City",
		"type" : "text",
	}))
	state = forms.CharField(required=False,widget=forms.Select(attrs={
		"name" : "state",
		"id" : "state",
		"class" : "form-control",
		"size" : "20",
		"placeholder" : "State",
		"type" : "text",
	}))
	country = forms.CharField(required=False,widget=forms.TextInput(attrs={
		"name" : "country",
		"id" : "country",
		"class" : "form-control",
		"size" : "20",
		"placeholder" : "USA",
		"type" : "text",
	}))
	zip_code = forms.CharField(required=False,widget=forms.TextInput(attrs={
		"name" : "zip_code",
		"id" : "zip_code",
		"class" : "form-control",
		"size" : "20",
		"placeholder" : "Zip",
		"type" : "text",
	}))