# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('fundraiser', '0012_auto_20151009_0139'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='fundraisercategory',
            name='forms',
        ),
    ]
