from django.urls import path
from . import views

urlpatterns = [
    # GET http://localhost:8000/api/holidays_dates/
    path("holidays_dates/", views.get_holidays_dates),

    # GET http://localhost:8000/api/total_users/
    path("total_users/", views.total_users),

    # GET http://localhost:8000/api/total_likes/
    path("total_likes/", views.total_likes),

    # GET http://localhost:8000/api/get_cities_with_likes/
    path("get_cities_with_likes/", views.get_cities_with_likes),

    # POST and GET http://localhost:8000/api/login/
    path("login/", views.log_in),

    # GET http://localhost:8000/api/logout/
    path("logout/", views.log_out),
    
]
