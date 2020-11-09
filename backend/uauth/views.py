import uuid

from uauth.auth import UserAuth_login
from user.models import User
# from uauth.permissions import IsSuperUser
from uauth.serializers import UserSerializer

from django.core.cache import cache

from rest_framework import status, exceptions
from rest_framework.views import APIView
from rest_framework.response import Response

import app_3609.util as util

HTTP_ACTION_REGISTER = "signup"
HTTP_ACTION_LOGIN = "signin"
HTTP_ACTION_LOGOUT = "signout"

class User_auth(APIView):
    serializer_class = UserSerializer
    queryset = User.objects.all()
    authentication_classes = (UserAuth_login,)
    # permission_classes = (IsSuperUser,)

    def get(self, request, *args, **kwargs):
        data = {'msg': 'success',}
        return Response(data,status=200)

    def post(self, request, *args, **kwargs):
        action = request.query_params.get('action')

        if action == HTTP_ACTION_REGISTER:
            return self.register(request, *args, **kwargs)
        elif action == HTTP_ACTION_LOGIN:
            return self.login(request, *args, **kwargs)
        elif action == HTTP_ACTION_LOGOUT:
            return self.logout(request, *args, **kwargs)
        else:
            raise exceptions.ValidationError

    def logout(self, request, *args, **kwargs):
        token = request.data.get('token')
        u_id=token.split("$")[1]
        data = {
                'msg': '',
            }
        if token==cache.get(u_id):
            cache.delete(u_id)
            data['msg']="success"
        else:
            data['msg']="fail"
            
        return Response(data,status=201)


    def login(self, request, *args, **kwargs):
        u_name = request.data.get('username')
        u_password = request.data.get('password')
        try:
            user = User.objects.get(username=u_name)

            data = {
                    'msg': 'success',
                    'token': "",
                }
            if cache.get(user.id)==None:
                if user.password == util.create_md5(u_password,user.salt):

                    token = "${}$".format(user.id)+uuid.uuid4().hex

                    cache.set(user.id,token,timeout=3600)
                    data['token']=token
                    
                    return Response(data,status=200)
                else:
                    raise exceptions.AuthenticationFailed
            else:
                if user.password == util.create_md5(u_password,user.salt):
                    data['token']=cache.get(user.id)
                    return Response(data)
                else:
                    raise exceptions.AuthenticationFailed

        except User.DoesNotExist:
            raise exceptions.NotFound

    def register(self, request, *args, **kwargs):
        username = request.data.get('username')
        password = request.data.get('password')
        salt = util.create_salt()
        password =util.create_md5(password,salt)
        
        try:
            user = User.objects.get(username=username)
            raise exceptions.ValidationError("username exist")
        except User.DoesNotExist:
            user=User.objects.create(username=username,password=password,salt=salt)

        data = {
                'msg': 'success',
            }
        return Response(data,status=201)


