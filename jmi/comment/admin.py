from django.contrib import admin

from models import FundraiserOrderComment

class FundraiserOrderCommentAdmin(admin.ModelAdmin): 
	class Meta:
		model = FundraiserOrderComment

admin.site.register(FundraiserOrderComment,FundraiserOrderCommentAdmin)
# Register your models here.
