# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('fundraiser', '0004_remove_fundraiser_cases'),
    ]

    operations = [
        migrations.AddField(
            model_name='fundraisertype',
            name='image',
            field=models.ImageField(null=True, upload_to=b'fundraiser_types', blank=True),
            preserve_default=True,
        ),
    ]
