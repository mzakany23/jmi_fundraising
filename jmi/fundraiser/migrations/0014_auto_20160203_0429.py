# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('fundraiser', '0013_remove_fundraisercategory_forms'),
    ]

    operations = [
        migrations.AlterField(
            model_name='fundraiser',
            name='status',
            field=models.CharField(blank=True, max_length=40, null=True, choices=[(b'paid', b'paid'), (b'unpaid', b'unpaid'), (b'in-process', b'in-process')]),
            preserve_default=True,
        ),
    ]
