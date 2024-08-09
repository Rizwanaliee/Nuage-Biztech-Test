from rest_framework.generics import CreateAPIView, ListAPIView, RetrieveAPIView, UpdateAPIView
from rest_framework.permissions import AllowAny, IsAuthenticated
from rest_framework.parsers import JSONParser
import io
from rest_framework import status
from rest_framework.response import Response
from rest_framework_simplejwt.tokens import RefreshToken, AccessToken
from authAPIs.models import *
from django.contrib.auth.models import update_last_login
from django.contrib.auth.hashers import make_password
import jwt
from django.db.models import Q
from .serializers import *

class CommonRegistration(CreateAPIView):
    app_users_serializer_class = UserSerializer
    permission_classes = (AllowAny,)

    def post(self, request):
        try:
            pythonData = JSONParser().parse(io.BytesIO(request.body))
            fullName = pythonData.get('fullName', None)
            userName = pythonData.get('userName', None)
            email = pythonData.get('email', None)
            submitted_by = pythonData.get("submitted_by",None)
            userTypeId = pythonData.get('userTypeId', None)
            password = pythonData.get("password", False)

            if not fullName and not password:
                response = {
                    "error": {
                        "errorCode": 507,
                        "statusCode": status.HTTP_422_UNPROCESSABLE_ENTITY,
                        "errorMessage": "Full name and password is required."
                    },
                    "response": None
                }
                status_code = status.HTTP_422_UNPROCESSABLE_ENTITY
                return Response(response, status=status_code)
            
            if not userName:
                response = {
                    "error": {
                        "errorCode": 508,
                        "statusCode": status.HTTP_422_UNPROCESSABLE_ENTITY,
                        "errorMessage": "userName. is required."
                    },
                    "response": None
                }
                status_code = status.HTTP_422_UNPROCESSABLE_ENTITY
                return Response(response, status=status_code)
            

            if userTypeId != 1 and userTypeId != 2:
                response = {
                    "error": {
                        "errorCode": 509,
                        "statusCode": status.HTTP_422_UNPROCESSABLE_ENTITY,
                        "errorMessage": "Invalid userType type"
                    },
                    "response": None
                }
                return Response(response, status=status.HTTP_422_UNPROCESSABLE_ENTITY)
            if not submitted_by:
                response = {
                    "error": {
                        "errorCode": 510,
                        "statusCode": status.HTTP_422_UNPROCESSABLE_ENTITY,
                        "errorMessage": "required submitted_by field"
                    },
                    "response": None
                }
                return Response(response, status=status.HTTP_422_UNPROCESSABLE_ENTITY)

     
            if User.objects.filter(email=email).exists():
                response = {
                    "error": {
                        "errorCode": 531,
                        "statusCode": status.HTTP_422_UNPROCESSABLE_ENTITY,
                        "errorMessage": "Email already exist"
                    },
                    "response": None
                }
                status_code = status.HTTP_422_UNPROCESSABLE_ENTITY
                return Response(response, status=status_code)
        
            pythonData["password"] = make_password(password)
            pythonData["userType"] = userTypeId
            serializer = self.app_users_serializer_class(data=pythonData)
            if serializer.is_valid(raise_exception=True):
                user = serializer.save()
                refresh = RefreshToken.for_user(user)
                response = {
                    "error": None,
                    "response": {
                        "data": {
                            'userId': user.id,
                            'fullName': fullName,
                            'email': email,
                            "token": str(refresh.access_token),
                            "refreshToken": str(refresh),
                        },
                    },
                    "message": {
                        'success': True,
                        "successCode": 201,
                        "statusCode": status.HTTP_201_CREATED,
                        "successMessage": "Registration Successfully, You have successfully Registered to Nuage Bitztech."
                    }
                    
                }
                status_code = status.HTTP_201_CREATED
                return Response(response, status=status_code)
            response = {
                "error": {
                    "errorCode": 511,
                    "statusCode": status.HTTP_400_BAD_REQUEST,
                    "errorMessage": "failed to register user"
                },
                "response": None
            }
            status_code = status.HTTP_400_BAD_REQUEST
            return Response(response, status=status_code)
        except Exception as e:
            status_code = status.HTTP_400_BAD_REQUEST
            response = {
                "error": {
                    "errorCode": 522,
                    "statusCode": status.HTTP_400_BAD_REQUEST,
                    "errorMessage": str(e)
                },
                "response": None
            }
            return Response(response, status=status_code)
        


class LoginView(RetrieveAPIView):
    permission_classes = (AllowAny,)

    def post(self, request):
        try:
            pythonData = JSONParser().parse(io.BytesIO(request.body))
            email = pythonData.get(
                'email', False)
            userTypeId = pythonData.get('userTypeId', False)
            password = pythonData.get('password', False)

            if not userTypeId:
                response = {
                    "error": {
                        "errorCode": 501,
                        "statusCode": status.HTTP_422_UNPROCESSABLE_ENTITY,
                        "errorMessage": "User type field is required!"
                    },
                    "response": None
                }
                return Response(response, status=status.HTTP_422_UNPROCESSABLE_ENTITY)

            if not email:
                response = {
                    "error": {
                        "errorCode": 502,
                        "statusCode": status.HTTP_422_UNPROCESSABLE_ENTITY,
                        "errorMessage": "Please enter valid email to login!"
                    },
                    "response": None
                }
                return Response(response, status=status.HTTP_422_UNPROCESSABLE_ENTITY)

            if not password:
                response = {
                    "error": {
                        "errorCode": 503,
                        "statusCode": status.HTTP_422_UNPROCESSABLE_ENTITY,
                        "errorMessage": "Please enter password to login!"
                    },
                    "response": None
                }
                return Response(response, status=status.HTTP_422_UNPROCESSABLE_ENTITY)
            if userTypeId != 1 and userTypeId != 2:
                response = {
                    "error": {
                        "errorCode": 505,
                        "statusCode": status.HTTP_401_UNAUTHORIZED,
                        "errorMessage": "Cross application login is prohibited!"
                    },
                    "response": None
                }
                return Response(response, status=status.HTTP_401_UNAUTHORIZED)

        
            user = User.objects.filter(
                Q(email=email) & Q(userType=userTypeId)).first()
            if user is None:
                response = {
                    "error": {
                        "errorCode": 504,
                        "statusCode": status.HTTP_404_NOT_FOUND,
                        "errorMessage": "User not found!"
                    },
                    "response": None
                }
                return Response(response, status=status.HTTP_404_NOT_FOUND)

            if not user.check_password(request.data['password']):
                response = {
                    "error": {
                        "errorCode": 506,
                        "statusCode": status.HTTP_401_UNAUTHORIZED,
                        "errorMessage": "Please enter your correct password!"
                    },
                    "response": None
                }
                return Response(response, status=status.HTTP_401_UNAUTHORIZED)

            update_last_login(None, user)

            refresh = RefreshToken.for_user(user)
            data = {
                "userId": user.id,
                "fullName": user.fullName,
                "token": str(refresh.access_token),
                "refreshToken": str(refresh),
            }

            response = {
                "error": None,
                "response": {
                    "userResponseData": data,
                    "message": {
                        'success': True,
                        "successCode": 102,
                        "statusCode": status.HTTP_200_OK,
                        "successMessage": "Logged in successfully."
                    }
                }
            }
            return Response(response, status=status.HTTP_200_OK)
        except Exception as exception:
            response = {
                "error": {
                    "errorCode": 511,
                    "statusCode": status.HTTP_400_BAD_REQUEST,
                    "errorMessage": str(exception)
                },
                "response": None
            }
            return Response(response, status=status.HTTP_400_BAD_REQUEST)
        

class MarkAttendence(UpdateAPIView):
    permission_classes = (IsAuthenticated,)

    def post(self, request):
        try:
            user = User.objects.filter(id=request.user.id).first()
            pythonData = JSONParser().parse(io.BytesIO(request.body))
            studentId = pythonData.get(
                'studentId', False)
            courceId = pythonData.get(
                'courceId', False)
            present = pythonData.get("present",False)
            if not courceId and not studentId:
                response = {
                    "error": {
                        "errorCode": 500,
                        "statusCode": status.HTTP_404_NOT_FOUND,
                        "errorMessage": "CourceId and studentId not found!"
                    },
                    "response": None
                }
                return Response(response, status=status.HTTP_401_UNAUTHORIZED)
            if not Cource.objects.filter(id=courceId).first() and not User.objects.filter(id=studentId,userType=1).first():
                response = {
                    "error": {
                        "errorCode": 500,
                        "statusCode": status.HTTP_404_NOT_FOUND,
                        "errorMessage": "invalid CourceId and studentId!"
                    },
                    "response": None
                }
                return Response(response, status=status.HTTP_401_UNAUTHORIZED)

            if user.userType !=2:
                response = {
                    "error": {
                        "errorCode": 501,
                        "statusCode": status.HTTP_401_UNAUTHORIZED,
                        "errorMessage": "Invalid user!"
                    },
                    "response": None
                }
                return Response(response, status=status.HTTP_401_UNAUTHORIZED)
            print("hhhhhhhhhhhhhhhhhhhhhh")
            log = AttendenceLog.objects.create(courceId=Cource.objects.filter(id=courceId).first(),studentId=User.objects.filter(id=studentId,userType=1).first(),submittedBy=user.email,present=present)

            response = {
                "error": None,
                "response": {
                    "message": {
                        'success': True,
                        "successCode": 201,
                        "statusCode": status.HTTP_201_CREATED,
                        "successMessage": "attendence marked Successfully"
                    }
                }
            }
            status_code = status.HTTP_201_CREATED
            return Response(response, status=status_code)

        except Exception as e:
            status_code = status.HTTP_400_BAD_REQUEST
            response = {
                "error": {
                    "errorCode": 522,
                    "statusCode": status.HTTP_400_BAD_REQUEST,
                    "errorMessage": str(e)
                },
                "response": None
            }
            return Response(response, status=status_code)