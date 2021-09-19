from django.urls import path

from . import views

urlpatterns = [
    path('', views.posts, name="posts"),
    path('post/<slug:slug>/', views.single_post, name="single-post"),
    path('create/', views.create_post, name="create-post"),
    path('update/<slug:slug>/', views.update_post, name="update-post"),
    path('delete/<slug:slug>/', views.delete_post, name="delete-post"),

]
