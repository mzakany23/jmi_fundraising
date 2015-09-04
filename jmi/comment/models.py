from django.db import models
from fundraiser.models import Fundraiser
from account.models import Profile

class AbstractComment(models.Model):
	fundraiser = models.ForeignKey(Fundraiser)
	comment = models.TextField(max_length=140,blank=True,null=True)

	class Meta:
		abstract = True

class FundraiserOrderComment(AbstractComment):
	def __unicode__(self):
		return self.fundraiser.title

class UserComment(AbstractComment):
	approved = models.BooleanField(default=False)
	account = models.ForeignKey(Profile,default=False,null=True)
	
	def __unicode__(self):
		return self.fundraiser.title

