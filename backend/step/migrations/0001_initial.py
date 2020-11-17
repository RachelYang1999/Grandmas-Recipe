# Generated by Django 3.1.2 on 2020-11-18 05:46

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('recipe', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Step',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('step_description', models.CharField(max_length=1000)),
                ('related_recipe', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='related_recipe', to='recipe.recipe')),
            ],
            options={
                'db_table': 'step',
            },
        ),
    ]
