from django.shortcuts import render

def create_fundraiser(request):
	context = {}
	template = 'fundraiser/index.html'
	return render(request,template,context)
