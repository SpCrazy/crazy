import django_filters
from orders.models import *

class OrdersFilter(django_filters.rest_framework.FilterSet):
    o_status = django_filters.CharFilter(method="filter_status")   #创建过滤方式，o_status为前端传过滤规则参数名

    def filter_status(self,queryset,name,value):
        if value == "all":   #显示全部订单
            return queryset
        elif value == "not_pay":   #显示未付款订单
            return queryset.filter(o_state=ORDER_STATE_NO_PAY)
        elif value == "not_get":   #显示未收货订单
            return queryset.filter(o_state=ORDER_STATE_NO_GET)
        elif value =="not_eva":   #显示待评论订单
            return  queryset.filter(o_state=ORDER_STATE_NO_EVA)



