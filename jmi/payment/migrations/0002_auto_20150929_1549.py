# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('fundraiser', '0001_initial'),
        ('payment', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='payment',
            name='fundraiser',
            field=models.ForeignKey(blank=True, to='fundraiser.Fundraiser', null=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='payment',
            name='type',
            field=models.CharField(blank=True, max_length=40, null=True, choices=[(b'check', b'check'), (b'credit', b'credit')]),
            preserve_default=True,
        ),
    ]
