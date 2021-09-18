from django.shortcuts import render
from blog.models import Article


# Display all the post
def post_list(request):
    posts = Article.objects.filter(status='published')
    context = {'posts': posts}
    return render(request, 'blog/index.html', context)
