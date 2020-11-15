# Generated by Django 3.1.2 on 2020-11-15 23:00

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('recipe', '0001_initial'),
        ('user', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Comment',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('comment_content', models.CharField(max_length=500)),
                ('comment_publish_date', models.DateTimeField(auto_now_add=True)),
                ('comment_recipe', models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, related_name='referenceRecipe', to='recipe.recipe')),
                ('comment_user', models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, related_name='referenceUser', to='user.user')),
            ],
            options={
                'db_table': 'comment',
            },
        ),
    ]
