# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('organization', '0012_organization_is_parent_organization'),
    ]

    operations = [
        migrations.CreateModel(
            name='SampleTracker',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('date_sent', models.DateField(auto_now_add=True)),
                ('received_forms_back', models.BooleanField(default=False)),
                ('organization', models.ForeignKey(to='organization.Organization')),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]
