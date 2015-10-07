# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('fundraiser', '0004_fundraisercategory_popular'),
    ]

    operations = [
        migrations.DeleteModel(
            name='FundraiserCategoryType',
        ),
        migrations.AlterField(
            model_name='fundraisercategory',
            name='type',
            field=models.CharField(blank=True, max_length=40, null=True, choices=[(b'Pre-Sell', b'Pre-sell individual jars'), (b'Buy-Sell', b'Buy then sell'), (b'Pre-Sell mix and match cases', b'Pre-sell salsa by the case')]),
            preserve_default=True,
        ),
    ]
