from django.shortcuts import render, redirect
from .models import Article
from .forms import PostForm
from django.contrib.auth.decorators import login_required


# Create your views here.
def posts(request):
    all_posts = Article.published.all()
    context = {'all_posts': all_posts}
    return render(request, 'blog/posts.html', context)


# display a single article
def single_post(request, slug):
    post = Article.objects.get(slug=slug)
    context = {
        'post': post,
    }
    return render(request, 'blog/single-post.html', context)


# create a new article
@login_required(login_url="login")
def create_post(request):
    profile = request.user.profile
    form = PostForm()

    # create a new post
    if request.method == 'POST':
        form = PostForm(request.POST, request.FILES)
        if form.is_valid():
            article = form.save(commit=False)
            article.author = profile
            article.save()
            return redirect('posts')

    context = {'form': form}
    return render(request, 'blog/post-form.html', context)


# update the exiting post
@login_required(login_url="login")
def update_post(request, slug):
    profile = request.user.profile
    post = Article.objects.get(slug__exact=slug)
    form = PostForm(instance=post)

    if request.method == 'POST':
        form = PostForm(request.POST, request.FILES, instance=post)
        if form.is_valid():
            form.save()
            return redirect('posts')

    context = {'form': form, 'post': post}
    return render(request, 'blog/post-form.html', context)


# delete the post
@login_required(login_url="login")
def delete_post(request, slug):
    profile = request.user.profile
    post = Article.objects.get(slug__exact=slug)

    if request.method == 'POST':
        post.delete()
        return redirect('posts')

    context = {'object': post}
    return render(request, 'blog/post-form.html', context)
