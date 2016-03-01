# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('account', '0007_remove_profile_contact'),
    ]

    operations = [
        migrations.AddField(
            model_name='profile',
            name='main_contact',
            field=models.BooleanField(default=False),
            preserve_default=True,
        ),
    ]
