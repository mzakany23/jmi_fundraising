from django.contrib import admin
from models import Profile
from django.contrib.admin import AdminSite


class ProfileAdmin(admin.ModelAdmin): 
	class Meta:
		model = Profile

AdminSite.site_header = 'Jose Madrid Salsa Fundraising - sysAdmin'
AdminSite.site_titile = 'JMSF'

admin.site.register(Profile,ProfileAdmin)

