# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('organization', '0006_auto_20160304_2014'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='organization',
            name='child_organizations',
        ),
        migrations.RemoveField(
            model_name='organization',
            name='is_parent_organization',
        ),
        migrations.RemoveField(
            model_name='organization',
            name='parent_organization',
        ),
        migrations.RemoveField(
            model_name='organization',
            name='sibling_organizations',
        ),
    ]
