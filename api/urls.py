"""
URL configuration for the API app.
"""
from django.urls import path
from . import views

urlpatterns = [
    path('a/', views.endpoint_a, name='endpoint_a'),
    path('b/', views.endpoint_b, name='endpoint_b'),
    path('c/', views.endpoint_c, name='endpoint_c'),
]
