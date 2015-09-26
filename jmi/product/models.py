from django.db import models
from django.db.models.signals import post_save
from django.utils.text import slugify
from django.dispatch import receiver
from django.core.urlresolvers import reverse
from django.conf import settings

class Product(models.Model):
	product_code = models.CharField(max_length=100,blank=True,null=True)
	image        = models.ImageField(upload_to='product_images',blank=True,null=True)
	slug         = models.SlugField(blank=True,null=True)
	title   	 = models.CharField(max_length=40)
	description  = models.TextField(max_length=1000,blank=True,null=True)
	price        = models.DecimalField(max_digits=10,decimal_places=2,default=3.00)
	category     = models.ManyToManyField('Category',blank=True,null=True)
	created      = models.DateTimeField(auto_now_add=True,auto_now=False)
	updated      = models.DateTimeField(auto_now_add=False,auto_now=True)
	featured     = models.BooleanField(default=False)

	def __unicode__(self):
		return self.title
	
	def get_category(self):
		return [str(cat.title) for cat in self.category.all()]
	
	def get_absolute_url(self):
		return "%s/media/%s" % (settings.SERVER, self.image)

def generate_product_code_receiver(sender,instance,created,*args,**kwargs):
	if created:
		generated_code = "%s %s" %('product-',instance.id)
		try:
			obj_exists = Product.objects.get(product_code=generated_code)
			instance.save()
		except Product.DoesNotExist:
			instance.product_code = generated_code
			instance.save()
		except:
			pass

def generate_slug_receiver(sender,instance,created,*args,**kwargs):
	if created:
		new_slug = "%s %s" %(instance.title,instance.id)
		slug_title = slugify(new_slug)
		try:
			obj_exists = Product.objects.get(slug=slug_title)
			slugify(new_slug)
			instance.save()
		except Product.DoesNotExist:
			instance.slug = slug_title
			instance.save()
		except Product.MultipleObjectsReturned:
			slugify(new_slug)
			instance.save()
		except:
			pass

post_save.connect(generate_product_code_receiver,sender=Product)
post_save.connect(generate_slug_receiver,sender=Product)


class ProductImage(models.Model):
	default = models.BooleanField(default=False,blank=False,null=False)
	image = models.ImageField(upload_to='product_images')
	zoom_image = models.BooleanField(default=False)
	product = models.ForeignKey(Product,blank=True,null=True)
	
	def __unicode__(self):
		return str(self.image)


class Category(models.Model):
	title = models.CharField(max_length=40,blank=True,null=True)
	order = models.IntegerField(default=0,blank=True,null=True)  
	slug  = models.CharField(max_length=40,blank=True,null=True)     

	def __unicode__(self):
		return self.title

	def save(self,*args, **kwargs):
		self.slug = slugify(self.title) + "-" + str(self.id)
		super(Category, self).save(*args, **kwargs)






