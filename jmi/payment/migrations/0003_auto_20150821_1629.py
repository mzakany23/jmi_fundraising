# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('payment', '0002_payment_fundraiser'),
    ]

    operations = [
        migrations.AlterField(
            model_name='payment',
            name='type',
            field=models.CharField(blank=True, max_length=40, null=True, choices=[(b'check', b'check'), (b'credit', b'credit')]),
            preserve_default=True,
        ),
    ]
