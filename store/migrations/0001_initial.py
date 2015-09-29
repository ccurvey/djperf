# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Customer',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=100)),
                ('birthdate', models.DateField(null=True, blank=True)),
            ],
        ),
        migrations.CreateModel(
            name='LineItem',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('quantity', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=100)),
                ('price', models.DecimalField(max_digits=10, decimal_places=2)),
            ],
        ),
        migrations.CreateModel(
            name='Sale',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('total', models.DecimalField(max_digits=10, decimal_places=2)),
                ('customer', models.ForeignKey(to='store.Customer')),
            ],
        ),
        migrations.AddField(
            model_name='lineitem',
            name='product',
            field=models.ForeignKey(to='store.Product'),
        ),
        migrations.AddField(
            model_name='lineitem',
            name='sale',
            field=models.ForeignKey(to='store.Sale'),
        ),
    ]
