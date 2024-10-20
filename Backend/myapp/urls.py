from django.urls import path 
from myapp import views

url_patterns = [
    path('add_preferences/', views.add_user_preferences_view, name = 'add_preferences'),
    path('explore_similar/', views.explore_similar_users_view, name = 'explore_similar')
]