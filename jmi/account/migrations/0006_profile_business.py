# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('organization', '0002_organization_number_of_employees'),
        ('account', '0005_profile_contact'),
    ]

    operations = [
        migrations.AddField(
            model_name='profile',
            name='business',
            field=models.ForeignKey(blank=True, to='organization.Organization', null=True),
            preserve_default=True,
        ),
    ]
