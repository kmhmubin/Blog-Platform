from django.contrib import admin

from user.models import Profile


@admin.register(Profile)
class UserAdmin(admin.ModelAdmin):
    list_display = ("name", "email", "created")
