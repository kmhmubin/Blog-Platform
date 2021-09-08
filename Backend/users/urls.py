from django.urls import path

from . import views

urlpatterns = [
    path('login/', views.userLogin, name='login'),
    path('register/', views.userRegister, name='register'),
    path('account/', views.userAccount, name='account'),
    path('authors/', views.author, name='authors'),
    path('author/<str:pk>', views.authorProfile, name='author-profile'),
    path('logout/', views.logoutUser, name='logout'),
]