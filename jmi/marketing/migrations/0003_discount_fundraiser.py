# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('fundraiser', '0015_fundraiser_slug'),
        ('marketing', '0002_discount_special_code'),
    ]

    operations = [
        migrations.AddField(
            model_name='discount',
            name='fundraiser',
            field=models.ForeignKey(blank=True, to='fundraiser.Fundraiser', null=True),
            preserve_default=True,
        ),
    ]
