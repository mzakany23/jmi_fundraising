# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('organization', '0006_remove_organization_contact'),
        ('contact', '0004_contact_info'),
    ]

    operations = [
        migrations.AddField(
            model_name='contact',
            name='organization',
            field=models.ForeignKey(blank=True, to='organization.Organization', null=True),
            preserve_default=True,
        ),
    ]
