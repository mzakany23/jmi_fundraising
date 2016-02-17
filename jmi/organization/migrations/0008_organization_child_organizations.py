# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('organization', '0007_organization_created'),
    ]

    operations = [
        migrations.AddField(
            model_name='organization',
            name='child_organizations',
            field=models.ManyToManyField(to='organization.Organization', null=True, blank=True),
            preserve_default=True,
        ),
    ]
