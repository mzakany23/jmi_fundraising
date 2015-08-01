# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('fundraiser', '0011_fundraiser_title'),
    ]

    operations = [
        migrations.AddField(
            model_name='fundraiser',
            name='description',
            field=models.TextField(max_length=200, null=True, blank=True),
            preserve_default=True,
        ),
    ]
