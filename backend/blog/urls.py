from django.urls import path
from . import views

app_name = 'blog'

urlpatterns = [
    path('', views.post_list, name="post_list"),
    path('<slug:slug>/', views.post_details, name="post_detail"),
    path('<slug:slug>/comment/', views.add_comment, name="add-comment"),
    path('comment/<str:pk>/remove/', views.comment_remove, name='comment_remove'),
]
