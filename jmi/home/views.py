from django.shortcuts import render

def home(request):
	context = {}
	template = 'home/index.html'
	return render(request,template,context)

