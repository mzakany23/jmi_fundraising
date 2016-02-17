# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('organization', '0003_organization_contact'),
        ('address', '0002_address_business_address'),
    ]

    operations = [
        migrations.AddField(
            model_name='address',
            name='organization',
            field=models.ForeignKey(blank=True, to='organization.Organization', null=True),
            preserve_default=True,
        ),
    ]