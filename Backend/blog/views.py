from django.shortcuts import render


# all blog posts
def posts(request):
    return render(request, 'blog/posts.html')