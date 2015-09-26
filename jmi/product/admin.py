from django.contrib import admin
from models import Product, Category

class ProductAdmin(admin.ModelAdmin):
	
	fields = ['featured','product_code','slug','title','image','description','price','category','created','updated']
	readonly_fields = ('product_code','slug','created','updated')
	list_display = ['image','featured','title','price','description','get_category','product_code']
	list_editable = ['featured']
	ordering = ['category']
	class Meta:
		model = Product

class CategoryAdmin(admin.ModelAdmin):
	class Meta:
		model = Category

admin.site.register(Product,ProductAdmin)
admin.site.register(Category,CategoryAdmin)

