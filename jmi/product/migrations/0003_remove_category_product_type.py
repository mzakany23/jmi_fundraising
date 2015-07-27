# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0002_auto_20150726_0322'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='category',
            name='product_type',
        ),
    ]
