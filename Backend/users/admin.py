from django.contrib import admin

# Register your models here.
# Display custom list for Article model
from .models import Profile


@admin.register(Profile)
class UserAdmin(admin.ModelAdmin):
    list_display = ("name", "username", "email", "created")
    search_fields = ('email', 'name', 'username')