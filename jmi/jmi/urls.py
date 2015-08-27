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
	url(r'^account/fundraiser/login', 'auth_login_and_add_account_to_fundraiser', name='auth_login_and_add_account_to_fundraiser'),
	url(r'^account/create', 'auth_create_account', name='auth_create_account'),
	# profile
	url(r'^profile/$', 'profile_show', name='profile_show'),
	url(r'^profile/(?P<slug>[-\w]+)/$', 'profile_detail', name='profile_detail'),
	url(r'^profile/fundraiser/(?P<slug>[-\w]+)/$', 'profile_fundraiser_detail', name='profile_fundraiser_detail'),

)

# product
urlpatterns += patterns('product.views',
	url(r'^products/show-salsas/$','show_all_salsas',name='show_all_salsas'),
	url(r'^categories/(?P<slug>[-\w]+)','show_by_category',name='show_by_category'),
)

# media
urlpatterns += patterns('',
    (r'^media/(?P<path>.*)$', 'django.views.static.serve', {'document_root': settings.MEDIA_ROOT})
)

# fundraiser
urlpatterns += patterns('fundraiser.views',
	# describe
	url(r'^start-process/$', 'start_process', name='start_process'),
	url(r'^start-over/$', 'start_over', name='start_over'),
	url(r'^lets-do-a-fundraiser/$', 'describe_fundraiser', name='describe_fundraiser'),
	url(r'^choose-profile-for-fundraiser/$', 'choose_profile_for_fundraiser', name='choose_profile_for_fundraiser'),
	url(r'^(?P<slug>[-\w]+)/lets-do-another-fundraiser/$', 'logged_in_describe_fundraiser', name='logged_in_describe_fundraiser'),
	# fundraiser type
	url(r'^fundraiser/$', 'choose_fundraiser', name='choose_fundraiser'),
	url(r'^fundraiser/(?P<slug>[-\w]+)/$', 'chosen_fundraiser_type', name='chosen_fundraiser_type'),
	# choose salsas
	url(r'^pick-salsas/$', 'choose_salsas', name='choose_salsas'),
	# shipment
	url(r'^fundraiser-shipment', 'create_shipment', name='create_shipment'),
	url(r'^fundraiser/shipment/edit/(?P<id>\d+)$', 'edit_shipment', name='edit_shipment'),
	url(r'^fundraiser-get-back-on-track/$', 'get_back_on_track', name='get_back_on_track'),
	# checkout
	url(r'^checkout/$', 'checkout', name='checkout'),
	url(r'^summary-invoice/$', 'process_checkout', name='process_checkout'),
	url(r'^type-selection/(?P<id>\d+)$','get_fundraiser_selections_via_ajax',name='get_fundraiser_selections_via_ajax'),
)

# marketing
urlpatterns += patterns('marketing.views',
	url(r'^valid-discount/','process_discount',name='process_discount'),
	url(r'^view/','add_email_to_newsletter_list',name='add_email_to_newsletter_list'),
)

# admin-dashboard
urlpatterns += patterns('dashboard.views',
	url(r'^dashboard/login/$','jmi_admin_login',name='jmi_admin_login'),
	url(r'^dashboard/$', 'dashboard_index', name='dashboard_index'),
)

# api
urlpatterns += patterns('api.fundraiser.views',
	url(r'^api/process-fundraiser/',FundraiserProcessView.as_view(),name='process_fundraiser'),
)

