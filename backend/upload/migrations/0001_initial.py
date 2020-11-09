# Generated by Django 3.1.2 on 2020-11-10 06:55

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('comments', '0001_initial'),
        ('recipe', '0001_initial'),
        ('user', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Upload_recipe',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('step_id', models.IntegerField(default=1)),
                ('recipe_image', models.ImageField(blank=True, null=True, upload_to='recipe_image')),
                ('recipe', models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, related_name='recipeimage', to='recipe.recipe')),
            ],
            options={
                'db_table': 'recipe_metadata',
            },
        ),
        migrations.CreateModel(
            name='Upload_profile',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('profile_image', models.ImageField(blank=True, default='default.png', null=True, upload_to='avatar')),
                ('user', models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, related_name='userprofileimage', to='user.user')),
            ],
            options={
                'db_table': 'user_profile_metadata',
            },
        ),
        migrations.CreateModel(
            name='Upload_comment_meta',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('comment_image', models.ImageField(blank=True, null=True, upload_to='comment_image')),
                ('comment', models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, related_name='referenceComment', to='comments.comment')),
            ],
            options={
                'db_table': 'comment_meta',
            },
        ),
    ]
