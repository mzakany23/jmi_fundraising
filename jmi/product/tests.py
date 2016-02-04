from django.test import TestCase, Client
from product.models import Product,Category

class FundraiserTest(TestCase):
	def setUp(self):
		pass


	def test_category_list(self):
		categories = Category.objects.all()
		for cat in categories:
			print cat
		

if __name__ == '__main__':
    unittest.main()
		

