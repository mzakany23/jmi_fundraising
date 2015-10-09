# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('fundraiser', '0011_fundraisertype_ordering'),
    ]

    operations = [
        migrations.RenameField(
            model_name='fundraisertype',
            old_name='ordering',
            new_name='order',
        ),
    ]
