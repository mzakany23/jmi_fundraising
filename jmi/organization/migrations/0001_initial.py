# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Industry',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=40, null=True, blank=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Organization',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=40, null=True, blank=True)),
                ('number_of_employees', models.IntegerField(default=0, null=True, blank=True)),
                ('info', models.TextField(max_length=500, null=True, blank=True)),
                ('created', models.DateTimeField(auto_now_add=True, null=True)),
                ('is_parent_organization', models.BooleanField(default=False)),
                ('child_organizations', models.ManyToManyField(related_name='children', null=True, to='organization.Organization', blank=True)),
                ('parent_organization', models.ForeignKey(related_name='parent', blank=True, to='organization.Organization', null=True)),
                ('sibling_organizations', models.ManyToManyField(related_name='sibling', null=True, to='organization.Organization', blank=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='OrganizationType',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=40, null=True, blank=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.AddField(
            model_name='organization',
            name='type',
            field=models.ForeignKey(blank=True, to='organization.OrganizationType', null=True),
            preserve_default=True,
        ),
    ]
