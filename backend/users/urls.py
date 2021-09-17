from django.urls import path
from . import views

urlpatterns = [
    path('login/', views.login_user, name='login'),
    path('register/', views.register_user, name='register'),
    path('logout/', views.logout_user, name='logout'),
    path('', views.authors, name='profiles'),
    path('author/<str:pk>', views.author_profile, name='author-profile'),
    path('account/', views.user_account, name='account'),
    path('update-account/', views.update_account, name='update-account'),
]
