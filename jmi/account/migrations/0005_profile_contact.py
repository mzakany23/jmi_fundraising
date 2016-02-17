# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('contact', '0002_auto_20160209_2135'),
        ('account', '0004_auto_20160203_0429'),
    ]

    operations = [
        migrations.AddField(
            model_name='profile',
            name='contact',
            field=models.ForeignKey(blank=True, to='contact.Contact', null=True),
            preserve_default=True,
        ),
    ]
