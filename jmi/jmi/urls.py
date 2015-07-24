from django.conf.urls import patterns, include, url
from django.contrib import admin
from django.conf import settings

# base
urlpatterns = patterns('',
    url(r'^$', 'home.views.home', name='home'),
    url(r'^admin/', include(admin.site.urls)),
)

# home 
urlpatterns += patterns('',

)

# media
urlpatterns += patterns('',
    (r'^media/(?P<path>.*)$', 'django.views.static.serve', {'document_root': settings.MEDIA_ROOT})
)

