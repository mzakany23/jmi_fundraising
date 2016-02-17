# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('organization', '0009_auto_20160210_2051'),
    ]

    operations = [
        migrations.AddField(
            model_name='organization',
            name='parent_organization',
            field=models.ForeignKey(related_name='parent', blank=True, to='organization.Organization', null=True),
            preserve_default=True,
        ),
    ]
