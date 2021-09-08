from django.contrib import messages
from django.contrib.auth import logout, authenticate, login
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.shortcuts import render, redirect

from .forms import CustomUserCreationForm
# login for exiting user
from .models import Profile


def userLogin(request):
    page = 'login'
    if request.user.is_authenticated:
        return redirect("posts")

    if request.method == 'POST':
        username = request.POST['username'].lower()
        password = request.POST['password']

        try:
            user = User.objects.get(username=username)
        except:
            messages.error(request, "Username does not exist")

        user = authenticate(request, username=username, password=password)

        if user is not None:
            login(request, user)
            return redirect('posts')
        else:
            messages.error(request, "Username or Password is incorrect")

    return render(request, 'users/login-registration.html')


# register a new user and check the password with confirmation password
def userRegister(request):
    page = 'register'
    form = CustomUserCreationForm()

    if request.method == 'POST':
        form = CustomUserCreationForm(request.POST)

        if form.is_valid():
            user = form.save(commit=False)
            user.username = user.username.lower()
            user.save()
            messages.success(request, f'{user.username} Account created successful')
            # auto login
            login(request, user)
            return redirect('posts')
        else:
            messages.error(request, "An error has occurred during registration")

    context = {'page': page, 'form': form}
    return render(request, 'users/login-registration.html', context)


# specific user profile page
@login_required(login_url='login')
def userAccount(request):
    user_profile = request.user.profile
    context = {'profile': user_profile}
    return render(request, 'users/profile.html', context)


def logoutUser(request):
    logout(request)
    messages.success(request, "Logout Successful")
    return redirect('posts')


def author(request):
    authors = Profile.objects.all()
    context = {'authors': authors}
    return render(request, 'users/authors.html', context)


def authorProfile(request, pk):
    author_profile = Profile.objects.get(id=pk)
    context = {'author': author_profile}
    return render(request, 'users/author-profile.html', context)