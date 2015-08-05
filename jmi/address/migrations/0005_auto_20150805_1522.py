# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('address', '0004_auto_20150805_1459'),
    ]

    operations = [
        migrations.RenameField(
            model_name='address',
            old_name='postcode',
            new_name='city',
        ),
        migrations.AddField(
            model_name='address',
            name='zip_code',
            field=models.CharField(max_length=40, null=True, blank=True),
            preserve_default=True,
        ),
    ]
