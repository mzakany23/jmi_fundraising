from __future__ import absolute_import
import os
from celery import Celery
from django.conf import settings
import sys 


os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'jmi.settings')
app = Celery('jmi')

app.config_from_object('jmi.celery_config')
app.autodiscover_tasks(lambda: settings.INSTALLED_APPS)
