import django_filters

from goods.models import ShowDown, Goods


class ShowFilter(django_filters.rest_framework.FilterSet):
    typeid = django_filters.CharFilter("parent_id")   # 商品大分类id
    # childcid = django_filters.CharFilter(method="filter_childcid")   # 商品小分类id

    class Meta:
        model = ShowDown
        fields = ["parent_id"]


class GoodsFilter(django_filters.rest_framework.FilterSet):
    typeid = django_filters.CharFilter("goods_id")   # 商品大分类id
    # childcid = django_filters.CharFilter(method="filter_childcid")   # 商品小分类id

    class Meta:
        model = Goods
        fields = ["goods_id"]