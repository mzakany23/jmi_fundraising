# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('organization', '0011_remove_organization_industry'),
    ]

    operations = [
        migrations.AddField(
            model_name='organization',
            name='is_parent_organization',
            field=models.BooleanField(default=False),
            preserve_default=True,
        ),
    ]
