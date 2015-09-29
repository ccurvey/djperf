from django.db import models

# Create your models here.

class Customer(models.Model):
    name = models.CharField(max_length=100)
    birthdate = models.DateField(null=True, blank=True)
    
    def __unicode__(self):
        return "Customer: {}".format(self.name)
    
    def __repr__(self):
        return "Customer(name='{}', birthdate={})".format(self.name,
                                                        self.birthdate)
    
class Product(models.Model):
    name = models.CharField(max_length=100)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    
    def __repr__(self):
        return "Product(name='{}', price={})".format(self.name, self.price)

class Sale(models.Model):
    customer = models.ForeignKey(Customer)
    order_date = models.DateField()
    
    @property
    def total(self):
        """this is a placeholder!"""
        return "Fixme!"
    
    def __repr__(self):
        return "Sale(customer='{}', total={}".format(self.customer, self.total)

class LineItem(models.Model):
    sale = models.ForeignKey(Sale)
    product = models.ForeignKey(Product)
    quantity = models.IntegerField()
    
    def __repr__(self):
        return "LineItem(sale={}, product={}, quantity={})".format(self.sale,
                self.product, self.quantity)