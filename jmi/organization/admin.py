from django.contrib import admin
from models import Organization,OrganizationType,Industry

class OrganizationAdmin(admin.ModelAdmin): 
	readonly_fields = ['is_parent_organization']
	class Meta:
		model = Organization


admin.site.register(Organization,OrganizationAdmin)


class OrganizationTypeAdmin(admin.ModelAdmin): 
	class Meta:
		model = OrganizationType

admin.site.register(OrganizationType,OrganizationTypeAdmin)

class IndustryAdmin(admin.ModelAdmin): 
	class Meta:
		model = Industry

admin.site.register(Industry,IndustryAdmin)

