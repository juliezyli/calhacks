from django.shortcuts import render

# Create your views here.
from rest_framework import viewsets
from .models import Person
from apis.serializers import PersonSerializer
class PersonViewSet(viewsets.ModelViewSet):
    queryset = Person.objects.all().order_by('name')
    serializer_class = PersonSerializer
