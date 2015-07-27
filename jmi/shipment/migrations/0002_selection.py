# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0005_auto_20150726_1404'),
        ('shipment', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Selection',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('quantity', models.IntegerField(default=0)),
                ('product', models.OneToOneField(to='product.Product')),
                ('shipment', models.OneToOneField(to='shipment.Shipment')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]
