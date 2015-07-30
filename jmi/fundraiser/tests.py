from django.test import TestCase

from product.models import Product

from models import Fundraiser,FundraiserCategory,FundraiserType

from test_helper import create_products,create_fundraisers



class FundraiserTest(TestCase):
	
	def setUp(self):
		create_products(8,['Mild','Medium','Hot'])
		create_fundraisers(4)

		self.fundraiser = Fundraiser.objects.first()

	def test_create_fundraiser(self):
		assert self.fundraiser.__class__ == Fundraiser
	
	def test_new_fundraiser_has_empty_selections(self):
		assert self.fundraiser.selections() == None

	def test_add_selection_to_fundraiser(self):
		product = Product.objects.first()
		self.fundraiser.type.selections.add(product)
		assert len(self.fundraiser.type.selections.values()) > 0

	
		

		

	
			


if __name__ == '__main__':
    unittest.main()
		

