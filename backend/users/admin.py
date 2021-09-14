from django.contrib import admin
from users.models import Profile


# Register profile models here.
@admin.register(Profile)
class UserProfile(admin.ModelAdmin):
    list_display = ('name', 'created')
