# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('contact', '0002_auto_20160209_2135'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='contact',
            name='address',
        ),
        migrations.RemoveField(
            model_name='contact',
            name='note',
        ),
        migrations.RemoveField(
            model_name='contact',
            name='organizations',
        ),
    ]
