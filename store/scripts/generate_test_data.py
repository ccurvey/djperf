import datetime
import random
import factory.django
import factory.fuzzy
from store.models import Customer, Product, Sale, LineItem

class CustomerFactory(factory.django.DjangoModelFactory):
    class Meta:
        model = Customer
        
    name = factory.fuzzy.FuzzyText()
    birthdate = factory.fuzzy.FuzzyDate(datetime.date(1950,1,1),
                                        datetime.date(2000, 12, 31))

class ProductFactory(factory.django.DjangoModelFactory):
    class Meta:
        model = Product
        
    name = factory.fuzzy.FuzzyText()
    price = factory.fuzzy.FuzzyDecimal(low=1, high=100)
    
class SaleFactory(factory.django.DjangoModelFactory):
    class Meta:
        model = Sale
        
    order_date = factory.fuzzy.FuzzyDate(datetime.date(2015,1,1), 
                                         datetime.date.today())
    
def run():
    customers = []
    for i in xrange(100):
        customers.append(CustomerFactory.create())
        
    products = []
    for i in xrange(20):
        products.append(ProductFactory.create())
        
    for i in xrange(1000):
        sale = SaleFactory.create(customer = random.choice(customers))
        sale.save()
        for j in xrange(random.randint(1, 10)):
            line_item = LineItem(sale=sale, product=random.choice(products),
                                 quantity=random.randint(1,5))
            line_item.save()
        