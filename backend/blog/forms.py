from django.forms import ModelForm, Textarea

from blog.models import Article, Comment


# Creating article Form
class PostForm(ModelForm):
    class Meta:
        model = Article
        fields = ['title', 'excerpt', 'featured_image', 'content']


# Creating Comment Form
class CommentForm(ModelForm):
    class Meta:
        model = Comment
        fields = ['body', ]
        labels = {
            'body': 'Comment',
        }

    # overriding the default form setting and adding custom style
    def __init__(self, *args, **kwargs):
        super(CommentForm, self).__init__(*args, **kwargs)
        self.fields['body'].widget.attrs = {'placeholder': 'Comment here...', 'class': 'form-control', 'rows': '2'}
