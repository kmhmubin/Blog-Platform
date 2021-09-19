import uuid

from autoslug import AutoSlugField
from ckeditor_uploader.fields import RichTextUploadingField
from django.db import models
from django.urls import reverse
from django.utils import timezone

from users.models import Profile


# Model Manager for article
class PublishedManager(models.Manager):
    def get_queryset(self):
        return super(PublishedManager, self).get_queryset().filter(status='published')


# article model
class Article(models.Model):
    STATUS_CHOICES = (
        ('draft', 'Draft'),
        ('published', 'Published'),
    )
    author = models.ForeignKey(Profile, null=True, blank=True, on_delete=models.SET_NULL, related_name='blog_posts')
    title = models.CharField(max_length=200)
    slug = AutoSlugField(populate_from='title', unique=True, null=False, db_index=True, unique_for_date='publish')
    excerpt = models.CharField(max_length=60)
    featured_image = models.ImageField(upload_to="posts", null=True, blank=True, default="default.jpg")
    content = RichTextUploadingField()
    created = models.DateTimeField(auto_now_add=True)
    last_update = models.DateTimeField(auto_now=True)
    publish = models.DateTimeField(default=timezone.now)
    status = models.CharField(max_length=10, choices=STATUS_CHOICES, default='draft')

    # sort out by publish date
    class Meta:
        ordering = ('-publish',)

    # display the article name
    def __str__(self):
        return self.title

    # default model manager
    objects = models.Manager()
    # custom model manager
    published = PublishedManager()

    # canonical URL for the article
    def get_absolute_url(self):
        return reverse('blog:post_detail', args=[self.slug])

    # Default comment option
    def get_comments(self):
        return self.comments.filter(active=True)


# Article Comment model
class Comment(models.Model):
    post = models.ForeignKey(Article, on_delete=models.CASCADE, related_name="comments")
    author = models.ForeignKey(Profile, on_delete=models.CASCADE)
    body = models.TextField()
    active = models.BooleanField(default=True)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    id = models.UUIDField(default=uuid.uuid4, unique=True, primary_key=True, editable=False)

    # sort out by date
    class Meta:
        ordering = ('created',)

    # display the comment body
    def __str__(self):
        return self.body

