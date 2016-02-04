from django import forms


class APIProfileForm(forms.Form):
	organization = forms.CharField()
	firstName = forms.CharField()
	lastName = forms.CharField()
	phoneNumber = forms.CharField()
	email = forms.CharField()

	

# class RegisterUserForm(forms.Form):
# 	organization = forms.CharField(required=False,widget=forms.TextInput(attrs={
# 		'id' : 'organization',
# 		"name" : "organization",
# 		"class" : "form-control",
# 		"placeholder" : "Dont have organization? Just leave blank...",
# 		"type" : "text",
# 	}))

# 	username = forms.CharField(widget=forms.TextInput(attrs={
# 		'id' : 'username',
# 		"name" : "username",
# 		"class" : "form-control",
# 		"placeholder" : "Pick a username 30 characters or fewer",
# 		"type" : "text",
# 	}))

# 	first_name = forms.CharField(widget=forms.TextInput(attrs={
# 		'id' : 'name',
# 		"name" : "name",
# 		"class" : "form-control",
# 		"placeholder" : "Enter first name",
# 		"type" : "text",
# 	}))

# 	last_name = forms.CharField(widget=forms.TextInput(attrs={
# 		'id' : 'name',
# 		"name" : "name",
# 		"class" : "form-control",
# 		"placeholder" : "Enter first name",
# 		"type" : "text",
# 	}))

# 	email = forms.CharField(widget=forms.TextInput(attrs={
# 		'id' : 'email',
# 		"name" : "email",
# 		"class" : "form-control",
# 		"placeholder" : "Enter Email",
# 		"type" : "email",
# 	}))

# 	password = forms.CharField(widget=forms.TextInput(attrs={
# 		'id' : 'password',
# 		"name" : "password",
# 		"class" : "form-control",
# 		"placeholder" : "Enter Password",
# 		"type" : "password",
# 	}))

# 	confirm = forms.CharField(widget=forms.TextInput(attrs={
# 		'id' : 'confirm',
# 		"name" : "confirm",
# 		"class" : "form-control",
# 		"placeholder" : "Confirm Password",
# 		"type" : "password",
# 	}))

# 	def clean_confirm(self):
# 		cleaned_data = super(RegisterUserForm,self).clean()
# 		password_1 = cleaned_data.get('password')
# 		password_2 = cleaned_data.get('confirm')

	
# 		if password_1 != password_2:
# 			raise forms.ValidationError(
# 				'passwords do not match.'
# 			)
# 		return cleaned_data

# 	def clean_email(self):
# 		cleaned_data = super(RegisterUserForm,self).clean()
# 		email = cleaned_data.get('email')
# 		try:
# 			email = Profile.objects.filter(email=email)
# 		except:
# 			email = None

# 		if email:
# 			raise forms.ValidationError(
# 				'email exists, use a more unique one.'
# 			)
# 		return cleaned_data


