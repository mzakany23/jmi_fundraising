# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('fundraiser', '0020_remove_fundraiser_payment'),
        ('payment', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='payment',
            name='fundraiser',
            field=models.ForeignKey(blank=True, to='fundraiser.Fundraiser', null=True),
            preserve_default=True,
        ),
    ]
