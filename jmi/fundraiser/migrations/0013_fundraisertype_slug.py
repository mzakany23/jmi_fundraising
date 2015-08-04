# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('fundraiser', '0012_fundraiser_description'),
    ]

    operations = [
        migrations.AddField(
            model_name='fundraisertype',
            name='slug',
            field=models.SlugField(null=True, blank=True),
            preserve_default=True,
        ),
    ]
