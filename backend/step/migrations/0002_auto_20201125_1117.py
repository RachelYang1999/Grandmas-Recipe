# Generated by Django 3.1.2 on 2020-11-25 11:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('step', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='step',
            name='step_image',
            field=models.ImageField(blank=True, default='step_image/default.png', null=True, upload_to='step_image'),
        ),
    ]