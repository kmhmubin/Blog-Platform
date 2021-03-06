from django.db import models
from django.contrib.auth.models import User
import uuid


# Author Profile Model
class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, null=True, blank=True)
    name = models.CharField('Full Name', max_length=200, blank=True, null=True)
    username = models.CharField(max_length=200, blank=True, null=True)
    email = models.EmailField(max_length=200, null=True, blank=True)
    profile_tagline = models.CharField(max_length=200, null=True, blank=True)
    bio = models.TextField(null=True, blank=True)
    profile_image = models.ImageField(upload_to='profiles', blank=True, null=True, default='astronaut.jpg')
    address_1 = models.CharField('Present Address', max_length=128, null=True, blank=True)
    address_2 = models.CharField('Present Address cont..', max_length=128, blank=True, null=True)
    city = models.CharField('City', max_length=65, blank=True, null=True)
    zip = models.CharField('Zip Code', max_length=4, blank=True, null=True)
    country = models.CharField('Country', max_length=70, blank=True, null=True)
    github = models.URLField('GitHub URL Link', null=True, blank=True)
    twitter = models.URLField('Twitter URL Link', null=True, blank=True)
    linkedin = models.URLField('Linkedin URL Link', null=True, blank=True)
    facebook = models.URLField('Facebook URL Link', null=True, blank=True)
    youtube = models.URLField('YouTube URL Link', null=True, blank=True)
    website = models.URLField('Personal Website Link', null=True, blank=True)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    id = models.UUIDField(default=uuid.uuid4, unique=True, primary_key=True, editable=False)

    # display the username
    def __str__(self):
        return str(self.name)
