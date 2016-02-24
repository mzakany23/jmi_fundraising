# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('fundraiser', '0016_fundraiserform_type'),
    ]

    operations = [
        migrations.AlterField(
            model_name='fundraiserform',
            name='url',
            field=models.FilePathField(max_length=125, path=b'/Users/mzakany/Desktop/jmi_fundraising/docs', null=True, blank=True),
            preserve_default=True,
        ),
    ]
