# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0001_initial'),
        ('address', '0001_initial'),
        ('comment', '0001_initial'),
        ('fundraiser', '0001_initial'),
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
                ('comment', models.ForeignKey(blank=True, to='comment.FundraiserOrderComment', null=True)),
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
