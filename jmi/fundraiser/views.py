from django.shortcuts import render, HttpResponseRedirect
from django.core.urlresolvers import reverse

def create_fundraiser(request):
	pass
	

def describe_fundraiser(request):
	context = {}
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
