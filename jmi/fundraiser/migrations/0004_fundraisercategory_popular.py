# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('fundraiser', '0003_auto_20151006_1529'),
    ]

    operations = [
        migrations.AddField(
            model_name='fundraisercategory',
            name='popular',
            field=models.BooleanField(default=False),
            preserve_default=True,
        ),
    ]
