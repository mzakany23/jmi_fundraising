# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('fundraiser', '0002_auto_20151006_1522'),
    ]

    operations = [
        migrations.AlterField(
            model_name='fundraisercategory',
            name='options',
            field=models.ManyToManyField(to='fundraiser.FundraiserType'),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='fundraisercategory',
            name='type',
            field=models.CharField(blank=True, max_length=40, null=True, choices=[(b'Pre-Sell', b'Pre-Sell'), (b'Buy-Sell', b'Buy-Sell'), (b'Pre-Sell mix and match cases', b'Pre-Sell mix and match cases')]),
            preserve_default=True,
        ),
    ]
