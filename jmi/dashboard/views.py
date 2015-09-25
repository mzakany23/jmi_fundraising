# django
from django.shortcuts import render,HttpResponseRedirect
from django.contrib import messages
from django.core.urlresolvers import reverse
from django.contrib.auth import authenticate,login,logout
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator

# app
from product.models import Product,Category
from fundraiser.models import Fundraiser,FundraiserType
from shipment.models import Shipment,Selection
from django.contrib.auth.models import User

# form
from account.form import DashboardLoginForm

# helper
from helper.fundraiser_process_helper import AuthUserHelper,SessionVariable
from helper.dashboard_helper import DashboardHelper
from helper.email_helper import EmailHelper

def dashboard_index(request):
	session = SessionVariable(request)
	user = request.user 

	if user.is_authenticated() and user.is_superuser:
		dashboard = DashboardHelper()
		pages = Paginator(dashboard.all_fundraisers(),2)
		context = {
			'dashboard' : dashboard,
			'session' : session,
			'pages' : pages
		}

		template = "dashboard/dashboard.html"
		return render(request,template,context)
	else:
		return HttpResponseRedirect(reverse('jmi_admin_login'))

def jmi_admin_login(request):
	form = DashboardLoginForm(request.POST or None)
	if request.POST:	
		auth_helper = AuthUserHelper(request,form)
		if auth_helper.form_is_valid():
			auth_helper.login_with_username_and_password()
			if auth_helper.logged_in_successfully():
				return HttpResponseRedirect(reverse('dashboard_index'))
			else:
				title = "login didn't work."
				messages.error(request,title)
				return HttpResponseRedirect(reverse(jmi_admin_login))			

	context = {'form' : form}
	template = "dashboard/login.html"
	return render(request,template,context)	


def fundraiser_update(request,id):
	try:
		fundraiser = Fundraiser.objects.get(id=id)
	except:
		fundraiser = None

	if request.POST:
		post = request.POST 
	
		if not fundraiser.status == post['selectBox']:
			fundraiser.status = post['selectBox']
			fundraiser.save()
	
	return HttpResponseRedirect(reverse('dashboard_index'))










