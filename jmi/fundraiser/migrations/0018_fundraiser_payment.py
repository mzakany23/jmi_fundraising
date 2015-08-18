# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('payment', '0001_initial'),
        ('fundraiser', '0017_auto_20150818_1550'),
    ]

    operations = [
        migrations.AddField(
            model_name='fundraiser',
            name='payment',
            field=models.ForeignKey(blank=True, to='payment.Payment', null=True),
            preserve_default=True,
        ),
    ]
