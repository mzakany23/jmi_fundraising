from django.conf.urls import patterns, include, url
from django.contrib import admin
from django.conf import settings

from api.fundraiser.views import FundraiserProcessView


# base
urlpatterns = patterns('',
    url(r'^admin/', include(admin.site.urls)),
)

# home 
urlpatterns += patterns('home.views',
	url(r'^$', 'home', name='home'),
)

# account
urlpatterns += patterns('account.views',
	url(r'^account/login', 'auth_login', name='auth_login'),
	url(r'^account/simple-sign-up', 'auth_simple_sign_up', name='auth_simple_sign_up'),
	url(r'^account/logout', 'auth_logout', name='auth_logout'),
	url(r'^account/create', 'auth_create_account', name='auth_create_account'),

)

# media
urlpatterns += patterns('',
    (r'^media/(?P<path>.*)$', 'django.views.static.serve', {'document_root': settings.MEDIA_ROOT})
)

# fundraiser
urlpatterns += patterns('fundraiser.views',
	url(r'^lets-do-a-fundraiser', 'describe_fundraiser', name='describe_fundraiser'),
	url(r'^fundraiser/$', 'choose_fundraiser', name='choose_fundraiser'),
	url(r'^fundraiser/(?P<slug>[-\w]+)/$', 'chosen_fundraiser_type', name='chosen_fundraiser_type'),
	url(r'^pick-salsas/$', 'choose_salsas', name='choose_salsas'),
	url(r'^fundraiser-shipment', 'create_shipment', name='create_shipment'),
	url(r'^fundraiser-get-back-on-track/$', 'get_back_on_track', name='get_back_on_track'),
	url(r'^checkout/$', 'checkout', name='checkout'),
	url(r'^summary-invoice/$', 'process_checkout', name='process_checkout'),
	url(r'^type-selection/(?P<id>\d+)$','get_fundraiser_selections_via_ajax',name='get_fundraiser_selections_via_ajax'),
)

# marketing
urlpatterns += patterns('marketing.views',
	url(r'^valid-discount/','process_discount',name='process_discount'),
)

# admin-dashboard
urlpatterns += patterns('dashboard.views',
	url(r'^dashboard/$', 'dashboard_index', name='dashboard_index'),
)

# api
urlpatterns += patterns('api.fundraiser.views',
	url(r'^process-fundraiser/',FundraiserProcessView.as_view(),name='process_fundraiser'),
)

