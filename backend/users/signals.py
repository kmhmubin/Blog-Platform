from django.contrib.auth.models import User
from django.db.models.signals import post_save, post_delete
from django.dispatch import receiver
from .models import Profile


# create a profile for a user
@receiver(post_save, sender=User)
def create_profile(sender, instance, created, **kwargs):
    # checking if the user exist
    if created:
        user = instance
        profile = Profile.objects.create(
            user=user,
            username=user.username,
            email=user.email,
            name=user.first_name,

        )


# profile update signal
@receiver(post_save, sender=Profile)
def profile_update(sender, instance, created, **kwargs):
    print('profile save')
    print('instance', instance)
    print('created', created)


# delete a user profile
@receiver(post_delete, sender=Profile)
def delete_user(sender, instance, **kwargs):
    user = instance.user
    user.delete()


# post_save.connect(create_profile, sender=User)
# post_save.connect(profile_update, sender=Profile)
# post_delete.connect(delete_user, sender=Profile)
