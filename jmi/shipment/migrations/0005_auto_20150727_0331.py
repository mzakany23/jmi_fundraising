# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('shipment', '0004_auto_20150727_0331'),
    ]

    operations = [
        migrations.AlterField(
            model_name='selection',
            name='shipment',
            field=models.ForeignKey(to='shipment.Shipment'),
            preserve_default=True,
        ),
    ]
