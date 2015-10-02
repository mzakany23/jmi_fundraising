# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('fundraiser', '0010_fundraisercategory_image'),
    ]

    operations = [
        migrations.AddField(
            model_name='fundraiser',
            name='plan',
            field=models.ForeignKey(blank=True, to='fundraiser.FundraiserCategory', null=True),
            preserve_default=True,
        ),
    ]
