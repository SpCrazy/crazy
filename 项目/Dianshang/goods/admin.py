from django.contrib import admin

from goods.models import Goods


@admin.register(Goods)
class GoodsAdmin(admin.ModelAdmin):
    list_display = ("id","goods_id","goods_name","goods_price")    # 显示的字段
    list_per_page = 10   # 每页显示10条
    list_editable = ("goods_id","goods_name","goods_price")   # 可以被编辑的字段
    search_fields = ("goods_id","goods_name","goods_price")  # 可以被搜索的字段

    # def get_queryset(self, request):
    #     if not request.user.is_superuser:
    #         return super(admin.ModelAdmin,self).get_queryset(request).display("goods_name","goods_price")