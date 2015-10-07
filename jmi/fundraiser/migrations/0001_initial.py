# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('account', '0001_initial'),
        ('product', '0010_product_best_seller'),
    ]

    operations = [
        migrations.CreateModel(
            name='Fundraiser',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.TextField(max_length=100, null=True, blank=True)),
                ('description', models.TextField(max_length=500, null=True, blank=True)),
                ('status', models.CharField(blank=True, max_length=40, null=True, choices=[(b'paid', b'paid'), (b'unpaid', b'unpaid')])),
                ('finalized', models.BooleanField(default=False)),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('updated', models.DateTimeField(auto_now=True)),
                ('discount', models.DecimalField(default=0.0, max_digits=10, decimal_places=2)),
                ('slug', models.SlugField(max_length=400, null=True, blank=True)),
                ('receipt_email_sent', models.BooleanField(default=False)),
                ('account', models.ForeignKey(blank=True, to=settings.AUTH_USER_MODEL, null=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='FundraiserCategory',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=40, null=True, blank=True)),
                ('title', models.TextField(max_length=100, null=True, blank=True)),
                ('description', models.TextField(max_length=500, null=True, blank=True)),
                ('image', models.ImageField(null=True, upload_to=b'fundraiser_types', blank=True)),
                ('show_top_sellers', models.BooleanField(default=False)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='FundraiserCategoryType',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=40, null=True, blank=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='FundraiserType',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('jar_price', models.DecimalField(default=3.0, max_digits=10, decimal_places=2)),
                ('slug', models.SlugField(null=True, blank=True)),
                ('image', models.ImageField(null=True, upload_to=b'fundraiser_types', blank=True)),
                ('title', models.CharField(max_length=40)),
                ('forms', models.FilePathField(path=b'/Users/mzakany/Desktop/jmi_fundraising/docs', null=True, blank=True)),
                ('selections', models.ManyToManyField(to='product.Product', null=True, blank=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.AddField(
            model_name='fundraisercategory',
            name='options',
            field=models.ManyToManyField(to='fundraiser.FundraiserType'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='fundraisercategory',
            name='type',
            field=models.ForeignKey(blank=True, to='fundraiser.FundraiserCategoryType', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='fundraiser',
            name='plan',
            field=models.ForeignKey(blank=True, to='fundraiser.FundraiserCategory', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='fundraiser',
            name='profile',
            field=models.ForeignKey(blank=True, to='account.Profile', null=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='fundraiser',
            name='type',
            field=models.ForeignKey(blank=True, to='fundraiser.FundraiserType', null=True),
            preserve_default=True,
        ),
    ]
