from django.db import models
from django.db.models.signals import post_save, post_delete, pre_save, pre_delete

class Organization(models.Model):
	type = models.ForeignKey('OrganizationType',blank=True,null=True)
	name = models.CharField(max_length=40,null=True,blank=True)
	number_of_employees = models.IntegerField(default=0,blank=True,null=True)
	info = models.TextField(max_length=500,blank=True,null=True)
	created = models.DateTimeField(auto_now_add=True,auto_now=False,blank=True,null=True)
	is_parent_organization = models.BooleanField(default=False)
	parent_organization = models.ForeignKey('Organization',blank=True,null=True,related_name='parent')
	child_organizations = models.ManyToManyField('Organization',blank=True,null=True,related_name='children')
	sibling_organizations = models.ManyToManyField('Organization',blank=True,null=True,related_name='sibling')

	def __unicode__(self):
		return str(self.name)

	def main_contact(self):
		return (self.contact_set.first() or None)

	def contacts(self):
		return (self.contact_set.all() or None)

	def addresses(self):
		return (self.address_set.all() or None)

	def fundraisers(self):
		return (self.fundraisers_set.all() or None)


class OrganizationType(models.Model):
	name = models.CharField(max_length=40,null=True,blank=True)

	def __unicode__(self):
		return self.name

class Industry(models.Model):
	name = models.CharField(max_length=40,null=True,blank=True)
	def __unicode__(self):
		return self.name


# delete profile and stripe through their api
def mark_organization_as_parent(sender,instance,*args,**kwargs):
	if not instance.parent_organization:
		instance.is_parent_organization = True
	else:
		instance.is_parent_organization = False

	


pre_save.connect(mark_organization_as_parent,sender=Organization)