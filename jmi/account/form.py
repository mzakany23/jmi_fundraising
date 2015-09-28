from django import forms
from django.forms import ModelForm
from models import Profile
from address.models import Address 


class AddressEditForm(forms.ModelForm):
	class Meta:

		model = Address

		fields = [
			'title',
			'street',
			'line_2',
			'city',
			'state',
			'country',
			'zip_code'
		]

		widgets = {
			'title' : forms.TextInput(attrs={
				"name" : "title",
				"id" : "title",
				"class" : "form-control",
				"size" : "20",
				"placeholder" : "example: Mrs. Doe ",
				"type" : "text",
			}),
			'street' : forms.TextInput(attrs={
				"name" : "title",
				"id" : "title",
				"class" : "form-control",
				"size" : "20",
				"placeholder" : "street",
				"type" : "text",
			}),
			'line_2' : forms.TextInput(attrs={
				"name" : "title",
				"id" : "title",
				"class" : "form-control",
				"size" : "20",
				"placeholder" : "(optional) extra line",
				"type" : "text",
			}),
			'city' : forms.TextInput(attrs={
				"name" : "title",
				"id" : "title",
				"class" : "form-control",
				"size" : "20",
				"placeholder" : "city",
				"type" : "text",
			}),
			'state' : forms.TextInput(attrs={
				"name" : "title",
				"id" : "title",
				"class" : "form-control",
				"size" : "20",
				"placeholder" : "state",
				"type" : "text",
			}),
			'country' : forms.TextInput(attrs={
				"name" : "title",
				"id" : "title",
				"class" : "form-control",
				"size" : "20",
				"placeholder" : "country",
				"type" : "text",
			}),
			'zip_code' : forms.TextInput(attrs={
				"name" : "zip",
				"id" : "zip",
				"class" : "form-control",
				"size" : "20",
				"placeholder" : "Zip Code",
				"type" : "text",
			})
		}

class ProfileEditForm(forms.ModelForm):

	class Meta:

		model = Profile

		fields = [
			'first_name',
			'last_name',
			'email',
			'phone_number',
			'org_photo'
		]

		widgets = {
			'first_name' : forms.TextInput(attrs={
				"name" : "title",
				"id" : "title",
				"class" : "form-control",
				"size" : "20",
				"placeholder" : "Title",
				"type" : "text",
			}),
			'last_name' : forms.TextInput(attrs={
				"name" : "title",
				"id" : "title",
				"class" : "form-control",
				"size" : "20",
				"placeholder" : "Title",
				"type" : "text",
			}),
			'email' : forms.TextInput(attrs={
				"name" : "title",
				"id" : "title",
				"class" : "form-control",
				"size" : "20",
				"placeholder" : "Title",
				"type" : "text",
			}),
			'phone_number' : forms.TextInput(attrs={
				"name" : "title",
				"id" : "title",
				"class" : "form-control",
				"size" : "20",
				"placeholder" : "Title",
				"type" : "text",
			}),
			'org_photo' : forms.FileInput(attrs={
				"type" : "file",
			}),
		}

class DashboardLoginForm(forms.Form):
	username = forms.CharField(widget=forms.TextInput(attrs={
		"name" : "username",
		"id" : "username",
		"class" : "form-control input-lg",
		"placeholder" : "Your username:",
		"type" : "username",
	}))
	email = forms.EmailField(required=False,widget=forms.EmailInput(attrs={
		"name" : "email",
		"id" : "email",
		"class" : "form-control input-lg",
		"placeholder" : "Your email:",
		"type" : "email",
	}))

	password = forms.CharField(widget=forms.TextInput(attrs={
		"name" : "password",
		"id" : "password",
		"class" : "form-control input-lg",
		"placeholder" : "Password:",
		"type" : "password",
	}))

class LoginForm(forms.Form):
	username = forms.CharField(widget=forms.TextInput(attrs={
		"name" : "username",
		"id" : "username",
		"class" : "form-control",
		"placeholder" : "Your username:",
		"type" : "username",
	}))
	email = forms.EmailField(required=False,widget=forms.EmailInput(attrs={
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

	username = forms.CharField(widget=forms.TextInput(attrs={
		'id' : 'username',
		"name" : "username",
		"class" : "form-control",
		"placeholder" : "Pick a username 30 characters or fewer",
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

	confirm = forms.CharField(widget=forms.TextInput(attrs={
		'id' : 'confirm',
		"name" : "confirm",
		"class" : "form-control",
		"placeholder" : "Confirm Password",
		"type" : "password",
	}))

	def clean_confirm(self):
		cleaned_data = super(RegisterUserForm,self).clean()
		password_1 = cleaned_data.get('password')
		password_2 = cleaned_data.get('confirm')

	
		if password_1 != password_2:
			raise forms.ValidationError(
				'passwords do not match.'
			)
		return cleaned_data


class SimpleSignUpForm(forms.Form):
	username = forms.CharField(widget=forms.TextInput(attrs={
		'id' : 'username',
		"name" : "username",
		"class" : "form-control",
		"placeholder" : "Pick a username 30 characters or fewer",
		"type" : "text",
	}))

	
	password = forms.CharField(widget=forms.TextInput(attrs={
		'id' : 'password',
		"name" : "password",
		"class" : "form-control",
		"placeholder" : "Enter Password",
		"type" : "password",
	}))

	confirm = forms.CharField(widget=forms.TextInput(attrs={
		'id' : 'confirm',
		"name" : "confirm",
		"class" : "form-control",
		"placeholder" : "Confirm Password",
		"type" : "password",
	}))

	def clean_confirm(self):
		cleaned_data = super(SimpleSignUpForm,self).clean()
		password_1 = cleaned_data.get('password')
		password_2 = cleaned_data.get('confirm')

	
		if password_1 != password_2:
			raise forms.ValidationError(
				'passwords do not match.'
			)
		return cleaned_data





