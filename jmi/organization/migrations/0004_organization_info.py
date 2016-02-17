# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('organization', '0003_organization_contact'),
    ]

    operations = [
        migrations.AddField(
            model_name='organization',
            name='info',
            field=models.TextField(max_length=500, null=True, blank=True),
            preserve_default=True,
        ),
    ]
