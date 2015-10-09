# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('fundraiser', '0010_fundraisertype_forms'),
    ]

    operations = [
        migrations.AddField(
            model_name='fundraisertype',
            name='ordering',
            field=models.IntegerField(default=0, null=True, blank=True),
            preserve_default=True,
        ),
    ]
