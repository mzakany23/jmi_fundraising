# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('organization', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Contact',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('first_name', models.CharField(max_length=40, null=True, blank=True)),
                ('last_name', models.CharField(max_length=40, null=True, blank=True)),
                ('age', models.CharField(max_length=3, null=True, blank=True)),
                ('job_title', models.CharField(max_length=40, null=True, blank=True)),
                ('phone1', models.CharField(max_length=40, null=True, blank=True)),
                ('phone2', models.CharField(max_length=40, null=True, blank=True)),
                ('phone3', models.CharField(max_length=40, null=True, blank=True)),
                ('email1', models.EmailField(max_length=100, null=True, blank=True)),
                ('email2', models.EmailField(max_length=100, null=True, blank=True)),
                ('email3', models.EmailField(max_length=100, null=True, blank=True)),
                ('info', models.TextField(max_length=500, null=True, blank=True)),
                ('created', models.DateField(auto_now_add=True, null=True)),
                ('organization', models.ForeignKey(blank=True, to='organization.Organization', null=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='ContactType',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(max_length=40, null=True, blank=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.AddField(
            model_name='contact',
            name='type',
            field=models.ForeignKey(blank=True, to='contact.ContactType', null=True),
            preserve_default=True,
        ),
    ]
