# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('shipment', '0002_selection'),
    ]

    operations = [
        migrations.AlterField(
            model_name='shipment',
            name='address',
            field=models.ForeignKey(blank=True, to='address.Address', null=True),
            preserve_default=True,
        ),
    ]
