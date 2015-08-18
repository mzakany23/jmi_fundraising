# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('account', '0007_remove_profile_description'),
        ('fundraiser', '0019_auto_20150818_1612'),
    ]

    operations = [
        migrations.CreateModel(
            name='Comment',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('approved', models.BooleanField(default=False)),
                ('title', models.CharField(max_length=40)),
                ('comment', models.TextField(max_length=140, null=True, blank=True)),
                ('account', models.ForeignKey(default=False, to='account.Profile', null=True)),
                ('fundraiser', models.ForeignKey(to='fundraiser.Fundraiser')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]
