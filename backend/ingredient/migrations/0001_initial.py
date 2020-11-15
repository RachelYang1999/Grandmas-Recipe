# Generated by Django 3.1.2 on 2020-11-16 04:09

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('recipe', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Ingredient',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('ingredient_name', models.CharField(max_length=100)),
                ('ingredient_related_recipe', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='ingredient_related_recipe', to='recipe.recipe')),
            ],
            options={
                'db_table': 'ingredient',
            },
        ),
    ]
