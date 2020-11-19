import uuid

from uauth.auth import UserAuth_Auth,UserAuth
from user.models import User
# from upload.models import Upload_profile

from django.core.cache import cache

from rest_framework import status, exceptions
from rest_framework.views import APIView
from rest_framework.response import Response

import app_3609.util as util

from django.core.mail import send_mail
 
class User_auth(APIView):

    authentication_classes = (UserAuth_Auth,)

    def get(self, request, *args, **kwargs):
        
        data = {"username": request.user.username,"avatar":User.objects.filter(id=request.user.id).values()[0]["profile_image"]}
        rst=util.get_response(100,"success",data)
        return Response(rst)

    def delete(self, request, *args, **kwargs):
        token = request.META.get('HTTP_TOKEN')
        u_id=token.split("$")[1]
        if token==cache.get(u_id):
            cache.delete(u_id)
            rst=util.get_response(100,"success",None)
        else:
            rst=util.get_response(400,"not logged in",None)
            
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

                    cache.set(user.id,token,timeout=36000)
                    data['token']=token

                    rst=util.get_response(100,"success",data)
                    
                    return Response(rst)
                else:
                    rst=util.get_response(400,"username or password not correct",None)
                    return Response(rst)
            else:
                if user.password == util.create_md5(u_password,user.salt):
                    data['token']=cache.get(user.id)
                    rst=util.get_response(100,"success",data)
                    return Response(rst)
                else:
                    rst=util.get_response(400,"username or password not correct",None)
                    return Response(rst)
        except User.DoesNotExist:
            rst=util.get_response(400,"username or password not correct",None)
            return Response(rst)

    def put(self, request, *args, **kwargs):
        username = request.data.get('username')
        password = request.data.get('password')
        email = request.data.get('email')

        salt = util.create_salt()
        password =util.create_md5(password,salt)
        
        try:
            user = User.objects.get(username=username)
            rst=util.get_response(400,"username exists",None)
            return Response(rst)
        except User.DoesNotExist:
            user=User.objects.create(username=username,password=password,salt=salt)

        user.email=email
        user.save()

        send_mail('Success', 'Thank you cor your sign up', 'no-reply@grandmasrecipe.com',[email], fail_silently=False)
        
        rst=util.get_response(100,"success",None)

        return Response(rst)

class User_pass(APIView):

    authentication_classes = (UserAuth,)

    def post(self, request, *args, **kwargs):
        user=request.user
        
        old_password = request.data.get('old-password')
        new_password = request.data.get('new-password')

        if user.password == util.create_md5(old_password,user.salt):
            salt=util.create_salt()
            user.salt=salt
            user.password=util.create_md5(new_password,salt)
            user.save()

            rst=util.get_response(100,"success",None)
            return Response(rst)
        else:
            rst=util.get_response(400,"old password not correct",None)
            return Response(rst)


class User_se_pass(APIView):

    def post(self, request, *args, **kwargs):
        
        email = request.data.get('email')

        try:
            code = util.create_salt()
            user=User.objects.get(email=email)
            cache.set(code,user.id,timeout=3600)

            send_mail('Code', code, 'no-reply@grandmasrecipe.com',[email], fail_silently=False)

            rst=util.get_response(100,"success",None)
            return Response(rst)
        except:
            rst=util.get_response(400,"user not exists",None)
            
            return Response(rst)


class User_for_pass(APIView):

    def post(self, request, *args, **kwargs):
        
        code = request.data.get('code')
        new_password = request.data.get('new-password')

        print(code)

        try:
            uid=cache.get(code)
            cache.delete(code)

            user=User.objects.get(id=uid)

            salt=util.create_salt()
            user.salt=salt
            user.password=util.create_md5(new_password,salt)

            user.save()

            rst=util.get_response(100,"success",None)
            return Response(rst)
        except Exception as e:
            print(e)

            rst=util.get_response(400,"user not exists",None)
            return Response(rst)

        



