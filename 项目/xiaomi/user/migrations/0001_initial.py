# Generated by Django 2.0.6 on 2019-08-23 13:11

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Address',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('uname', models.CharField(max_length=20, null=True)),
                ('uphone', models.CharField(max_length=20)),
                ('uotherphone', models.CharField(max_length=20, null=True)),
                ('uaddress', models.CharField(max_length=50)),
                ('uotheraddress', models.CharField(max_length=50)),
                ('isdefault', models.BooleanField(default=False)),
            ],
            options={
                'db_table': 'xiaomi_address',
            },
        ),
        migrations.CreateModel(
            name='XiaomiUser',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('u_phone', models.CharField(max_length=20, unique=True, verbose_name='用户账号')),
                ('u_name', models.CharField(default=models.CharField(max_length=20, unique=True, verbose_name='用户账号'), max_length=20, verbose_name='用户昵称')),
                ('u_password', models.CharField(max_length=256)),
                ('u_email', models.EmailField(max_length=50, null=True)),
                ('u_pic', models.CharField(max_length=256, null=True)),
            ],
            options={
                'verbose_name': '用户模型',
                'verbose_name_plural': '用户模型',
                'db_table': 'xiaomi_user',
            },
        ),
        migrations.AddField(
            model_name='address',
            name='xiaomiuser',
            field=models.ManyToManyField(related_name='youraddress', to='user.XiaomiUser'),
        ),
    ]
