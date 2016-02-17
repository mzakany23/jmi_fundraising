# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('organization', '0004_organization_info'),
    ]

    operations = [
        migrations.AlterField(
            model_name='organization',
            name='number_of_employees',
            field=models.IntegerField(default=0, null=True, blank=True),
            preserve_default=True,
        ),
    ]
