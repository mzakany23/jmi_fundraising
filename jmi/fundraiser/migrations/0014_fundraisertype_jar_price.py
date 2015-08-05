# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('fundraiser', '0013_fundraisertype_slug'),
    ]

    operations = [
        migrations.AddField(
            model_name='fundraisertype',
            name='jar_price',
            field=models.DecimalField(default=3.0, max_digits=10, decimal_places=2),
            preserve_default=True,
        ),
    ]
