from django.contrib import admin
from models import Shipment,Selection


class SelectionInline(admin.TabularInline):
	model = Selection

class ShipmentAdmin(admin.ModelAdmin):
	list_display = ['fundraiser','address','comment']
	inlines = [SelectionInline]
	

	class Meta:
		model = Shipment


        
class SelectionAdmin(admin.ModelAdmin): 
	class Meta:
		model = Selection

admin.site.register(Selection,SelectionAdmin)
admin.site.register(Shipment,ShipmentAdmin)
