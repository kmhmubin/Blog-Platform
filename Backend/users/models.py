import uuid

from django.contrib.auth.models import User
from django.db import models


# Create your models here.
class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, null=True, blank=True)
    name = models.CharField(max_length=200, blank=True, null=True)
    username = models.CharField(max_length=200, null=True, blank=True)
    email = models.EmailField(max_length=200, null=True, blank=True)
    bio = models.TextField(max_length=200, blank=True, null=True)
    profile_image = models.ImageField(upload_to='profiles', blank=True, null=True, default='astronaut.svg')
    location = models.CharField(max_length=200, null=True, blank=True)
    address = models.OneToOneField('BillingAddress', blank=True, null=True, on_delete=models.SET_NULL)
    social_links = models.ManyToManyField('SocialLinks', blank=True)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    id = models.UUIDField(default=uuid.uuid4, unique=True, primary_key=True, editable=False)

    def __str__(self):
        return str(self.username)

    class Meta:
        ordering = ['name']


# Billing Address Model
class BillingAddress(models.Model):
    owner = models.ForeignKey(Profile, on_delete=models.CASCADE, blank=True, null=True)
    address_1 = models.CharField('Present Address', max_length=128, null=True, blank=True)
    address_2 = models.CharField('Present Address cont..', max_length=128, blank=True, null=True)
    city = models.CharField('City: Dhaka', max_length=65, blank=True, null=True)
    country = models.CharField('Country: Bangladesh', max_length=70, blank=True, null=True)
    zip = models.CharField('Zip Code: 1234', max_length=4, blank=True, null=True)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    id = models.UUIDField(default=uuid.uuid4, unique=True, primary_key=True, editable=False)

    def __str__(self):
        return self.address_1, self.address_2, self.city, self.country, self.zip


# Social Link Model
class SocialLinks(models.Model):
    owner = models.ForeignKey(Profile, on_delete=models.CASCADE, blank=True, null=True)
    github = models.URLField(null=True, blank=True)
    twitter = models.URLField(null=True, blank=True)
    linkedin = models.URLField(null=True, blank=True)
    facebook = models.URLField(null=True, blank=True)
    youtube = models.URLField(null=True, blank=True)
    website = models.URLField(null=True, blank=True)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    id = models.UUIDField(default=uuid.uuid4, unique=True, primary_key=True, editable=False)

    def __str__(self):
        return self.github, self.twitter, self.linkedin, self.facebook, self.youtube, self.website