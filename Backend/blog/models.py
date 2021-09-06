from autoslug import AutoSlugField
from django.db import models
from django.urls import reverse
from django.utils import timezone
from froala_editor.fields import FroalaField

from users.models import Profile


# Model Manager for article
class PublishedManager(models.Manager):
    def get_queryset(self):
        return super(PublishedManager, self).get_queryset().filter(status='published')


# Article model
class Article(models.Model):
    STATUS_CHOICES = (
        ('draft', 'Draft'),
        ('published', 'Published'),
    )
    author = models.ForeignKey(Profile, null=True, blank=True, on_delete=models.SET_NULL)
    title = models.CharField(max_length=200)
    slug = AutoSlugField(populate_from='title', unique=True, null=False, db_index=True)
    excerpt = models.CharField(max_length=60)
    featured_image = models.ImageField(upload_to="posts", null=True, blank=True, default="default.jpg")
    content = FroalaField()
    created = models.DateTimeField(auto_now_add=True)
    last_update = models.DateTimeField(auto_now=True)
    publish = models.DateTimeField(default=timezone.now)
    status = models.CharField(max_length=10, choices=STATUS_CHOICES, default='draft')
    
    # default model manager
    objects = models.Manager()
    # custom model manager
    published = PublishedManager()

    # canonical URL for the article
    def get_absolute_url(self):
        return reverse('blog:single-post', args=[self.slug])

    # display the title in the admin panel
    def __str__(self):
        return self.title

    # sort the article by publish date
    class Meta:
        ordering = ['-publish']