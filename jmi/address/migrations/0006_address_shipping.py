# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('address', '0005_auto_20150805_1522'),
    ]

    operations = [
        migrations.AddField(
            model_name='address',
            name='shipping',
            field=models.BooleanField(default=False),
            preserve_default=True,
        ),
    ]
