# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('fundraiser', '0021_fundraiser_finalized'),
    ]

    operations = [
        migrations.AddField(
            model_name='fundraiser',
            name='receipt_email_sent',
            field=models.BooleanField(default=False),
            preserve_default=True,
        ),
    ]
