from django.conf.urls import url, patterns
from store.views import list_sales, \
     list_sales_select_related, \
     list_sales_line_item_count, \
     list_sales_line_item_count_prefetch, \
     list_sales_server_pagination

from store.views import list_sales_jinja, \
     list_sales_select_related_jinja, \
     list_sales_line_item_count_jinja, \
     list_sales_line_item_count_prefetch_jinja, \
     list_sales_server_pagination_jinja

urlpatterns = patterns("store.views",
    url("list_sales/", list_sales),
    url("list_sales_select_related/", list_sales_select_related),
    url("list_sales_line_item_count/", list_sales_line_item_count),
    url("list_sales_line_item_count_prefetch/", list_sales_line_item_count_prefetch),
    url("list_sales_server_pagination/", list_sales_server_pagination),
    
    url("list_sales_jinja/", list_sales_jinja),
    url("list_sales_select_related_jinja/", list_sales_select_related_jinja),
    url("list_sales_line_item_count_jinja/", list_sales_line_item_count_jinja),
    url("list_sales_line_item_count_prefetch_jinja/", list_sales_line_item_count_prefetch_jinja),
    url("list_sales_server_pagination_jinja/", list_sales_server_pagination_jinja),

    url("/","index"),

)