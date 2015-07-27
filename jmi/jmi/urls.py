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

# account
urlpatterns += patterns('account.views',
	url(r'^login', 'auth_login', name='auth_login'),
	url(r'^/logout', 'auth_logout', name='auth_logout'),
	url(r'^/create', 'auth_create_account', name='auth_create_account'),
)

# media
urlpatterns += patterns('',
    (r'^media/(?P<path>.*)$', 'django.views.static.serve', {'document_root': settings.MEDIA_ROOT})
)

