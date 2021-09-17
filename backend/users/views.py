from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect
from django.contrib.auth import login, logout, authenticate
from django.contrib.auth.models import User
from django.contrib import messages
from users.forms import CustomUserCreationForm
from users.models import Profile


# user logging view
def login_user(request):
    page = 'login'
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


# register a user
def register_user(request):
    page = 'register'
    form = CustomUserCreationForm()

    if request.method == 'POST':
        form = CustomUserCreationForm(request.POST)

        if form.is_valid():
            user = form.save(commit=False)
            user.username = user.username.lower()
            user.save()

            messages.success(request, f'{user.username} Account Created Successfully')

            # auto login
            login(request, user)
            return redirect('profiles')
        else:
            messages.error(request, "An error has occurred during registration")

    context = {'page': page, 'form': form}
    return render(request, 'users/login-reg.html', context)


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


# user account
@login_required(login_url='login')
def user_account(request):
    profile = request.user.profile
    context = {'profile': profile}
    return render(request, 'users/profile.html', context)


# Update the user account
@login_required(login_url='login')
def update_account(request):
    context = {}
    return render(request, 'users/setting.html', context)
