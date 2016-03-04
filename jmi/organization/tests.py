from django.test import TestCase, Client
from organization.models import Organization,OrganizationType
from contact.models import Contact 
from address.models import Address
from account.models import Profile
from fundraiser.models import Fundraiser,FundraiserType,FundraiserCategory

class OrganizationTest(TestCase):
	def setUp(self):
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

		address,created = Address.objects.get_or_create(
			organization=organization,
			shipping=True,
			street='2641 Shaker Rd.',
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

		contact,created = Contact.objects.get_or_create(
			organization=organization,
			first_name='Joanna',
			last_name='Zakany',
			age='31',
			job_title='Employee',
			phone1='216-548-6738',
			email1='mzakany@gmail.com'
		)

		fundraiser,created = Fundraiser.objects.get_or_create(
			organizations=organization, 
			title='mikes test fundraiser',
			description='raise money for some team',
			type=FundraiserType.objects.first(),
			plan=FundraiserCategory.objects.first(),
			status='unpaid'
		)

		self.organization = organization

	def test_create_org(self):
		assert self.organization.contacts()

		
		
if __name__ == '__main__':
    unittest.main()
		

