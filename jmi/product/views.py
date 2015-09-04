from django.contrib import messages
from django.shortcuts import render, HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.contrib import messages

from forms import ProductSearchForm

from helper.fundraiser_process_helper import ProductSetHelper,ProductSearchHelper


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

def search_salsas(request):
	form = ProductSearchForm(request.POST or None)
	helper = ProductSearchHelper(request,form)
	if form.is_valid():
		products = helper.get_search_results()
	else:
		return HttpResponseRedirect(reverse('show_all_salsas'))
	
	template = 'product/search_results.html'
	context = {'products' : products}
	return render(request,template,context)
