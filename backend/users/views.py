from django.shortcuts import render
from users.models import Profile


# All author profile view
def authors(request):
    # fetch all the author profile from db
    authors_profile = Profile.objects.all()
    context = {'profiles': authors_profile}
    return render(request, 'users/authors.html', context)


# Get a specific author profile
def author_profile(request, pk):
    # get the specific user
    author = Profile.objects.get(id=pk)
    context = {'profile': author}
    return render(request, 'users/author-profile.html', context)
