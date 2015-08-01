# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('fundraiser', '0009_auto_20150731_1641'),
    ]

    operations = [
        migrations.AddField(
            model_name='fundraiser',
            name='status',
            field=models.CharField(blank=True, max_length=40, null=True, choices=[(b'in-process', b'in-process'), (b'done-unpaid', b'done-unpaid'), (b'done-paid', b'done-paid')]),
            preserve_default=True,
        ),
    ]
