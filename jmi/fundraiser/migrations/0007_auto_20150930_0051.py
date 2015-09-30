# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('fundraiser', '0006_auto_20150930_0051'),
    ]

    operations = [
        migrations.AlterField(
            model_name='fundraiser',
            name='slug',
            field=models.SlugField(max_length=150, null=True, blank=True),
            preserve_default=True,
        ),
    ]
