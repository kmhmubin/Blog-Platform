from django.contrib import admin

from .models import Article, Review, Tag


# Display custom list for Article model
@admin.register(Article)
class ArticleAdmin(admin.ModelAdmin):
    list_display = ('title', 'author', 'publish', 'status')
    list_filter = ('status', 'created', 'publish', 'author')
    search_fields = ('title', 'author')
    date_hierarchy = 'publish'
    ordering = ('status', 'publish')


@admin.register(Review)
class ReviewAdmin(admin.ModelAdmin):
    list_display = ('owner', 'post', 'created')


@admin.register(Tag)
class TagAdmin(admin.ModelAdmin):
    list_display = ('name', 'created')
