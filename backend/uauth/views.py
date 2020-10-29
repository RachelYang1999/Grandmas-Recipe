import uuid

from uauth.auth import UserAuth
from uauth.constants import HTTP_ACTION_REGISTER, HTTP_ACTION_LOGIN
from uauth.models import User
from uauth.permissions import IsSuperUser
from uauth.serializers import UserSerializer

from django.core.cache import cache

from rest_framework import status, exceptions
from rest_framework.generics import ListCreateAPIView
from rest_framework.response import Response

from app_3609.settings import SUPER_USER

class User_auth(ListCreateAPIView):
    serializer_class = UserSerializer
    queryset = User.objects.all()
    authentication_classes = (UserAuth,)
    permission_classes = (IsSuperUser,)

    # def get(self, request, *args, **kwargs):
    #     if isinstance(request.user, User):
    #         return self.list(request, *args, **kwargs)
    #     else:
    #         raise exceptions.NotAcceptable

    def post(self, request, *args, **kwargs):
        action = request.query_params.get('action')

        if action == HTTP_ACTION_REGISTER:
            return self.create(request, *args, **kwargs)

        elif action == HTTP_ACTION_LOGIN:
            u_name = request.data.get('u_name')
            u_password = request.data.get('u_password')
            try:
                user = User.objects.get(u_name=u_name)
                if cache.get(user.id)==None:
                    if user.u_password == u_password:

                        token = "${}$".format(user.id)+uuid.uuid4().hex

                        cache.set(user.id,token,timeout=3600)
                        data = {
                            'msg': 'success',
                            'status': 200,
                            'token': token,
                        }
                        return Response(data)
                    else:
                        raise exceptions.AuthenticationFailed
                else:
                    data = {
                            'msg': 'success',
                            'status': 200,
                            'token': cache.get(user.id),
                        }
                    return Response(data)

            except User.DoesNotExist:
                raise exceptions.NotFound
        else:
            raise exceptions.ValidationError

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)

        data = serializer.data
        u_name = data.get("u_name")

        if u_name in SUPER_USER:
            u_id = data.get('id')
            user = User.objects.get(pk=u_id)
            user.is_super = True
            user.save()
            data.update({'is_super': 'True'})
        headers = self.get_success_headers(serializer.data)
        return Response(data, status=status.HTTP_201_CREATED, headers=headers)

class UserAPIView(ListCreateAPIView):
    serializer_class = UserSerializer
    queryset = User.objects.all()

