# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('fundraiser', '0006_fundraiser_type'),
    ]

    operations = [
        migrations.AlterField(
            model_name='fundraisertype',
            name='selections',
            field=models.ManyToManyField(to='product.Product', null=True, blank=True),
            preserve_default=True,
        ),
    ]
