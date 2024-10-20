from django.db import models

# Create your models here.
# change parameters here. 
class Person(models.Model):
    name = models.CharField(max_length=60)
    favoriteBoba = models.CharField(max_length=60)
    def __str__(self):
        return str(self.name)
