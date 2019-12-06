# Generated by Django 2.0.6 on 2019-08-23 13:01

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('goods', '0001_initial'),
        ('user', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Order',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('o_no', models.CharField(max_length=20, null=True)),
                ('o_price', models.FloatField()),
                ('o_state', models.IntegerField(default=1)),
                ('o_qita', models.CharField(max_length=50)),
                ('o_qita2', models.CharField(max_length=50)),
                ('o_user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='user.HuaweiUser')),
            ],
            options={
                'db_table': 'Huawei_order',
            },
        ),
        migrations.CreateModel(
            name='OrderDetail',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('o_goods_num', models.IntegerField()),
                ('o_goods', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='goods.Goods')),
                ('o_order', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='orders.Order')),
            ],
            options={
                'db_table': 'Huawei_orderdetail',
            },
        ),
    ]
