from django.urls import path
from . import views

urlpatterns = [
    path('', views.authors, name='profiles'),
    path('author/<str:pk>', views.author_profile, name='author-profile'),
]
