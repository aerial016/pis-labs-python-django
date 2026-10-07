from django.http import Http404
from django.shortcuts import render, redirect
from .models import Article


def archive(request):
    return render(request, 'archive.html', {'posts': Article.objects.all()})


def get_article(request, article_id):
    try:
        post = Article.objects.get(id=article_id)
    except Article.DoesNotExist:
        raise Http404
    return render(request, 'article.html', {'post': post})


def create_post(request):
    if request.user.is_anonymous:
        raise Http404

    form = {}
    if request.method == 'POST':
        form = {
            'title': request.POST.get('title', '').strip(),
            'text': request.POST.get('text', '').strip(),
        }
        if not form['title'] or not form['text']:
            form['errors'] = 'Не все поля заполнены'
        elif len(form['title']) > 200:
            form['errors'] = 'Название не должно превышать 200 символов'
        elif Article.objects.filter(title=form['title']).exists():
            form['errors'] = 'Статья с таким названием уже существует'
        else:
            article = Article.objects.create(
                title=form['title'], text=form['text'], author=request.user
            )
            return redirect('get_article', article_id=article.id)

    return render(request, 'create_post.html', {'form': form})
