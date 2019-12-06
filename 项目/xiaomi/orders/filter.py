import django_filters

from orders.models import ORDER_STATE_NO_PAY, ORDER_STATE_NO_GET, ORDER_STATE_NO_EVA


class OrderFilter(django_filters.rest_framework.FilterSet):
    o_status = django_filters.CharFilter(method="filter_status")


    def filter_status(self,queryset,name,value):
        if value == "all":
            return queryset
        elif value == "not_pay":
            return queryset.filter(o_state=ORDER_STATE_NO_PAY)
        elif value == "not_get":
            return queryset.filter(o_state=ORDER_STATE_NO_GET)
        elif value == "not_eva":
            return queryset.filter(o_state=ORDER_STATE_NO_EVA)