from django.contrib import admin

from models import GenericDiscount,SingleDiscount,EmailNewsLetter

class GenericDiscountAdmin(admin.ModelAdmin): 
	class Meta:
		model = GenericDiscount

admin.site.register(GenericDiscount,GenericDiscountAdmin)

class SingleDiscountAdmin(admin.ModelAdmin): 
	class Meta:
		model = SingleDiscount

admin.site.register(SingleDiscount,SingleDiscountAdmin)

class EmailNewsLetterAdmin(admin.ModelAdmin): 
	class Meta:
		model = EmailNewsLetter

admin.site.register(EmailNewsLetter,EmailNewsLetterAdmin)

