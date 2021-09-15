from django.shortcuts import render, redirect
from django.contrib.auth import login, logout, authenticate
from django.contrib.auth.models import User
from django.contrib import messages
from users.models import Profile


# user logging view
def login_user(request):
    if request.user.is_authenticated:
        return redirect('profiles')

    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']

        try:
            user = User.objects.get(username=username)
        except:
            messages.error(request, 'Username does not exist')

        user = authenticate(request, username=username, password=password)

        if user is not None:
            login(request, user)
            return redirect('profiles')
        else:
            messages.error(request, 'Username or Password is incorrect')

    return render(request, 'users/login-reg.html')


# logout the user
def logout_user(request):
    logout(request)
    messages.success(request, "Logout successfully")
    return redirect('login')


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
