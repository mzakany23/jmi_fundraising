# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings
import stdimage.models


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('address', '0001_initial'),
        ('organization', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='PasswordReset',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('key', models.CharField(max_length=40, null=True, blank=True)),
                ('expired', models.BooleanField(default=False)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('user', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Profile',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('organization', models.CharField(max_length=100, null=True, blank=True)),
                ('first_name', models.CharField(max_length=20, null=True)),
                ('last_name', models.CharField(max_length=20, null=True)),
                ('phone_number', models.CharField(max_length=40, null=True)),
                ('email', models.EmailField(max_length=40, null=True)),
                ('slug', models.SlugField(null=True, blank=True)),
                ('org_photo', stdimage.models.StdImageField(null=True, upload_to=b'organization_photos', blank=True)),
                ('stripe_id', models.CharField(max_length=100, null=True, blank=True)),
                ('account', models.ForeignKey(blank=True, to=settings.AUTH_USER_MODEL, null=True)),
                ('address', models.ForeignKey(blank=True, to='address.Address', null=True)),
                ('business', models.ForeignKey(blank=True, to='organization.Organization', null=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]
