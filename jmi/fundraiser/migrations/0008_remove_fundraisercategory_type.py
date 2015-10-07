# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('fundraiser', '0007_fundraisertypetitle'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='fundraisercategory',
            name='type',
        ),
    ]
