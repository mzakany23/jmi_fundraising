from api.forms.address import APIAddressForm
from api.forms.profile import APIProfileForm
from model_helper import ProfileHelper

class FormHelper(object):
	def __init__(self,request):
		self.address_form = None
		self.profile_form = None
		self.form = request.POST

	def get_address_form(self):
		address_form = {
			'title' : self.form['addressForm[title]'],
			'street' : self.form['addressForm[street]'],
			'city' : self.form['addressForm[city]'],
			'state' : self.form['addressForm[state]'],
			'zip' : self.form['addressForm[zip]'],
		}

		return APIAddressForm(address_form or None)


	def get_profile_form(self):
		profile_form = {
			'organization' : self.form['profileForm[organization]'],
			'firstName' : self.form['profileForm[firstName]'],
			'lastName' : self.form['profileForm[lastName]'],
			'phoneNumber' : self.form['profileForm[phoneNumber]'],
			'email' : self.form['profileForm[email]']
		}

		return APIProfileForm(profile_form or None)


	def update_profile(self,id):
		profile = ProfileHelper().get_by_id(id)
		if profile:
			
			profile.organization = self.form['profileForm[organization]']
			profile.first_name = self.form['profileForm[firstName]']
			profile.last_name = self.form['profileForm[lastName]']
			profile.phone_number = self.form['profileForm[phoneNumber]']
			profile.email = self.form['profileForm[email]']

			
			profile.address.title = self.form['addressForm[title]']
			profile.address.street = self.form['addressForm[street]']
			profile.address.city = self.form['addressForm[city]']
			profile.address.state = self.form['addressForm[state]']
			profile.address.zip = self.form['addressForm[zip]']

			
			profile.address.save()
			profile.save()

			return (profile, True)
		else:
			return (None,False)
