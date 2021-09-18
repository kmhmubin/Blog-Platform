from django.shortcuts import render, get_object_or_404
from blog.models import Article


# Display all the published post
def post_list(request):
    posts = Article.published.all()
    context = {'posts': posts}
    return render(request, 'blog/posts.html', context)


# display the single post
def post_details(request, slug):
    post = get_object_or_404(Article, slug=slug, status='published')
    context = {'post': post}
    return render(request, 'blog/single-post.html', context)
