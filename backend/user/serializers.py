from user.models import User_follow
from rest_framework import serializers


class UserFollowSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = User_follow
        fields = ('id', 'from_user_id', 'to_user_id')
