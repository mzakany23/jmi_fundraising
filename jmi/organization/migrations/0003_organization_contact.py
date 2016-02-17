# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('contact', '0003_auto_20160209_2146'),
        ('organization', '0002_organization_number_of_employees'),
    ]

    operations = [
        migrations.AddField(
            model_name='organization',
            name='contact',
            field=models.ForeignKey(blank=True, to='contact.Contact', null=True),
            preserve_default=True,
        ),
    ]
