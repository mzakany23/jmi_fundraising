# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import stdimage.models


class Migration(migrations.Migration):

    dependencies = [
        ('account', '0009_profile_account'),
    ]

    operations = [
        migrations.AlterField(
            model_name='profile',
            name='org_photo',
            field=stdimage.models.StdImageField(null=True, upload_to=b'organization_photos', blank=True),
            preserve_default=True,
        ),
    ]
