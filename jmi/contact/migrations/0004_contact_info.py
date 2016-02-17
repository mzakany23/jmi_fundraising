# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('contact', '0003_auto_20160209_2146'),
    ]

    operations = [
        migrations.AddField(
            model_name='contact',
            name='info',
            field=models.TextField(max_length=500, null=True, blank=True),
            preserve_default=True,
        ),
    ]
