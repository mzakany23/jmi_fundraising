from django.shortcuts import render,HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.contrib import messages

from models import Discount
from form import EmailNewsLetterForm

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

def add_email_to_newsletter_list(request):
	form = EmailNewsLetterForm(request.POST or None)

	if form.is_valid():
		title = 'email successfully added to our list, thanks!'
		messages.error(request,title)
		form.save()
		return HttpResponseRedirect(reverse('home'))
	else:
		title = 'email invalid'
		messages.error(request,title)
		return HttpResponseRedirect(reverse('home'))