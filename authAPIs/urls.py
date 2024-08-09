from django.urls import path
from authAPIs.views import *
urlpatterns = [
    path('login', LoginView.as_view()),
    path('common/registration', CommonRegistration.as_view()),
    path('mark/attendence', MarkAttendence.as_view())
]
