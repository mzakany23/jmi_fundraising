from api.forms.address import APIAddressForm
from api.forms.profile import APIProfileForm
from model_helper import ProfileHelper

class FormHelper(object):
	def __init__(self,request):
		self.address_form = None
		self.profile_form = None
		self.form = request.POST
		self.address_format = None
		self.profile_format = None

	def get_address_form(self):
		try:
			first_format = self.form['title']
		except:
			first_format = None

		try:
			second_format = self.form['addressForm[title]']
		except:
			second_format = None

		if not first_format:
			first_format = 'None'

		if first_format:
			self.address_format = 1
			address_form = {
				'title' : first_format,
				'street' : self.form['street'],
				'city' : self.form['city'],
				'state' : self.form['state'],
				'zip' : self.form['zip'],
			}

		elif second_format:
			self.address_format = 2
			address_form = {
				'title' : self.form['addressForm[title]'],
				'street' : self.form['addressForm[street]'],
				'city' : self.form['addressForm[city]'],
				'state' : self.form['addressForm[state]'],
				'zip' : self.form['addressForm[zip]'],
			}
		else:
			self.address_format = 1
			address_form = {
				'title' : self.form['title'],
				'street' : self.form['street'],
				'city' : self.form['city'],
				'state' : self.form['state'],
				'zip' : self.form['zip'],
			}
		return APIAddressForm(address_form)

	def get_profile_form(self):
		try:
			first_format = self.form['organization']
		except:
			first_format = None 

		try:
			second_format = self.form['profileForm[organization]']
		except:
			second_format = None 

		
		if first_format:
			self.profile_format = 1
			profile_form = {
				'organization' : self.form['organization'],
				'firstName' : self.form['firstName'],
				'lastName' : self.form['lastName'],
				'phoneNumber' : self.form['phoneNumber'],
				'email' : self.form['email']
			}
		elif second_format:
			self.profile_format = 2
			profile_form = {
				'organization' : self.form['profileForm[organization]'],
				'firstName' : self.form['profileForm[firstName]'],
				'lastName' : self.form['profileForm[lastName]'],
				'phoneNumber' : self.form['profileForm[phoneNumber]'],
				'email' : self.form['profileForm[email]']
			}
		else:
			self.profile_format = 1
			profile_form = {
				'organization' : self.form['organization'],
				'firstName' : self.form['firstName'],
				'lastName' : self.form['lastName'],
				'phoneNumber' : self.form['phoneNumber'],
				'email' : self.form['email']
			}

		return APIProfileForm(profile_form)


	def update_profile(self,id):
		profile = ProfileHelper().get_by_id(id)
		if profile:
			
			if self.profile_format == 1:
				profile.organization = self.form['organization']
				profile.first_name = self.form['firstName']
				profile.last_name = self.form['lastName']
				profile.phone_number = self.form['phoneNumber']
				profile.email = self.form['email']
			
			elif self.profile_format == 2:
				profile.organization = self.form['profileForm[organization]']
				profile.first_name = self.form['profileForm[firstName]']
				profile.last_name = self.form['profileForm[lastName]']
				profile.phone_number = self.form['profileForm[phoneNumber]']
				profile.email = self.form['profileForm[email]']

			
			if self.address_format == 1:
				profile.address.title = self.form['title']
				profile.address.street = self.form['street']
				profile.address.city = self.form['city']
				profile.address.state = self.form['state']
				profile.address.zip = self.form['zip']
			
			elif self.address_format == 2:
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
