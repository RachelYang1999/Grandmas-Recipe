<<<<<<< HEAD
# Generated by Django 3.1.2 on 2020-11-10 22:13
=======
# Generated by Django 3.1.2 on 2020-11-10 21:12
>>>>>>> db943f7d1fb60a96db68ee67dfa67d8f0d5d1461

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('category', models.CharField(max_length=200)),
                ('total_recipe', models.IntegerField(default=0)),
            ],
            options={
                'db_table': 'category',
            },
        ),
    ]
