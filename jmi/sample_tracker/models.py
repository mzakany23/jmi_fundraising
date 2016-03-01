from django.db import models
from organization.models import Organization 

class SampleTracker(models.Model):
	organization = models.ForeignKey(Organization)
	date_sent = models.DateField(auto_now_add=True,auto_now=False)
	received_forms_back = models.BooleanField(default=False)

	def __unicode__(self):
		return 'Samples for %s' % self.organization