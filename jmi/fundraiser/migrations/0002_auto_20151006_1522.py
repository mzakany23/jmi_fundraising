# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('fundraiser', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='fundraisercategory',
            name='options',
            field=models.ManyToManyField(to='fundraiser.FundraiserType', null=True, blank=True),
            preserve_default=True,
        ),
    ]
