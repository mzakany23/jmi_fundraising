# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('notes', '0001_initial'),
        ('organization', '0002_organization_number_of_employees'),
        ('contact', '0001_initial'),
    ]

    operations = [
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
            name='age',
            field=models.CharField(max_length=3, null=True, blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='contact',
            name='job_title',
            field=models.CharField(max_length=40, null=True, blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='contact',
            name='note',
            field=models.ForeignKey(blank=True, to='notes.Note', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='contact',
            name='organizations',
            field=models.ForeignKey(blank=True, to='organization.Organization', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='contact',
            name='type',
            field=models.ForeignKey(blank=True, to='contact.ContactType', null=True),
            preserve_default=True,
        ),
    ]
