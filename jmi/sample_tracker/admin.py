from django.contrib import admin
from models import SampleTracker

class SampleTrackerAdmin(admin.ModelAdmin): 
	class Meta:
		model = SampleTracker

admin.site.register(SampleTracker,SampleTrackerAdmin)

