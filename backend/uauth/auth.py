from uauth.models import User
from django.core.cache import cache
from rest_framework.authentication import BaseAuthentication


class UserAuth(BaseAuthentication):

    def authenticate(self, request):
        if request.method == 'GET':
            token = request.data.get('token')
            user_id=token.split("$")[1]
            try:
                cache_toke = cache.get(user_id)
                if cache_toke==token:
                    user = User.objects.get(pk=user_id)
                    return user, token
                else:
                    return
            except:
                return