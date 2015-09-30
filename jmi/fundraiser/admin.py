from django.contrib import admin


from models import Fundraiser,FundraiserCategory,FundraiserType
from shipment.models import Shipment
from comment.models import UserComment


class CommentInline(admin.TabularInline):
	model = UserComment

class ShipmentInline(admin.TabularInline):
	model = Shipment

class FundraiserAdmin(admin.ModelAdmin):

	readonly_fields = ['created','updated','slug']
	list_display = ['profile','finalized','receipt_email_sent','total_cost','title','account','selection_list']
	# fieldsets = (
 #      ('Standard info', {
 #          'fields': ('title','description','type','finalized')
 #      }),
 #      ('Profile info', {
 #          'fields': ('profile','account',)
 #      }),
 #      ('Sale info', {
 #          'fields': ('discount','account',)
 #      }),
 #      ('Other info', {
 #          'fields': ('receipt_email_sent','created','updated',)
 #      }),
 #   	)	
 #   	inlines = [ShipmentInline,CommentInline]
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