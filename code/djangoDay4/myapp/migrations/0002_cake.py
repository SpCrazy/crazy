# Generated by Django 2.0.6 on 2019-06-20 08:14

from django.db import migrations, models
import django.db.models.manager


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Cake',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=20)),
                ('price', models.FloatField()),
            ],
            options={
                'db_table': 'cakes',
            },
            managers=[
                ('cmanager', django.db.models.manager.Manager()),
            ],
        ),
    ]