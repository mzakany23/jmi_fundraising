# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('fundraiser', '0009_auto_20150930_1817'),
    ]

    operations = [
        migrations.AddField(
            model_name='fundraisercategory',
            name='image',
            field=models.ImageField(null=True, upload_to=b'fundraiser_types', blank=True),
            preserve_default=True,
        ),
    ]
