from django.shortcuts import render, redirect
from .models import Article, Tag
from .forms import PostForm, ReviewForm
from django.contrib.auth.decorators import login_required
from django.contrib import messages


# Create your views here.
def posts(request):
    all_posts = Article.published.all()
    context = {'all_posts': all_posts}
    return render(request, 'blog/posts.html', context)


# display a single article
def single_post(request, slug):
    post = Article.objects.get(slug=slug)
    form = ReviewForm()

    if request.method == 'POST':
        form = ReviewForm(request.POST)
        review = form.save(commit=False)
        review.post = post
        review.owner = request.user.profile
        review.save()

        post.getVoteCount

        messages.success(request, "Your review submit successfully")
        return redirect('single-post', slug=post.slug)

    context = {
        'post': post,
        'form': form,
    }
    return render(request, 'blog/single-post.html', context)


# create a new article
@login_required(login_url="login")
def create_post(request):
    profile = request.user.profile
    form = PostForm()

    # create a new post
    if request.method == 'POST':
        newtags = request.POST.get('newtags').replace(',', " ").split()
        form = PostForm(request.POST, request.FILES)
        if form.is_valid():
            article = form.save(commit=False)
            article.author = profile
            article.save()

            for tag in newtags:
                tag, created = Tag.objects.get_or_create(name=tag)
                article.tags.add(tag)

            return redirect('account')

    context = {'form': form}
    return render(request, 'blog/post-form.html', context)


# update the exiting post
@login_required(login_url="login")
def update_post(request, slug):
    profile = request.user.profile
    post = Article.objects.get(slug__exact=slug)
    form = PostForm(instance=post)

    if request.method == 'POST':
        newtags = request.POST.get('newtags').replace(',', " ").split()
        form = PostForm(request.POST, request.FILES, instance=post)
        if form.is_valid():
            form.save()
            for tag in newtags:
                tag, created = Tag.objects.get_or_create(name=tag)
                post.tags.add(tag)

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
