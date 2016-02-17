# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('account', '0006_profile_business'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='profile',
            name='contact',
        ),
    ]
