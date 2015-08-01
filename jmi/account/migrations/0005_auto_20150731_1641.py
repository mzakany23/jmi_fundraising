# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('account', '0004_profile_slug'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='profile',
            name='contact',
        ),
        migrations.AddField(
            model_name='profile',
            name='description',
            field=models.TextField(max_length=200, null=True, blank=True),
            preserve_default=True,
        ),
    ]
