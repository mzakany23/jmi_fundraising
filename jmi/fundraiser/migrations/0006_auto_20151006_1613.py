# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('fundraiser', '0005_auto_20151006_1551'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='fundraisertype',
            name='forms',
        ),
        migrations.AddField(
            model_name='fundraisercategory',
            name='forms',
            field=models.FilePathField(path=b'/Users/mzakany/Desktop/jmi_fundraising/docs', null=True, blank=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='fundraisercategory',
            name='options',
            field=models.ManyToManyField(to='fundraiser.FundraiserType', null=True, blank=True),
            preserve_default=True,
        ),
    ]
