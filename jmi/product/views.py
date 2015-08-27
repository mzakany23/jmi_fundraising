from django.contrib import messages
from django.shortcuts import render, HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.contrib import messages

from helper.fundraiser_process_helper import ProductSetHelper


def show_all_salsas(request):
	all_products = ProductSetHelper().all()
	context = {'products' : all_products, 'category' : 'all_salsas'}
	template = "product/show.html"
	return render(request,template,context)

def show_by_category(request,slug):
	helper               = ProductSetHelper(slug)
	products_by_category = helper.products_by_category()
	category             = helper.get_category()
	context = {'products' : products_by_category, 'category' : category}
	template = "product/filtered_by_category.html"
	return render(request,template,context)
