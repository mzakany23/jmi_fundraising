# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('organization', '0010_organization_parent_organization'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='organization',
            name='industry',
        ),
    ]
