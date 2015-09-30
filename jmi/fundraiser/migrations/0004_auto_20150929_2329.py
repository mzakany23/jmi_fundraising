# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('fundraiser', '0003_auto_20150929_2328'),
    ]

    operations = [
        migrations.AlterField(
            model_name='fundraiser',
            name='title',
            field=models.TextField(max_length=100, null=True, blank=True),
            preserve_default=True,
        ),
    ]
