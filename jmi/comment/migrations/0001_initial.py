# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('fundraiser', '0021_fundraiser_finalized'),
        ('account', '0010_auto_20150825_1533'),
    ]

    operations = [
        migrations.CreateModel(
            name='FundraiserOrderComment',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('comment', models.TextField(max_length=140, null=True, blank=True)),
                ('fundraiser', models.ForeignKey(to='fundraiser.Fundraiser')),
            ],
            options={
                'abstract': False,
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='UserComment',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('comment', models.TextField(max_length=140, null=True, blank=True)),
                ('approved', models.BooleanField(default=False)),
                ('account', models.ForeignKey(default=False, to='account.Profile', null=True)),
                ('fundraiser', models.ForeignKey(to='fundraiser.Fundraiser')),
            ],
            options={
                'abstract': False,
            },
            bases=(models.Model,),
        ),
    ]
