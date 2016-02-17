# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('contact', '0005_contact_organization'),
    ]

    operations = [
        migrations.AddField(
            model_name='contact',
            name='created',
            field=models.DateField(auto_now_add=True, null=True),
            preserve_default=True,
        ),
    ]
