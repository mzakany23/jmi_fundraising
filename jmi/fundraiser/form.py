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
	# first_name = forms.CharField(widget=forms.TextInput(attrs={
	# 	"name" : "firstName",
	# 	"id" : "firstName",
	# 	"class" : "form-control",
	# 	"size" : "20",
	# 	"placeholder" : "First Name",
	# 	"type" : "text",
	# }))

	# last_name = forms.CharField(widget=forms.TextInput(attrs={
	# 	"name" : "lastName",
	# 	"id" : "lastName",
	# 	"class" : "form-control",
	# 	"size" : "20",
	# 	"placeholder" : "Last Name",
	# 	"type" : "text",
	# }))
	# phone_number = forms.CharField(widget=forms.TextInput(attrs={
	# 	"name" : "phoneNumber",
	# 	"id" : "phoneNumber",
	# 	"class" : "form-control",
	# 	"size" : "20",
	# 	"placeholder" : "Phone",
	# 	"type" : "text",
	# }))
	# email = forms.EmailField(widget=forms.TextInput(attrs={
	# 	"name" : "email",
	# 	"id" : "email",
	# 	"class" : "form-control",
	# 	"size" : "20",
	# 	"placeholder" : "Email",
	# 	"type" : "text",
	# }))
	# org_photo = forms.CharField(widget=forms.TextInput(attrs={
	# 	"name" : "photo",
	# 	"id" : "photo",
	# 	"class" : "form-control",
	# 	"size" : "20",
	# 	"placeholder" : "Org Pic",
	# 	"type" : "text",
	# }))
	
