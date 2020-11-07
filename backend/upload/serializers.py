from upload.models import Upload_profile, Upload_recipe
from rest_framework import serializers



class UploadSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Upload_profile
        fields = ('id', 'user_id', 'profile_image')

class UploadSerializer_recipe(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Upload_recipe
        fields = ('id', 'recipe_id','step_id', 'recipe_image')