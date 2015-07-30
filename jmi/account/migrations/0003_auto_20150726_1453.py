# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('account', '0002_profile_stripe_id'),
    ]

    operations = [
        migrations.AlterField(
            model_name='profile',
            name='address',
            field=models.ForeignKey(blank=True, to='address.Address', null=True),
            preserve_default=True,
        ),
    ]
