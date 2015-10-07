# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('fundraiser', '0008_remove_fundraisercategory_type'),
    ]

    operations = [
        migrations.AddField(
            model_name='fundraisercategory',
            name='type',
            field=models.ForeignKey(blank=True, to='fundraiser.FundraiserTypeTitle', null=True),
            preserve_default=True,
        ),
    ]
