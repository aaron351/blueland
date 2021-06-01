from typing import ContextManager
from django.shortcuts import render,  redirect
from django.contrib.auth import  authenticate, login, logout
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout

from .forms import CreateUserForm

def index(request):
    return render(request,'index.html')

def register(request):
    form = CreateUserForm()

    if request.method == 'POST':
        form =  CreateUserForm(request.POST)
        if form.is_valid():
            form.save()
            user = form.cleaned_data.get('username')
            messages.success(request,'se ha creado la cuenta de' + user)

            return redirect('login')

    context = {'form': form}
    return render(request, 'RegistrarUser.html', context)

def loginpage(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')

        users = authenticate(request, username = username, password = password)

        if users is not None:
            login(request, users)
            return redirect('home')
        else:
            messages.info(request, 'contrasena incorrecta')

    context = {}
    return render(request, 'login.html', context)

def logoutpage(request):
    logout(request)
    return redirect("home")

def products(request):
    if request.user.is_authenticated:
        return render(request, 'usuario.html')
    else:
        return redirect('login')