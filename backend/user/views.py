from uauth.auth import UserAuth
from user.models import User, User_follow

from django.core.cache import cache

from rest_framework import status, exceptions
from rest_framework.views import APIView
from rest_framework.response import Response

import app_3609.util as util


class Follow_view(APIView):

    authentication_classes = (UserAuth,)

    def get(self, request, *args, **kwargs):
        
        try:
            user = request.user
        except User_follow.DoesNotExist:
            return Response(util.get_response(400,"user not exist",None))

        data = {
            "follower": user.total_follower,
            "following": user.total_following
        }

        rst=util.get_response(100,"success",data)

        return Response(rst)

    def post(self, request, *args, **kwargs):
        from_user = request.data.get('from_user')
        to_user = request.data.get('to_user')

        try:
            User_follow.objects.get(from_user=from_user, to_user=to_user)
            return Response(util.get_response(400,"user follow exist",None))
        except User_follow.DoesNotExist:
            from_user_obj = User.objects.get(id=from_user)
            from_user_obj.total_following = from_user_obj.total_following+1
            from_user_obj.save()
            to_user_obj = User.objects.get(id=to_user)
            to_user_obj.total_follower = to_user_obj.total_follower+1
            to_user_obj.save()
            follow = User_follow.objects.create(from_user=from_user_obj, to_user=to_user_obj)
            follow.save()

        rst=util.get_response(100,"success",None)
        return Response(rst)
