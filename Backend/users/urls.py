from django.urls import path

from . import views

urlpatterns = [
    path('login/', views.userLogin, name='login'),
    path('register/', views.userRegister, name='register'),
    path('profile/<str:pk>', views.userProfile, name='profile'),
    path('logout/', views.logoutUser, name='logout'),
]