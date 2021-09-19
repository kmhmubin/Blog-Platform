from django.shortcuts import render, get_object_or_404, redirect
from blog.models import Article, Comment
from .forms import CommentForm
from django.contrib.auth.decorators import login_required
from django.contrib import messages


# Display all the published post
def post_list(request):
    posts = Article.published.all()
    context = {'posts': posts}
    return render(request, 'blog/posts.html', context)


# display the single post
@login_required(login_url='login')
def post_details(request, slug):
    post = get_object_or_404(Article, slug=slug, status='published')
    context = {'post': post}
    return render(request, 'blog/single-post.html', context)


# add new comment to post
@login_required(login_url='login')
def add_comment(request, slug):
    post = get_object_or_404(Article, slug=slug, status='published')
    comment_form = CommentForm()
    if request.method == 'POST':
        comment_form = CommentForm(request.POST)
        if comment_form.is_valid():
            comment = comment_form.save(commit=False)
            comment.post = post
            comment.save()
            messages.success(request, "Comment Added Successful")
            return redirect('blog:post_detail', slug=post.slug)
        else:
            messages.error(request, "An error has occurred during Comment")
            comment_form = CommentForm()

    context = {'form': comment_form}
    return render(request, 'blog/include/comments.html', context)


@login_required(login_url='login')
def comment_remove(request, pk):
    comment = get_object_or_404(Comment, id=pk)
    comment.delete()
    return redirect('blog:post_detail', id=comment.post.pk)
