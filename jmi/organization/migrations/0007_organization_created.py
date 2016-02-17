# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('organization', '0006_remove_organization_contact'),
    ]

    operations = [
        migrations.AddField(
            model_name='organization',
            name='created',
            field=models.DateTimeField(auto_now_add=True, null=True),
            preserve_default=True,
        ),
    ]
