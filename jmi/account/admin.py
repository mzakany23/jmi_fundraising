from django.contrib import admin
from models import Profile,PasswordReset
from django.contrib.admin import AdminSite

class PasswordResetAdmin(admin.ModelAdmin): 
	readonly_fields = ['key']
	class Meta:
		model = PasswordReset

admin.site.register(PasswordReset,PasswordResetAdmin)


class ProfileAdmin(admin.ModelAdmin):
	list_display = ['organization','first_name','last_name','phone_number','email','slug']
	readonly_fields = ['slug']

	class Meta:
		model = Profile


AdminSite.site_header = 'Jose Madrid Salsa Fundraising - sysAdmin'
AdminSite.site_titile = 'JMSF'


admin.site.register(Profile,ProfileAdmin)

