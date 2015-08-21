from django import forms
from models import EmailNewsLetter

class EmailNewsLetterForm(forms.ModelForm):

	class Meta:

		model = EmailNewsLetter

		fields = ['email']
		widgets = {
			'email' : forms.TextInput(attrs={
				"name" : "title",
				"id" : "title",
				"class" : "form-control",
				"size" : "20",
				"placeholder" : "Put your email",
				"type" : "text",
			})
		}

