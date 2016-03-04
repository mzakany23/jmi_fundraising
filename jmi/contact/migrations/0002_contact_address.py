# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('address', '0002_auto_20160302_1653'),
        ('contact', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='contact',
            name='address',
            field=models.ForeignKey(blank=True, to='address.Address', null=True),
            preserve_default=True,
        ),
    ]
