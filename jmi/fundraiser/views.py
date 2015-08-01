from django.shortcuts import render, HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.contrib import messages

from fundraiser.models import Fundraiser
from account.models import Profile

from form import FundraiserDescribeForm

def describe_fundraiser(request):
	form = FundraiserDescribeForm(request.POST or None)
	
	if form.is_valid():

		title         = form.cleaned_data['title']
		organization  = form.cleaned_data['organization']
		description   = form.cleaned_data['description']

		try:
			fr = Fundraiser.objects.get(title=title)
		except:
			fr = None

		try:
			pr = Profile.objects.get(organization=organization)
		except:
			pr = None

		if fr and pr:
			messages.error(
				request, "Woops, choose a more unique fundraiser name, there already exists one with the same name.")
			return HttpResponseRedirect(reverse('describe_fundraiser'))
		else:
			profile, created = Profile.objects.get_or_create(organization=organization)
			fundraiser = Fundraiser.objects.create(title=title,profile=profile)
			request.session['current_fundraiser'] = fundraiser.id
			return HttpResponseRedirect(reverse('choose_fundraiser'))

	context = {'form' : form}
	template = 'fundraiser/describe.html'
	return render(request,template,context)
	
def choose_fundraiser(request):
	context = {}
	template = 'fundraiser/choose.html'
	return render(request,template,context)

def create_shipment(request):
	context = {}
	template = 'fundraiser/shipment.html'
	return render(request,template,context)
