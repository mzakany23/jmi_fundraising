# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('fundraiser', '0005_fundraisertype_image'),
    ]

    operations = [
        migrations.AddField(
            model_name='fundraiser',
            name='type',
            field=models.ForeignKey(blank=True, to='fundraiser.FundraiserType', null=True),
            preserve_default=True,
        ),
    ]
