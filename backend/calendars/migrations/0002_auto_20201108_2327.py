# Generated by Django 3.1.2 on 2020-11-08 23:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('calendars', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='calendar',
            name='date',
            field=models.DateField(),
        ),
    ]
