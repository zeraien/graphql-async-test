from django.conf.urls import url
from django.contrib import admin
from django.conf import settings
from django.conf.urls.static import static
from graphene_django.views import GraphQLView

from .recipes.views import base_test

urlpatterns = [
    url("admin/", admin.site.urls),
    url("graphql/", GraphQLView.as_view(graphiql=True)),
    url("base_test/", base_test),
]+ static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

