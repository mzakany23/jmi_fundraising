# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('fundraiser', '0009_fundraisercategory_type'),
    ]

    operations = [
        migrations.AddField(
            model_name='fundraisertype',
            name='forms',
            field=models.FilePathField(path=b'/Users/mzakany/Desktop/jmi_fundraising/docs', null=True, blank=True),
            preserve_default=True,
        ),
    ]
