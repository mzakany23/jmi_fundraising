from product.models import Product,Category
from fundraiser.models import Fundraiser,FundraiserCategory,FundraiserType
from django.contrib.auth.models import User


def create_products(num,categories):
		
		created_categories = __create_product_categories(categories)

		cat_sel = 0

		for i in range(num):
			if cat_sel == len(created_categories):
				cat_sel = 0

			p = Product(
				image=u'../../static/static/image/placeholder.jpg',
				title=u'product %s' % i,
				description=u'This is a description of product %s' % i
			)

			p.save()
			p.category.add(created_categories[cat_sel])

			cat_sel += 1

def create_fundraisers(num):
	
	User.objects.create(username='testUser',password='password',email='test@email.com')

	created_fundraiser_types = __create_fundraiser_types(3)

	fr_sel = 0

	for i in range(num):
		if fr_sel == len(created_fundraiser_types):
			fr_sel = 0

		fr = Fundraiser(
			type=created_fundraiser_types[fr_sel],
			title=u'Fundraiser: %s' % i,
			account=User.objects.first()
		)

		fr.save()

	






# private

def __create_product_categories(categories):
	return [Category.objects.create(title=category_name) for category_name in categories]

def __create_fundraiser_types(num):
	return [FundraiserType.objects.create(title=u'Option %s' % i) for i in range(num)]
