# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('organization', '0008_organization_child_organizations'),
    ]

    operations = [
        migrations.AddField(
            model_name='organization',
            name='sibling_organizations',
            field=models.ManyToManyField(related_name='sibling', null=True, to='organization.Organization', blank=True),
            preserve_default=True,
        ),
        migrations.AlterField(
            model_name='organization',
            name='child_organizations',
            field=models.ManyToManyField(related_name='children', null=True, to='organization.Organization', blank=True),
            preserve_default=True,
        ),
    ]
