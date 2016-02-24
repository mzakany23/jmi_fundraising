# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('fundraiser', '0014_auto_20160203_0429'),
    ]

    operations = [
        migrations.CreateModel(
            name='FundraiserForm',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=50)),
                ('url', models.FilePathField(path=b'/Users/mzakany/Desktop/jmi_fundraising/docs', null=True, blank=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]
