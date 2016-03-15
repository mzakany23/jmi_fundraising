# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('organization', '0005_remove_organization_account'),
    ]

    operations = [
        migrations.AlterField(
            model_name='organization',
            name='number_of_employees',
            field=models.CharField(max_length=50, null=True, blank=True),
            preserve_default=True,
        ),
    ]
