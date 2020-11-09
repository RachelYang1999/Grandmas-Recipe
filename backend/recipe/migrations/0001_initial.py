# Generated by Django 3.1.2 on 2020-11-10 09:28

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('category', '0001_initial'),
        ('user', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Recipe',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('recipe_title', models.CharField(max_length=100)),
                ('description', models.CharField(max_length=1000)),
                ('update_date', models.DateField(auto_now_add=True)),
                ('is_published', models.IntegerField(default=0)),
                ('user', models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='user.user')),
            ],
            options={
                'db_table': 'recipe',
            },
        ),
        migrations.CreateModel(
            name='Recipe_category',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('category_of_recipe', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='category_of_recipe', to='category.category')),
                ('recipe_of_category', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='recipe_of_category', to='recipe.recipe')),
            ],
            options={
                'db_table': 'recipe_category',
            },
        ),
    ]
