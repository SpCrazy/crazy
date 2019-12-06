from django.contrib import admin

from user.models import XiaomiUser


@admin.register(XiaomiUser)
class XiaomiUserAdmin(admin.ModelAdmin):
    list_display = ("id","u_phone","u_name")
    list_per_page = 10    # 每页显示10条
    list_editable = ("u_phone","u_name")  # 设置可编辑的字段
    search_fields = ("u_phone","u_name")   # 设置可以被搜索的字段
    list_filter = ("u_phone","u_name")   # 设置可以被过滤的字段