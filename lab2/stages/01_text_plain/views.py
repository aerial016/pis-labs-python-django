from django.http import HttpResponse

def home(request):
    return HttpResponse(u'Привет, Мир!', content_type="text/plain")
