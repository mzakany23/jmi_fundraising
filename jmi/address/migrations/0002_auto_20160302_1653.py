# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('organization', '0003_auto_20160302_1653'),
        ('address', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='address',
            name='contact',
        ),
        migrations.AddField(
            model_name='address',
            name='organization',
            field=models.ForeignKey(blank=True, to='organization.Organization', null=True),
            preserve_default=True,
        ),
    ]
