from django.test import TestCase
from rest_framework.test import APIRequestFactory,force_authenticate
from unittest.mock import patch
from django.core.management import call_command
from django.test import Client

from comments.models import Comment
from recipe.models import Recipe
from user.models import User
from comments.views import Comment_view
from uauth.views import User_auth

# Create your tests here.

class CommentTest(TestCase):

    #     comment_content = models.CharField(max_length=500)
    # comment_publish_date = models.DateTimeField(auto_now_add=True)
    # comment_recipe = models.ForeignKey(Recipe, related_name='referenceRecipe',on_delete=models.CASCADE,default=1)
    # comment_user = models.ForeignKey(User, related_name='referenceUser',on_delete=models.CASCADE,default=1)

    def setUp(self):
        call_command("loaddata", "test_data.json",verbosity=0)
        self.factory = APIRequestFactory()

        Recipe.objects.create(\
            recipe_title = "pasta",\
                description = "It is really easy to learn",\
                    is_published = 1,\
                        user = User.objects.get(id = 1)
            )

    def test_comment_model(self):
        recipe = Recipe.objects.get(id = 1)
        user = User.objects.get(id = 1)

        Comment.objects.create(comment_content = "Nice!", comment_recipe = recipe, comment_user = user)
        comment = Comment.objects.get(id = 1)
        self.assertEqual(comment.comment_content, "Nice!")
        self.assertEqual(comment.comment_recipe.id, 1)
        self.assertEqual(comment.comment_user.id, 1)

    def test_post_comment_without_login(self):
        """Test post without auth"""
        url = "/api/comments/"      
        request = self.factory.post(url, {"comment_content":"root", "recipe_id": 1})
        view = Comment_view.as_view()
        response = view(request)
        self.assertEqual(response.status_code, 403)

    def test_post_comment_success(self):
        """Test post after logging in"""
        login_url = "/api/auth/"      
        login_request = self.factory.post(login_url,{"username":"root","password":"root"})
        login_view = User_auth.as_view()
        login_response = login_view(login_request)
        self.token = login_response.data["data"]["token"]

        user = User.objects.get(id=1)

        comment_url = "/api/comments/"      
        comment_request = self.factory.post(comment_url, {"comment_content": "Not bad", "recipe_id": "1"})
        force_authenticate(comment_request, user=user)
        comment_view = Comment_view.as_view()
        comment_response = comment_view(comment_request)
        self.assertEqual(comment_response.status_code, 200)
        







    

        
