# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('shipment', '0003_auto_20150727_0149'),
    ]

    operations = [
        migrations.AlterField(
            model_name='selection',
            name='product',
            field=models.ForeignKey(to='product.Product'),
            preserve_default=True,
        ),
    ]
