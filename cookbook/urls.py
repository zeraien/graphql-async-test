from django.conf.urls import url
from django.contrib import admin
from django.conf import settings
from django.conf.urls.static import static
from graphene_django.views import GraphQLView
from graphql.execution.executors.gevent import GeventExecutor
from graphql.execution.executors.thread import ThreadExecutor
from graphql.execution.executors.sync import SyncExecutor
from graphql.execution.executors.process import ProcessExecutor

from .recipes.views import base_test

urlpatterns = [
    url("admin/", admin.site.urls),
    url("graphql/", GraphQLView.as_view(graphiql=True)),
    url("base_test/", base_test),
]+ static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

