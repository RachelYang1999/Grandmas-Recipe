from upload.models import Upload_profile, Upload_recipe, Upload_comment_meta
from rest_framework import serializers



class UploadSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Upload_profile
        fields = ('id', 'user_id', 'profile_image')

class UploadSerializer_recipe(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Upload_recipe
        fields = ('id', 'recipe','step_id', 'recipe_image')

class UploadSerializer_commentmeta(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Upload_comment_meta
        fields = ('id', 'comment_id', 'comment_image')