# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('address', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Contact',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('first_name', models.CharField(max_length=40, null=True, blank=True)),
                ('last_name', models.CharField(max_length=40, null=True, blank=True)),
                ('phone1', models.CharField(max_length=40, null=True, blank=True)),
                ('phone2', models.CharField(max_length=40, null=True, blank=True)),
                ('phone3', models.CharField(max_length=40, null=True, blank=True)),
                ('email1', models.EmailField(max_length=100, null=True, blank=True)),
                ('email2', models.EmailField(max_length=100, null=True, blank=True)),
                ('email3', models.EmailField(max_length=100, null=True, blank=True)),
                ('address', models.ForeignKey(blank=True, to='address.Address', null=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]
