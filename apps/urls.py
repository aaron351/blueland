from django.conf.urls import url
from django.urls import path, include
from . import views
from django.conf.urls.static import static
from django.contrib.auth.views import LoginView, LogoutView

urlpatterns = [
    path('', views.index, name='home'),
    path('register/', views.register, name='register'),
    path('login/', views.loginpage, name='login'),
    path('logout/', views.logoutpage, name='logout'),
    path('products/', views.products, name='products'),
] #+ static(settings.Media-url, documents_root=Media.root)