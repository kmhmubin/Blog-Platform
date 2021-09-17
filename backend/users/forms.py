from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from users.models import Profile
from django.forms import ModelForm


# generate custom signup form from the user model class
class CustomUserCreationForm(UserCreationForm):
    class Meta:
        model = User
        fields = ['first_name', 'username', 'email', 'password1', 'password2']
        labels = {
            'first_name': 'Full Name',
        }

    def __init__(self, *args, **kwargs):
        super(CustomUserCreationForm, self).__init__(*args, **kwargs)

        for name, field in self.fields.items():
            field.widget.attrs.update({'class': 'form-control'})


# generate the profile form for the user
class ProfileForm(ModelForm):
    class Meta:
        model = Profile
        fields = ['name', 'username', 'email', 'profile_tagline', 'bio', 'profile_image', 'address_1', 'address_2',
                  'city', 'zip', 'country', 'facebook', 'twitter', 'linkedin', 'github', 'website']

    def __init__(self, *args, **kwargs):
        super(ProfileForm, self).__init__(*args, **kwargs)

        for name, field in self.fields.items():
            field.widget.attrs.update({'class': 'form-control'})

