from autoslug import AutoSlugField
from django.db import models
from froala_editor.fields import FroalaField


# Tags Model
class Tag(models.Model):
    name = models.CharField(max_length=100)
    slug = AutoSlugField(populate_from='name', unique=True, blank=False, db_index=True)
    description = FroalaField()
    created = models.DateTimeField(auto_now_add=True)

    # display the title in the admin panel
    def __str__(self):
        return self.name

    class Meta:
        ordering = ['name']


# Article model
class Article(models.Model):
    title = models.CharField(max_length=200)
    slug = AutoSlugField(populate_from='title', unique=True, null=False, db_index=True)
    excerpt = models.CharField(max_length=60)
    featured_image = models.ImageField(upload_to="posts", null=True, blank=True, default="default.jpg")
    content = FroalaField()
    created = models.DateTimeField(auto_now_add=True)
    last_update = models.DateTimeField(auto_now=True)
    tags = models.ManyToManyField(Tag, blank=True)

    # display the title in the admin panel
    def __str__(self):
        return self.title

    class Meta:
        ordering = ['-created']