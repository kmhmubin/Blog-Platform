from django.urls import path
from . import views

urlpatterns = [
    path('login/', views.login_user, name='login'),
    path('logout/', views.logout_user, name='logout'),
    path('', views.authors, name='profiles'),
    path('author/<str:pk>', views.author_profile, name='author-profile'),
]
