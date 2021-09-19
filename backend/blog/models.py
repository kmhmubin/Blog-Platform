from autoslug import AutoSlugField
from django.db import models
from django.urls import reverse
from django.utils import timezone
from users.models import Profile
from ckeditor_uploader.fields import RichTextUploadingField


# Model Manager for article
class PublishedManager(models.Manager):
    def get_queryset(self):
        return super(PublishedManager, self).get_queryset().filter(status='published')


# Article Model
class Article(models.Model):
    STATUS_CHOICES = (
        ('draft', 'Draft'),
        ('published', 'Published'),
    )
    author = models.ForeignKey(Profile, null=True, blank=True, on_delete=models.CASCADE)
    title = models.CharField(max_length=200)
    slug = AutoSlugField(populate_from='title', unique=True, null=False, db_index=True)
    excerpt = models.CharField(max_length=120, blank=True, null=True)
    featured_image = models.ImageField(upload_to="posts", null=True, blank=True, default="default.jpg")
    content = RichTextUploadingField()
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
        return reverse('single-post', args=[self.slug])

    # display the title in the admin panel
    def __str__(self):
        return self.title

    # sort the article by publish date
    class Meta:
        ordering = ['-publish']
