from django import forms


class FundraiserDescribeForm(forms.Form):
	title = forms.CharField(widget=forms.TextInput(attrs={
		"name" : "title",
		"id" : "title",
		"class" : "form-control",
		"size" : "20",
		"placeholder" : "Title of your Fundraiser",
		"type" : "text",
	}))
	organization = forms.CharField(widget=forms.TextInput(attrs={
		"name" : "organization Name",
		"id" : "organization",
		"class" : "form-control",
		"size" : "20",
		"placeholder" : "Organization Name",
		"type" : "text",
	}))
	description = forms.CharField(widget=forms.Textarea(attrs={
		"name" : "description",
		"id" : "description",
		"rows" : 3,
		"class" : "form-control",
		"size" : "20",
		"placeholder" : "Tell us about your Fundraiser",
		"type" : "text",
	}))

class LoggedInFundraiserDescribeForm(forms.Form):
	title = forms.CharField(widget=forms.TextInput(attrs={
		"name" : "title",
		"id" : "title",
		"class" : "form-control",
		"size" : "20",
		"placeholder" : "Title of your Fundraiser",
		"type" : "text",
	}))
	description = forms.CharField(widget=forms.Textarea(attrs={
		"name" : "description",
		"id" : "description",
		"rows" : 3,
		"class" : "form-control",
		"size" : "20",
		"placeholder" : "Tell us about your Fundraiser",
		"type" : "text",
	}))


	