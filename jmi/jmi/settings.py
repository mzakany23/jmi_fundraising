from env_var import DATABASE, SERVER, STRIPE_API_KEY, EMAIL
import os
BASE_DIR = os.path.dirname(os.path.dirname(__file__))


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.7/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'wyx1ugtz4s2cv(tack3kc5)879s&@o!780@+-xoi0vgqyn)934'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

TEMPLATE_DEBUG = True

ALLOWED_HOSTS = []

SERVER = SERVER

PLACEHOLDER_PIC = SERVER + '/media/product_images/placeholder.jpg'
LOGO = SERVER + '/static/jmi-images/logo.png'

EMAIL_USE_TLS = EMAIL['tls']
EMAIL_HOST = EMAIL['host']
EMAIL_HOST_USER = EMAIL['host_user']
EMAIL_PORT = EMAIL['port']

# Application definition

INSTALLED_APPS = (
    'wpadmin',
    'stdimage',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'rest_framework',
    'home',
    'account',
    'comment',
    'product',
    'fundraiser',
    'address',
    'shipment',
    'marketing',
    'payment',
    'notification'
)


MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.auth.middleware.SessionAuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
)

TEMPLATE_CONTEXT_PROCESSORS = (
    'django.core.context_processors.request',
    'django.contrib.auth.context_processors.auth',
    'django.contrib.messages.context_processors.messages',
    'home.views.get_home_variables',
)

ROOT_URLCONF = 'jmi.urls'

WSGI_APPLICATION = 'jmi.wsgi.application'


# Database
# https://docs.djangoproject.com/en/1.7/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}

# DATABASES = {
#     'default': {
#         'ENGINE': 'django.db.backends.postgresql_psycopg2',
#         'NAME': DATABASE['name'],
#         'HOST': DATABASE['host'],
#         'PORT': DATABASE['port'],
#         'USER': DATABASE['user'],
#         'PASSWORD': DATABASE['password']
#     }
# }

# Internationalization
# https://docs.djangoproject.com/en/1.7/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.7/howto/static-files/

STATIC_URL = '/static/'
STATIC_ROOT = os.path.join(os.path.dirname(BASE_DIR),'static','root')
MEDIA_URL = '/media/'   
MEDIA_ROOT = os.path.join(os.path.dirname(BASE_DIR),'static','media')

Temp_Path = os.path.realpath('.')

TEMPLATE_DIRS = (
    os.path.join(os.path.dirname(BASE_DIR),'static','templates'),
)

STATICFILES_DIRS = (
    os.path.join(os.path.dirname(BASE_DIR),'static','static'),
)

WPADMIN = {
    'admin': {
        'title': 'Jose Madrid Salsa Fundraising',
        'menu': {
            'top': 'wpadmin.menu.menus.BasicTopMenu',
            'left': 'wpadmin.menu.menus.BasicLeftMenu',
        },
        'dashboard': {
            'breadcrumbs': True,
        },
    }
}

BROKER_URL = 'redis://localhost:6379/0'
BROKER_TRANSPORT = 'redis'
