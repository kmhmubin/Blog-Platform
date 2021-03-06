# Generated by Django 3.2.7 on 2021-09-14 13:41

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import uuid


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Profile',
            fields=[
                ('name', models.CharField(blank=True, max_length=200, null=True, verbose_name='Full Name')),
                ('email', models.EmailField(blank=True, max_length=200, null=True)),
                ('profile_tagline', models.CharField(blank=True, max_length=200, null=True)),
                ('bio', models.TextField(blank=True, null=True)),
                ('profile_image', models.ImageField(blank=True, default='astronaut.jpg', null=True, upload_to='profiles')),
                ('address_1', models.CharField(blank=True, max_length=128, null=True, verbose_name='Present Address')),
                ('address_2', models.CharField(blank=True, max_length=128, null=True, verbose_name='Present Address cont..')),
                ('city', models.CharField(blank=True, max_length=65, null=True, verbose_name='City')),
                ('zip', models.CharField(blank=True, max_length=4, null=True, verbose_name='Zip Code')),
                ('country', models.CharField(blank=True, max_length=70, null=True, verbose_name='Country')),
                ('github', models.URLField(blank=True, null=True, verbose_name='GitHub URL Link')),
                ('twitter', models.URLField(blank=True, null=True, verbose_name='Twitter URL Link')),
                ('linkedin', models.URLField(blank=True, null=True, verbose_name='Linkedin URL Link')),
                ('facebook', models.URLField(blank=True, null=True, verbose_name='Facebook URL Link')),
                ('youtube', models.URLField(blank=True, null=True, verbose_name='YouTube URL Link')),
                ('website', models.URLField(blank=True, null=True, verbose_name='Personal Website Link')),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('updated', models.DateTimeField(auto_now=True)),
                ('id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False, unique=True)),
                ('user', models.OneToOneField(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
