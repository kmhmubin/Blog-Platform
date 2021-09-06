from django.shortcuts import render, redirect

from .forms import PostForm
from .models import Article


# display all blog posts
def posts(request):
    all_posts = Article.objects.all().order_by("-publish")
    context = {'all_posts': all_posts}
    return render(request, 'blog/posts.html', context)


# Single post
def single_post(request, slug):
    post = Article.objects.get(slug=slug)
    context = {
        'post': post,
    }
    return render(request, 'blog/single-post.html', context)


# Create article
def create_post(request):
    form = PostForm()
    # checking form method
    if request.method == 'POST':
        form = PostForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('posts')

    context = {'form': form}
    return render(request, 'blog/post-form.html', context)


# update the existing post
def update_post(request, slug):
    post = Article.objects.get(slug__exact=slug)
    form = PostForm(instance=post)

    if request.method == 'POST':
        form = PostForm(request.POST, request.FILES, instance=post)
        if form.is_valid():
            form.save()
            return redirect('posts')

    context = {'form': form}
    return render(request, 'blog/post-form.html', context)


# delete a post
def delete_post(request, slug):
    post = Article.objects.get(slug__exact=slug)
    context = {'object': post}

    if request.method == 'POST':
        post.delete()
        return redirect('posts')

    return render(request, 'blog/post-form.html', context)