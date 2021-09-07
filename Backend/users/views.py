from django.contrib import messages
from django.contrib.auth import logout, authenticate, login
from django.contrib.auth.models import User
from django.shortcuts import render, redirect

from .forms import CustomUserCreationForm
from .models import Profile


# login for exiting user
def userLogin(request):
    page = 'register'
    # if request.user.is_authenticated:
    #     return redirect("profile")

    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']

        try:
            user = User.objects.get(username=username)
        except:
            messages.error(request, "Username does not exist")

        user = authenticate(request, username=username, password=password)

        # if user is not None:
        #     login(request, user)
        #     return redirect('blog')
        # else:
        #     messages.error(request, "Username or Password is incorrect")

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


# user profile
def profile(request):
    all_profiles = Profile.objects.all()
    context = {'profiles': all_profiles}
    return render(request, 'users/profile.html', context)


# specific user profile page
def userProfile(request, pk):
    user_profile = Profile.objects.get(id=pk)
    context = {'profile': user_profile}
    return render(request, 'users/profile.html', context)


def logoutUser(request):
    logout(request)
    messages.success(request, "Logout Successful")
    return redirect('login')