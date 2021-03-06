# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('fundraiser', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Payment',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('type', models.CharField(blank=True, max_length=40, null=True, choices=[(b'check', b'check'), (b'credit', b'credit')])),
                ('stripe_id', models.CharField(max_length=40, null=True, blank=True)),
                ('last_4', models.CharField(max_length=4, null=True, blank=True)),
                ('card_type', models.CharField(max_length=10, null=True, blank=True)),
                ('fundraiser', models.ForeignKey(blank=True, to='fundraiser.Fundraiser', null=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]
