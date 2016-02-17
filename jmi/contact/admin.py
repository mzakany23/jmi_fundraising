from django.contrib import admin
from models import Contact,ContactType

class ContactAdmin(admin.ModelAdmin): 
	class Meta:
		model = Contact

admin.site.register(Contact,ContactAdmin)

class ContactTypeAdmin(admin.ModelAdmin): 
	class Meta:
		model = ContactType

admin.site.register(ContactType,ContactTypeAdmin)
