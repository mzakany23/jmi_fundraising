# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('account', '0005_auto_20150731_1641'),
        ('fundraiser', '0008_auto_20150731_1606'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='fundraiser',
            name='title',
        ),
        migrations.AddField(
            model_name='fundraiser',
            name='profile',
            field=models.ForeignKey(blank=True, to='account.Profile', null=True),
            preserve_default=True,
        ),
    ]
