from django.contrib import admin

from .models import Article, Tag


# Display custom list for tag model
class TagAdmin(admin.ModelAdmin):
    # show custom field
    list_display = ("name", "created")
  

# Display custom list for Article model
class ArticleAdmin(admin.ModelAdmin):
    list_display = ("title", "created")


# Register all blog models
admin.site.register(Article, ArticleAdmin)
admin.site.register(Tag, TagAdmin)