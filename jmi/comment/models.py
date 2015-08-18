from django.db import models
from fundraiser.models import Fundraiser
from account.models import Profile

class Comment(models.Model):
	fundraiser = models.ForeignKey(Fundraiser)
	approved = models.BooleanField(default=False)
	account = models.ForeignKey(Profile,default=False,null=True)
	title = models.CharField(max_length=40)
	comment = models.TextField(max_length=140,blank=True,null=True)

	def __unicode__(self):
		return self.title + "-" + str(self.fundraiser)
