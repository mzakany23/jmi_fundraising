# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('fundraiser', '0003_fundraisertype'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='fundraiser',
            name='cases',
        ),
    ]
