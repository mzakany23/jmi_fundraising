# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('fundraiser', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Address',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(max_length=40, blank=True)),
                ('street', models.CharField(max_length=40, blank=True)),
                ('line_2', models.CharField(max_length=40, blank=True)),
                ('state', models.CharField(max_length=40, blank=True)),
                ('contact', models.CharField(max_length=40, blank=True)),
                ('phone', models.CharField(max_length=40, blank=True)),
                ('postcode', models.CharField(max_length=40, blank=True)),
                ('country', models.CharField(blank=True, max_length=40, choices=[(b'USA', b'USA')])),
                ('fundraiser', models.ForeignKey(to='fundraiser.Fundraiser')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]
