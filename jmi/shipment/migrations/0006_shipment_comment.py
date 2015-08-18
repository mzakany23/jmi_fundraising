# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('comment', '0001_initial'),
        ('shipment', '0005_auto_20150727_0331'),
    ]

    operations = [
        migrations.AddField(
            model_name='shipment',
            name='comment',
            field=models.ForeignKey(blank=True, to='comment.Comment', null=True),
            preserve_default=True,
        ),
    ]
