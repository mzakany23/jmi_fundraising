from django.shortcuts import render,HttpResponseRedirect
from django.contrib import messages
from django.core.urlresolvers import reverse
from django.contrib.auth import authenticate,login,logout
from django.contrib.auth.decorators import login_required

from product.models import Product,Category
from fundraiser.models import Fundraiser,FundraiserType
from shipment.models import Shipment,Selection


def dashboard_index(request):
	try:
		all_products = Product.objects.all()
	except: 
		all_products = None	

	try:
		all_fundraisers = Fundraiser.objects.all()
	except: 
		all_fundraisers = None

	context = {
		'all_fundraisers' : all_fundraisers,
		'all_products' : all_products
	}

	template = "dashboard/index.html"
	return render(request,template,context)
