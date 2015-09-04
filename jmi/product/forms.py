from django import forms

class ProductSearchForm(forms.Form):
	keywords = forms.CharField(widget=forms.TextInput(attrs={
		"name" : "searchSalsas",
		"class" : "form-control",
		"size" : "20",
		"placeholder" : "Search our Salsas",
		"type" : "text",
	}))