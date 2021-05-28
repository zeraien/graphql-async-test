import json
from time import sleep

from django.http import HttpResponse
from django.template.loader import render_to_string

from cookbook.recipes.models import Recipe


def base_test(request):
    wait = request.GET.get('wait')
    recipes = Recipe.objects.all()
    if wait:
        sleep(int(wait))
    return HttpResponse(json.dumps([{'id':r.id,'title':r.title} for r in recipes]), content_type="application/json")
#query {
#  recipe(id:"UmVjaXBlTm9kZTox"){
 #   id title
#  }
#}
