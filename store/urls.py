from django.conf.urls import url, patterns
from store.views import list_sales, list_sales2, list_sales3, list_sales4, \
     list_sales5

urlpatterns = patterns("store.views",
    url("list_sales/", list_sales),
    url("list_sales2/", list_sales2),
    url("list_sales3/", list_sales3),
    url("list_sales4/", list_sales4),
    url("list_sales5/", list_sales5),
    
)