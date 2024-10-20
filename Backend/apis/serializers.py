from rest_framework import serializers

from .models import Person
#this is ultimately what is written out to our database. 
class PersonSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Person
        fields = ('id', 'name', 'favoriteBoba')
