# Generated by Django 3.1.2 on 2020-11-19 06:43

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('upload', '0002_auto_20201119_0443'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='upload_recipe',
            name='recipe',
        ),
        migrations.RemoveField(
            model_name='upload_recipe',
            name='recipe_image',
        ),
        migrations.RemoveField(
            model_name='upload_recipe',
            name='step',
        ),
    ]
