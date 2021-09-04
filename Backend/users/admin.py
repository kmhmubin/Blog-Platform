from django.contrib import admin

# Register your models here.
# Display custom list for Article model
from .models import Profile


class UserAdmin(admin.ModelAdmin):
    list_display = ("name", "username", "email", "created")


admin.site.register(Profile, UserAdmin)