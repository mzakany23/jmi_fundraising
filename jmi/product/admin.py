from django.contrib import admin
from models import Product, Category

class ProductAdmin(admin.ModelAdmin):
	
	fields = ['product_code','slug','title','image','description','price','category','created','updated']
	readonly_fields = ('product_code','slug','created','updated')
	ordering = ['title']
	class Meta:
		model = Product

class CategoryAdmin(admin.ModelAdmin):
	class Meta:
		model = Category

admin.site.register(Product,ProductAdmin)
admin.site.register(Category,CategoryAdmin)

