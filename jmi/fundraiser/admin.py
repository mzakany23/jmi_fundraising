from django.contrib import admin

from models import Fundraiser,FundraiserCategory,FundraiserType

class FundraiserAdmin(admin.ModelAdmin):
	class Meta:
		model = Fundraiser


class FundraiserCategoryAdmin(admin.ModelAdmin):
	class Meta:
		model = FundraiserCategory


class FundraiserTypeAdmin(admin.ModelAdmin): 
	readonly_fields = ['slug']
	class Meta:
		model = FundraiserType

admin.site.register(FundraiserType,FundraiserTypeAdmin)
admin.site.register(Fundraiser,FundraiserAdmin)
admin.site.register(FundraiserCategory,FundraiserCategoryAdmin)