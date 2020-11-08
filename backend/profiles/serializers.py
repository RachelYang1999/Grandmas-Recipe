from user.models import User
from rest_framework import serializers


class ProfileSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = ('id','email', 'introduction','gender', 'date_of_birth')
