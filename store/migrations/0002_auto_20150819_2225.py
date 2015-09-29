# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('store', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='sale',
            name='total',
        ),
        migrations.AddField(
            model_name='sale',
            name='order_date',
            field=models.DateField(default=datetime.date(2015, 8, 19)),
            preserve_default=False,
        ),
    ]
