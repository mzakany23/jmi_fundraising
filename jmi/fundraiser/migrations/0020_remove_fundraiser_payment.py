# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('fundraiser', '0019_auto_20150818_1612'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='fundraiser',
            name='payment',
        ),
    ]
