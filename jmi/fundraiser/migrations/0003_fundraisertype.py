# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0005_auto_20150726_1404'),
        ('fundraiser', '0002_fundraisercategory'),
    ]

    operations = [
        migrations.CreateModel(
            name='FundraiserType',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(max_length=40)),
                ('selections', models.ManyToManyField(to='product.Product')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]
