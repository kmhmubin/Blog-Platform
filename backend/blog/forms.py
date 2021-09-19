from django.forms import ModelForm

from blog.models import Article


class PostForm(ModelForm):
    class Meta:
        model = Article
        fields = ['title', 'excerpt', 'featured_image', 'content', 'status']

    def __init__(self, *args, **kwargs):
        super(PostForm, self).__init__(*args, **kwargs)

        for name, field in self.fields.items():
            field.widget.attrs.update({'class': 'form-control'})
