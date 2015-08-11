# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('marketing', '0003_discount_fundraiser'),
    ]

    operations = [
        migrations.AddField(
            model_name='discount',
            name='expires',
            field=models.BooleanField(default=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='discount',
            name='expires_after',
            field=models.IntegerField(default=10),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='discount',
            name='used',
            field=models.IntegerField(default=0),
            preserve_default=True,
        ),
    ]
