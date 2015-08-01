from django.test import TestCase, Client
from django.core.urlresolvers import reverse

from product.models import Product

from models import Fundraiser,FundraiserCategory,FundraiserType

from test_helper import create_products,create_fundraisers,get_some_products



class FundraiserTest(TestCase):
	
	def setUp(self):
		create_products(8,['Mild','Medium','Hot'])
		product_set = get_some_products(4)
		create_fundraisers(1,product_set)

		self.client = Client()
		self.fundraiser = Fundraiser.objects.first()

	def test_create_fundraiser(self):
		assert self.fundraiser.__class__ == Fundraiser
	
	def test_fundraiser_has_only_4_possible_selections(self):
		assert len(self.fundraiser.type.selections.values_list()) == 4
	
		
	def test_fundraiser_has_one_shipment_initiated_by_default(self):
		assert len(self.fundraiser.shipments()) == 1

	def test_describe_view(self):
		url = '/lets-do-a-fundraiser/'
		contents = {'organization' : 'Express Soccer', 'description' : 'Lorem ipsom lorem ipsomes'}
		response = self.client.post(url,contents)
		assert response.status_code == 200

	
	


if __name__ == '__main__':
    unittest.main()
		

