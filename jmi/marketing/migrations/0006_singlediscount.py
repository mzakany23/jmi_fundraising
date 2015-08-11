# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('fundraiser', '0015_fundraiser_slug'),
        ('marketing', '0005_auto_20150811_0157'),
    ]

    operations = [
        migrations.CreateModel(
            name='SingleDiscount',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(max_length=40)),
                ('special_code', models.CharField(max_length=40, null=True, blank=True)),
                ('active', models.BooleanField(default=False)),
                ('expires_after', models.IntegerField(default=10)),
                ('used', models.IntegerField(default=0)),
                ('percent', models.DecimalField(default=0.0, max_digits=10, decimal_places=2)),
                ('dollars', models.DecimalField(default=0.0, max_digits=10, decimal_places=2)),
                ('fundraiser', models.OneToOneField(null=True, blank=True, to='fundraiser.Fundraiser')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]
