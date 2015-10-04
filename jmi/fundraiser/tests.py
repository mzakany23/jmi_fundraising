from django.test import TestCase, Client
from django.core.urlresolvers import reverse



# app
from models import Fundraiser,FundraiserCategory,FundraiserType
from product.models import Product
from django.contrib.auth.models import User
from jmi.settings import EMAIL_TEMPLATE_DIR

from test_helper import create_products,create_fundraisers,get_some_products

from tasks import send_fundraiser_receipt_email

from django.template.loader import render_to_string

class FundraiserTest(TestCase):
	def setUp(self):
		pass
	# def setUp(self):
	# 	create_products(8,['Mild','Medium','Hot'])
	# 	product_set = get_some_products(4)
	# 	create_fundraisers(1,product_set)

	# 	self.client = Client()
	# 	self.fundraiser = Fundraiser.objects.first()

	# def test_create_fundraiser(self):
	# 	assert self.fundraiser.__class__ == Fundraiser
	
	# def test_fundraiser_has_only_4_possible_selections(self):
	# 	assert len(self.fundraiser.type.selections.values_list()) == 4
	
		
	# def test_fundraiser_has_one_shipment_initiated_by_default(self):
	# 	assert len(self.fundraiser.shipments()) == 1

	# def test_describe_view(self):
	# 	url = '/lets-do-a-fundraiser/'
	# 	contents = {'organization' : 'Express Soccer', 'description' : 'Lorem ipsom lorem ipsomes'}
	# 	response = self.client.post(url,contents)
	# 	assert response.status_code == 200

	def test_email(self):
		user = 'Michael Zakany'
		organization = 'Cleveland Orchestra Musicians'
		title = "Cleveland Orchestra Fall Fundraiser"
		total = '$74.50'
		address = '3300 East Fairfax Rd.'
		city = 'Cleveland Heights'
		state = 'Ohio'
		zip_code = '44118'
		selections = '4 raspberry, 4 peach, 12 verde xx-hot'
		shipping = '$30.00'
		phone = '330-612-6183'

		template = EMAIL_TEMPLATE_DIR+'email_fundraiser_receipt_text_based.txt'

		context = {
			'user' : user,
			'organization' : organization,
			'address' : address,
			'city' : city,
			'state' : state,
			'zip_code' : zip_code,
			'total' : total,
			'title' : title,
			'selections' : selections,
			'shipping' : shipping,
			'phone' : phone
		}

		message = render_to_string(template,context)

		send_fundraiser_receipt_email.delay(
			'Fundraiser', 
			message,
			'mzakany@gmail.com',
			['mzakany@gmail.com'],
		)


	
	


if __name__ == '__main__':
    unittest.main()
		

