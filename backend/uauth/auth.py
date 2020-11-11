
from user.models import User
from django.core.cache import cache
from rest_framework.authentication import BaseAuthentication
from rest_framework import exceptions


class UserAuth(BaseAuthentication):

    def authenticate(self, request):
        if request.method == 'GET' or request.method == 'POST':
            
            try:
                token = request.META.get('HTTP_TOKEN')
                print(token)
                user_id=token.split("$")[1]
                cache_toke = cache.get(user_id)
                if cache_toke==token:
                    user = User.objects.get(pk=user_id)
                    return user, token
                else:
                    raise exceptions.AuthenticationFailed()
            except:
                raise exceptions.AuthenticationFailed({"msg": "invalid"})

class UserAuth_Auth(BaseAuthentication):

    def authenticate(self, request):
        if request.method == 'GET':
            
            try:
                token = request.META.get('HTTP_TOKEN')
                print(token)
                user_id=token.split("$")[1]
                cache_toke = cache.get(user_id)
                if cache_toke==token:
                    user = User.objects.get(pk=user_id)
                    return user, token
                else:
                    raise exceptions.AuthenticationFailed()
            except:
                raise exceptions.AuthenticationFailed({"msg": "invalid"})