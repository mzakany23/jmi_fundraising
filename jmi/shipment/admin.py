from django.contrib import admin
from models import Shipment,Selection

class ShipmentAdmin(admin.ModelAdmin):
	class Meta:
		model = Shipment

class SelectionAdmin(admin.ModelAdmin): 
	class Meta:
		model = Selection

admin.site.register(Selection,SelectionAdmin)
admin.site.register(Shipment,ShipmentAdmin)
