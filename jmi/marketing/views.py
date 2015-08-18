from django.shortcuts import render,HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.contrib import messages

from models import Discount

from helper.initialize_helper import SessionVariable
from fundraiser.models import Fundraiser

def process_discount(request):
	post = request.POST or None

	if post:
		discount_code = post['discount']
		discount = Discount(request,discount_code)
		
		if discount.is_valid():
			discount.use_discount()
			messages.success(
				request, "Discount code accepted!")
		else:
			messages.error(
				request, "Invalid discount code.")
			
	return HttpResponseRedirect(reverse('checkout'))