from __future__ import absolute_import

import os
import django

import celery
from django.conf import settings

os.environ.setdefault('DJANGO_SETTINGS_MODULE','jmi.settings')
django.setup()

app = celery.Celery('jmi')

app.config_from_object('django.conf:settings')
app.autodiscover_tasks(lambda: settings.INSTALLED_APPS)

