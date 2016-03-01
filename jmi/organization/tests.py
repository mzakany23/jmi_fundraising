from django.test import TestCase, Client
from organization.models import Organization,OrganizationType
from contact.models import Contact 
from address.models import Address
from fundraiser.models import Fundraiser

class OrganizationTest(TestCase):
	def setUp(self):
		pass

	def test_create_organizatio(self):
		organization,created = Organization.objects.get_or_create(
			type=OrganizationType.objects.first(),
			name='Key West Soccer Team',
			number_of_employees=50,
			info='This is the main organization'
		)

		address,created = Address.objects.get_or_create(
			organization=organization,
			shipping=True,
			street='3300 East Fairfax rd.',
			city='Cleveland Hieghts',
			state='OH',
			zip_code='44118'
		)

		contact,created = Contact.objects.get_or_create(
			organization=organization,
			first_name='Mike',
			last_name='Zakany',
			age='33',
			job_title='CEO',
			phone1='330-612-6183',
			email1='mzakany@gmail.com'
		)

		# fundraiser,created = Fundraiser.objects.get_or_create(

		# )

		print organization.fundraisers()


		

		
		
if __name__ == '__main__':
    unittest.main()
		

