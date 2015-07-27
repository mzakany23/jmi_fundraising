# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(max_length=40)),
                ('gender', models.CharField(blank=True, max_length=40, null=True, choices=[(b'Male', b'Male'), (b'Female', b'Female'), (b'Unisex', b'Unisex')])),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('product_code', models.CharField(max_length=100, null=True, blank=True)),
                ('slug', models.SlugField(null=True, blank=True)),
                ('title', models.CharField(max_length=40)),
                ('description', models.TextField(max_length=1000, null=True, blank=True)),
                ('price', models.DecimalField(default=0.0, max_digits=10, decimal_places=2)),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('updated', models.DateTimeField(auto_now=True)),
                ('category', models.ManyToManyField(to='product.Category', null=True, blank=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='ProductImage',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('default', models.BooleanField(default=False)),
                ('image', models.ImageField(upload_to=b'product_images')),
                ('zoom_image', models.BooleanField(default=False)),
                ('product', models.ForeignKey(blank=True, to='product.Product', null=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]
