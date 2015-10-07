# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0009_product_featured'),
    ]

    operations = [
        migrations.AddField(
            model_name='product',
            name='best_seller',
            field=models.BooleanField(default=False),
            preserve_default=True,
        ),
    ]
