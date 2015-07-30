# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='category',
            name='gender',
        ),
        migrations.AddField(
            model_name='category',
            name='product_type',
            field=models.CharField(max_length=40, blank=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='category',
            name='title',
            field=models.CharField(max_length=40, null=True, blank=True),
            preserve_default=True,
        ),
    ]
