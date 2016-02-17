# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('organization', '0005_auto_20160209_2149'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='organization',
            name='contact',
        ),
    ]
