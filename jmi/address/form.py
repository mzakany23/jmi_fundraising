from django import forms

class AddressForm(forms.Form):
	title = forms.CharField(required=False,widget=forms.TextInput(attrs={
		"name" : "title",
		"id" : "title",
		"class" : "form-control",
		"size" : "20",
		"placeholder" : "Title",
		"type" : "text",
	}))
	street = forms.CharField(widget=forms.TextInput(attrs={
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
	city = forms.CharField(widget=forms.TextInput(attrs={
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
	zip_code = forms.CharField(widget=forms.TextInput(attrs={
		"name" : "zip_code",
		"id" : "zip_code",
		"class" : "form-control",
		"size" : "20",
		"placeholder" : "Zip",
		"type" : "text",
	}))

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