import uuid

from uauth.auth import UserAuth_Auth
from user.models import User
# from uauth.permissions import IsSuperUser
from uauth.serializers import UserSerializer
from upload.models import Upload_profile

from django.core.cache import cache

from rest_framework import status, exceptions
from rest_framework.views import APIView
from rest_framework.response import Response

import app_3609.util as util

HTTP_ACTION_REGISTER = "signup"
HTTP_ACTION_LOGIN = "signin"
HTTP_ACTION_LOGOUT = "signout"

class User_auth(APIView):

    authentication_classes = (UserAuth_Auth,)

    def get(self, request, *args, **kwargs):
        
        data = {"username": request.user.username,"avatar":Upload_profile.objects.filter(user=request.user).values()[0]["profile_image"]}
        rst=util.get_response(200,"success",data)
        return Response(rst)

    # def post(self, request, *args, **kwargs):
    #     action = request.query_params.get('action')

    #     if action == HTTP_ACTION_REGISTER:
    #         return self.register(request, *args, **kwargs)
    #     elif action == HTTP_ACTION_LOGIN:
    #         return self.login(request, *args, **kwargs)
    #     elif action == HTTP_ACTION_LOGOUT:
    #         return self.logout(request, *args, **kwargs)
    #     else:
    #         return Response(util.get_response(400,"action not exist",[]))

    def delete(self, request, *args, **kwargs):
        token = request.META.get('HTTP_TOKEN')
        u_id=token.split("$")[1]
        if token==cache.get(u_id):
            cache.delete(u_id)
            rst=util.get_response(200,"success",[])
        else:
            rst=util.get_response(400,"not logged in",[])
            
        return Response(rst)


    def post(self, request, *args, **kwargs):
        u_name = request.data.get('username')
        u_password = request.data.get('password')
        try:
            user = User.objects.get(username=u_name)

            data = {
                    'token': "",
                }
            if cache.get(user.id)==None:
                if user.password == util.create_md5(u_password,user.salt):

                    token = "${}$".format(user.id)+uuid.uuid4().hex

                    cache.set(user.id,token,timeout=3600)
                    data['token']=token

                    rst=util.get_response(200,"success",data)
                    
                    return Response(rst)
                else:
                    rst=util.get_response(400,"username or password not correct",[])
                    return Response(rst)
            else:
                if user.password == util.create_md5(u_password,user.salt):
                    data['token']=cache.get(user.id)
                    rst=util.get_response(200,"success",data)
                    return Response(rst)
                else:
                    rst=util.get_response(400,"username or password not correct",[])
                    return Response(rst)

        except User.DoesNotExist:
            raise exceptions.NotFound

    def put(self, request, *args, **kwargs):
        username = request.data.get('username')
        password = request.data.get('password')
        salt = util.create_salt()
        password =util.create_md5(password,salt)
        
        try:
            user = User.objects.get(username=username)
            rst=util.get_response(400,"username exists",[])
            return Response(rst)
        except User.DoesNotExist:
            user=User.objects.create(username=username,password=password,salt=salt)
            upload=Upload_profile.objects.create(user=user)

        rst=util.get_response(200,"success",[])
        return Response(rst)


