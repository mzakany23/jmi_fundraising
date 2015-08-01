from django import forms

class Address(forms.Form):
	title      = models.CharField(max_length=40,blank=True)
	street     = models.CharField(max_length=40,blank=True)
	line_2	   = models.CharField(max_length=40,blank=True)
	state      = models.CharField(max_length=40,blank=True)
	zip_code   = models.CharField(max_length=40,blank=True)
	country    = models.CharField(choices=COUNTRIES,max_length=40,blank=True)

	title = forms.CharField(widget=forms.TextInput(attrs={
		"name" : "title",
		"id" : "title",
		"class" : "form-group",
		"size" : "20",
		"placeholder" : "Title",
		"type" : "text",
	}))
	street = forms.CharField(widget=forms.TextInput(attrs={
		"name" : "street",
		"id" : "street",
		"class" : "form-group",
		"size" : "20",
		"placeholder" : "Street",
		"type" : "text",
	}))
	line_2 = forms.CharField(widget=forms.TextInput(attrs={
		"name" : "line_2",
		"id" : "line_2",
		"class" : "form-group",
		"size" : "20",
		"placeholder" : "Tell us about your Fundraiser",
		"type" : "text",
	}))
	state = forms.CharField(widget=forms.TextInput(attrs={
		"name" : "state",
		"id" : "state",
		"class" : "form-group",
		"size" : "20",
		"placeholder" : "State",
		"type" : "text",
	}))
	country = forms.CharField(widget=forms.TextInput(attrs={
		"name" : "country",
		"id" : "country",
		"class" : "form-group",
		"size" : "20",
		"placeholder" : "USA",
		"type" : "text",
	}))
	zip_code = forms.CharField(widget=forms.TextInput(attrs={
		"name" : "zip_code",
		"id" : "zip_code",
		"class" : "form-group",
		"size" : "20",
		"placeholder" : "Zip",
		"type" : "text",
	}))

