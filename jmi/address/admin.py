from django.contrib import admin
from models import Address

class AddressAdmin(admin.ModelAdmin):
	class Meta:
		model = Address

admin.site.register(Address,AddressAdmin)