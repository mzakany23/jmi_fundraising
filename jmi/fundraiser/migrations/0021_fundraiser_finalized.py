# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('fundraiser', '0020_remove_fundraiser_payment'),
    ]

    operations = [
        migrations.AddField(
            model_name='fundraiser',
            name='finalized',
            field=models.BooleanField(default=False),
            preserve_default=True,
        ),
    ]
