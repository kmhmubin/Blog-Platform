from django.forms import ModelForm

from blog.models import Article


class PostForm(ModelForm):
    class Meta:
        model = Article
        fields = ['title', 'excerpt', 'content']