from django.contrib import admin

from .models import Article


# Display custom list for Article model
@admin.register(Article)
class ArticleAdmin(admin.ModelAdmin):
    list_display = ('title', 'author', 'publish', 'status')
    list_filter = ('status', 'created', 'publish', 'author')
    search_fields = ('title', 'author')
    date_hierarchy = 'publish'
    ordering = ('status', 'publish')