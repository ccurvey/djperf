from django.shortcuts import render
from store.models import Sale

# Create your views here.

#############################################################################
## our first naive case
#############################################################################
def list_sales(request):
    sales = Sale.objects.all()
    return render(request, "list_sales.html", {"sales" : sales})

############################################################################
## using select_related
############################################################################
def list_sales2(request):
    sales = Sale.objects.select_related("customer").all()
    return render(request, "list_sales.html", {"sales" : sales})

############################################################################
## adding in the line item count
############################################################################
def list_sales3(request):
    sales = Sale.objects.select_related("customer").all()
    return render(request, "list_sales2.html", {"sales" : sales})

############################################################################
## what happens if we prefetch the line items?
############################################################################
def list_sales4(request):
    sales = Sale.objects.select_related("customer").all().prefetch_related("lineitem_set")
    return render(request, "list_sales2.html", {"sales" : sales})

############################################################################
## what about doing server-side pagination?
############################################################################
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
def list_sales5(request):
    sale_list = Sale.objects.select_related("customer").all().prefetch_related("lineitem_set")
    paginator = Paginator(sale_list, 25)
    page = request.GET.get('page')
    try:
        sales = paginator.page(page)
    except PageNotAnInteger:
        sales = paginator.page(1)
    except EmptyPage:
        sales = paginator.page(paginator.num_pages)
        
    return render(request, "list_sales_paginated.html", {"sales" : sales})
    