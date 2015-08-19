# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('address', '0007_auto_20150818_1612'),
    ]

    operations = [
        migrations.AlterField(
            model_name='address',
            name='state',
            field=models.CharField(blank=True, max_length=40, null=True, choices=[(b'AK', b'AK'), (b'AL', b'AL'), (b'AR', b'AR'), (b'AZ', b'AZ'), (b'CA', b'CA'), (b'CO', b'CO'), (b'CT', b'CT'), (b'DE', b'DE'), (b'FL', b'FL'), (b'GA', b'GA'), (b'HI', b'HI'), (b'IA', b'IA'), (b'ID', b'ID'), (b'IL', b'IL'), (b'IN', b'IN'), (b'KS', b'KS'), (b'KY', b'KY'), (b'LA', b'LA'), (b'MA', b'MA'), (b'MD', b'MD'), (b'ME', b'ME'), (b'MI', b'MI'), (b'MN', b'MN'), (b'MO', b'MO'), (b'MS', b'MS'), (b'MT', b'MT'), (b'NC', b'NC'), (b'ND', b'ND'), (b'NE', b'NE'), (b'NH', b'NH'), (b'NJ', b'NJ'), (b'NM', b'NM'), (b'NV', b'NV'), (b'NY', b'NY'), (b'OH', b'OH'), (b'OK', b'OK'), (b'OR', b'OR'), (b'PA', b'PA'), (b'RI', b'RI'), (b'SC', b'SC'), (b'SD', b'SD'), (b'TN', b'TN'), (b'TX', b'TX'), (b'UT', b'UT'), (b'VA', b'VA'), (b'VT', b'VT'), (b'WA', b'WA'), (b'WI', b'WI'), (b'WV', b'WV'), (b'WY', b'WY')]),
            preserve_default=True,
        ),
    ]
