from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User


class CustomUserCreationForm(UserCreationForm):
    # username = forms.CharField(
    #     min_length=4,
    #     max_length=150,
    #     widget=forms.TextInput(attrs={'class': 'form-control'})
    # )
    # email = forms.EmailField(widget=forms.TextInput(attrs={'class': 'form-control'}))
    # password1 = forms.CharField(widget=forms.PasswordInput(attrs={'class': 'form-control'}),
    #                             help_text=password_validation.password_validators_help_text_html())
    # password2 = forms.CharField(
    #     widget=forms.PasswordInput(attrs={'class': 'form-control'}),
    #     help_text='Enter the same password'
    # )

    class Meta:
        model = User
        fields = ['username', 'email', 'password1', 'password2']

    def __init__(self, *args, **kwargs):
        super(CustomUserCreationForm, self).__init__(*args, **kwargs)

        for name, field in self.fields.items():
            field.widget.attrs.update({'class': 'form-control'})