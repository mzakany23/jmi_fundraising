from django import forms
from django.forms import ModelForm

class LoginForm(forms.Form):
	
	email = forms.EmailField(widget=forms.EmailInput(attrs={
		"name" : "email",
		"id" : "email",
		"class" : "form-control",
		"placeholder" : "Your email:",
		"type" : "email",
	}))

	password = forms.CharField(widget=forms.TextInput(attrs={
		"name" : "password",
		"id" : "password",
		"class" : "form-control",
		"placeholder" : "Password:",
		"type" : "password",
	}))

	

class RegisterUserForm(forms.Form):
	organization = forms.CharField(required=False,widget=forms.TextInput(attrs={
		'id' : 'organization',
		"name" : "organization",
		"class" : "form-control",
		"placeholder" : "Dont have organization? Just leave blank...",
		"type" : "text",
	}))

	first_name = forms.CharField(widget=forms.TextInput(attrs={
		'id' : 'name',
		"name" : "name",
		"class" : "form-control",
		"placeholder" : "Enter first name",
		"type" : "text",
	}))

	last_name = forms.CharField(widget=forms.TextInput(attrs={
		'id' : 'name',
		"name" : "name",
		"class" : "form-control",
		"placeholder" : "Enter first name",
		"type" : "text",
	}))

	email = forms.CharField(widget=forms.TextInput(attrs={
		'id' : 'email',
		"name" : "email",
		"class" : "form-control",
		"placeholder" : "Enter Email",
		"type" : "email",
	}))
	password = forms.CharField(widget=forms.TextInput(attrs={
		'id' : 'password',
		"name" : "password",
		"class" : "form-control",
		"placeholder" : "Enter Password",
		"type" : "password",
	}))

	confirm_password = forms.CharField(widget=forms.TextInput(attrs={
		'id' : 'password-confirm',
		"name" : "password-confirm",
		"class" : "form-control",
		"placeholder" : "Confirm Password",
		"type" : "password",
	}))

	def clean_password(self):
		cleaned_data = super(RegisterUserForm,self).clean()
		password_1 = cleaned_data.get('password')
		password_2 = cleaned_data.get('confirm_password')

		if password_1 != password_2:
			raise forms.ValidationError(
				'passwords do not match.'
			)
		return cleaned_data







