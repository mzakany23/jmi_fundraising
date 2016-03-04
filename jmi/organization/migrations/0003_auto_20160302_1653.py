# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('organization', '0002_auto_20160302_1650'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='organization',
            name='line2',
        ),
        migrations.RemoveField(
            model_name='organization',
            name='state',
        ),
        migrations.RemoveField(
            model_name='organization',
            name='street',
        ),
        migrations.RemoveField(
            model_name='organization',
            name='zip_code',
        ),
    ]
