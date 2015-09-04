# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0008_category_slug'),
        ('fundraiser', '0021_fundraiser_finalized'),
        ('address', '0009_auto_20150820_1556'),
    ]

    operations = [
        migrations.CreateModel(
            name='Selection',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('quantity', models.IntegerField(default=0)),
                ('product', models.ForeignKey(to='product.Product')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Shipment',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('updated', models.DateTimeField(auto_now=True)),
                ('address', models.ForeignKey(blank=True, to='address.Address', null=True)),
                ('fundraiser', models.ForeignKey(to='fundraiser.Fundraiser')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.AddField(
            model_name='selection',
            name='shipment',
            field=models.ForeignKey(to='shipment.Shipment'),
            preserve_default=True,
        ),
    ]
