from django.contrib import admin
from models import Contact,ContactType

class ContactAdmin(admin.ModelAdmin): 
	list_display = ['first_name','last_name','id','job_title']
	class Meta:
		model = Contact

admin.site.register(Contact,ContactAdmin)

class ContactTypeAdmin(admin.ModelAdmin): 
	class Meta:
		model = ContactType

admin.site.register(ContactType,ContactTypeAdmin)
