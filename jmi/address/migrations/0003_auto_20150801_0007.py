# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('address', '0002_remove_address_fundraiser'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='address',
            name='contact',
        ),
        migrations.RemoveField(
            model_name='address',
            name='phone',
        ),
    ]
