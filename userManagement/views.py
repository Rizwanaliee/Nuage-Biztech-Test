from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.views.generic import ListView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.db.models import Q
from django.urls import reverse
from django.core.paginator import Paginator
from authAPIs.models import *

# Create your views here.

def adminLogin(request):
    if request.method == "GET":
        return render(request, 'userManagement/adminLogin.html')
    else:
        email = request.POST['email']
        password = request.POST['password']

        user = User.objects.filter(Q(email=email) & Q(is_superuser=1)).first()
        if user is None:
            messages.error(request, 'Incorrect email/password')
            return redirect('admin-login')
        elif not user.check_password(password.strip()):
            messages.error(request, 'Incorrect email/password')
            return redirect('admin-login')
        else:
            if user:
                login(request, user)
                return redirect('admin-dashboard')
            else:
                messages.error(request, 'Not authenticate user')

@login_required(login_url='admin-login')
def adminDashboard(request):
    
    context={
        "totalJobPosted":""
    }
    return render(request, 'userManagement/adminDashboard.html',context)

@login_required(login_url='admin-login')
def logoutAdmin(request):
    logout(request)
    return redirect('admin-login')