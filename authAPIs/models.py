from django.db import models
from django.contrib.auth.models import BaseUserManager, AbstractBaseUser, PermissionsMixin
from django.utils.timezone import now

# Create your models here.
class CustomAccountManager(BaseUserManager):
    def create_user(self, email, password=None, is_superuser=False, is_staff=False, **extra_fields):
        # Creates and saves a User with the given email and password.
        if not email:
            raise ValueError('Users must have an Email')
        user = self.model(
            email=email, is_superuser=is_superuser, is_staff=is_staff, **extra_fields
        )
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password, **extra_fields):
        user = self.create_user(email, password=password, is_superuser=True, is_staff=True,
                                **extra_fields)
        user.save(using=self._db)
        return user


class User(AbstractBaseUser, PermissionsMixin):
    usType = ((1, 'student'), (2, 'Staff'))
    fullName = models.CharField(max_length=255, null=True)
    userName = models.CharField(max_length=255, null=True)
    email = models.EmailField(max_length=255, null=False,unique=True)
    password = models.CharField(max_length=255, null=False)
    userType = models.IntegerField(choices=usType, null=True)
    deviceToken = models.CharField(max_length=255, null=True)
    profileImage = models.CharField(max_length=255, null=True)
    last_login = models.DateTimeField(default=now, editable=False)
    is_superuser = models.BooleanField(default=False)
    is_staff = models.BooleanField(default=False)
    submittedBy = models.CharField(max_length=255, null=True)
    createdAt = models.DateTimeField(default=now, editable=False)
    updatedAt = models.DateTimeField(default=now, editable=False)
    USERNAME_FIELD = "email"
    REQUIRED_FIELDS = ['fullName']
    objects = CustomAccountManager()

    def __str__(self):
        return self.email

    class Meta:
        db_table = 'users'
        indexes = [
            models.Index(fields=['email']),
            models.Index(fields=['fullName'])
       
        ]

class Department(models.Model):
    departmentName = models.CharField(max_length=250,null=False)
    submittedBy = models.CharField(max_length=255, null=False)
    updatedAt = models.DateTimeField(default=now, editable=False)
    class Meta:
        db_table = 'departments'

class Cource(models.Model):
    courceName = models.CharField(max_length=255, null=True)
    departmentId = models.ForeignKey(Department, db_column="departmentId",related_name='departmentId_ref', on_delete=models.CASCADE)
    semester = models.CharField(max_length=255, null=False)
    classs = models.CharField(max_length=255, null=False)
    lectureHours = models.IntegerField(null=False)
    submittedBy = models.CharField(max_length=255, null=False)
    createdAt = models.DateTimeField(default=now, editable=False)
    updatedAt = models.DateTimeField(default=now, editable=False)
    class Meta:
        db_table = 'courcess'


class AttendenceLog(models.Model):
    studentId = models.ForeignKey(User, db_column="studentId",related_name='studentId_ref', on_delete=models.CASCADE)
    courceId = models.ForeignKey(Cource, db_column="courceId",related_name='courceId_ref', on_delete=models.CASCADE)
    present = models.BooleanField(default=False)
    submittedBy = models.CharField(max_length=255, null=False)
    updatedAt = models.DateTimeField(default=now, editable=False)
    class Meta:
        db_table = 'attendence_logs'

