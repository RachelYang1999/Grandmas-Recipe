from uauth.auth import UserAuth
from user.models import User,User_follow

from django.core.cache import cache

from rest_framework import status, exceptions
from rest_framework.views import APIView
from rest_framework.response import Response

HTTP_ACTION_FOLLOWER = "follower"
HTTP_ACTION_FOLLOWING = "following"

class Follow_view(APIView):
    queryset = User.objects.all()
    authentication_classes = (UserAuth,)

    def get(self, request, *args, **kwargs):
        action = request.query_params.get('action')
        if action == HTTP_ACTION_FOLLOWER:
            pass
        elif action == HTTP_ACTION_FOLLOWING:
            pass
        else:
            raise exceptions.ValidationError
        return Response("success")


    def post(self, request, *args, **kwargs):
        from_user = request.data.get('from_user')
        to_user = request.data.get('to_user')
        
        try:
            User_follow.objects.get(from_user=from_user,to_user=to_user)
            raise exceptions.ValidationError("user follow exist")
        except User_follow.DoesNotExist:
            from_user_obj=User.objects.get(id=from_user)
            from_user_obj.total_following=from_user_obj.total_following+1
            from_user_obj.save()
            to_user_obj=User.objects.get(id=to_user)
            to_user_obj.total_follower=to_user_obj.total_follower+1
            to_user_obj.save()
            follow=User_follow.objects.create(from_user=from_user_obj,to_user=to_user_obj)
            follow.save()

        data = {
                'msg': 'success',
            }
        return Response(data,status=201)

    

        


