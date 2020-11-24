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
        user_id = request.query_params.get("userid")

        try:
            user=User.objects.get(id=user_id)
        except:
            user = request.user

        following=[]
        for u in User_follow.objects.filter(from_user=user).values():
            temp={}
            temp["to_user_id"]=u["to_user_id"]
            temp["to_user_name"]=User.objects.get(id=u["to_user_id"]).username
            temp["to_user_avatar"]=User.objects.filter(id=u["to_user_id"]).values()[0]["profile_image"]
            following.append(temp)

        follower=[]
        for u in User_follow.objects.filter(to_user=user).values():
            temp={}
            temp["from_user_id"]=u["from_user_id"]
            temp["from_user_name"]=User.objects.get(id=u["from_user_id"]).username
            temp["from_user_avatar"]=User.objects.filter(id=u["from_user_id"]).values()[0]["profile_image"]
            follower.append(temp)

        data = {
            "follower": len(follower),
            "follower_data": follower,
            "following": len(following),
            "following_data": following 
        }

        rst=util.get_response(100,"success",data)

        return Response(rst)

    def post(self, request, *args, **kwargs):
        from_user_obj = request.user
        to_user = request.data.get('to_user')

        try:
            User_follow.objects.get(from_user=from_user_obj, to_user=User.objects.get(id=to_user))
            return Response(util.get_response(400,"user follow exist",None))
        except User_follow.DoesNotExist:
            from_user_obj.total_following = from_user_obj.total_following+1
            from_user_obj.save()
            to_user_obj = User.objects.get(id=to_user)
            to_user_obj.total_follower = to_user_obj.total_follower+1
            to_user_obj.save()
            follow = User_follow.objects.create(from_user=from_user_obj, to_user=to_user_obj)
            follow.save()

        rst=util.get_response(100,"success",None)
        return Response(rst)

    def delete(self, request, *args, **kwargs):
        from_user_obj = request.user
        to_user = request.data.get('to_user')

        try:
            User_follow.objects.get(from_user=from_user_obj.id, to_user=to_user).delete()
        except User_follow.DoesNotExist:
            return Response(util.get_response(400,"user follow not exist",None))

        rst=util.get_response(100,"success",None)
        return Response(rst)
