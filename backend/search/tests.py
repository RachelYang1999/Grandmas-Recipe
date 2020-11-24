from django.test import TestCase

from rest_framework.test import APIRequestFactory,force_authenticate
from unittest.mock import patch
from django.core.management import call_command
from django.test import Client

from recipe.models import Recipe
from user.models import User
from category.models import Category
from uauth.views import User_auth
from search.views import Search
from search.views import Search_user

from datetime import datetime, date

# Create your tests here.

class SearchTest(TestCase):

    def setUp(self):
        call_command("loaddata", "test_data.json",verbosity=0)
        self.factory = APIRequestFactory()
    
    # def test_get_search_category(self):
        
    #     # get status code
    #     search_category_url = "/api/search/"      
    #     search_category_request = self.factory.get(search_category_url, {"category":"Lunch"})
    #     search_category_view = Search.as_view()
    #     search_category_response = search_category_view(search_category_request)
    #     self.assertEqual(search_category_response.status_code, 200)

    #     # get msg
    #     self.assertEqual(search_category_response.data['code'], 100)
    #     self.assertEqual(search_category_response.data['msg'], "success")

    #     # get data
    #     expected_data = 
    
    #         [
    #             {
    #                 "id": 2,
    #                 "title": "Zesty Quinoa Salad",
    #                 "description": "This bright and colorful salad is a great summertime recipe (or anytime you want to feel like it's summertime). Light and citrusy, it's a whole new way to enjoy quinoa. Lime juice and cilantro give a refreshing kick, while quinoa and black beans provide tasty vegan protein. If you're not vegan, add even more protein by adding chunks of chicken or turkey. Yum!",
    #                 "update_date": "2020-11-19",
    #                 "recipe_src": "intro_image/Picture_1_Dgnsry1.png"
    #             },
    #             {
    #                 "id": 3,
    #                 "title": "naozi",
    #                 "description": "haochi",
    #                 "update_date": "2020-11-19",
    #                 "recipe_src": "intro_image/2020-05-22-Scene_0iqQ2Lx.png"
    #             },
    #             {
    #                 "id": 6,
    #                 "title": "advsd",
    #                 "description": "casca",
    #                 "update_date": "2020-11-19",
    #                 "recipe_src": "intro_image/ttt.jpg"
    #             },
    #             {
    #                 "id": 7,
    #                 "title": "Barbie's Tuna Salad",
    #                 "description": "This is a really great tuna salad recipe I got from a friend who used it in her catering service business many years ago. The secret ingredients are the curry and Parmesan cheese! Odd combinations but this makes a terrific tuna sandwich! She used it for an appetizer with gourmet crackers and people always wanted her recipe. I have never tasted another tuna salad quite like this one, and it has been my favorite recipe for tuna salad for many, many years.",
    #                 "update_date": "2020-11-19",
    #                 "recipe_src": "intro_image/Picture_1_HkIfIgR.png"
    #             },
    #             {
    #                 "id": 8,
    #                 "title": "Banana Pancakes",
    #                 "description": "231231ras",
    #                 "update_date": "2020-11-19",
    #                 "recipe_src": "intro_image/sm1.png"
    #             },
    #             {
    #                 "id": 11,
    #                 "title": "Slow Cooked Corned Beef for Sandwiches",
    #                 "description": "This is an excellent recipe for party sandwiches. I always make 2 (and sometimes 3) briskets because it goes so fast. The meat should cook slowly for a minimum of 4 hours--cooking longer will just make it more tender. It sounds like a LOT of garlic, but no one has ever complained that it tasted too garlicky. Serve with brown mustard on rye or kaiser rolls. Can also add cole slaw to the sandwich for a uniquely delicious sandwich.",
    #                 "update_date": "2020-11-19",
    #                 "recipe_src": "intro_image/Picture_1_uJwpf5U.png"
    #             },
    #             {
    #                 "id": 34,
    #                 "title": "Overnight Blueberry French Toast",
    #                 "description": "This is a very unique breakfast dish. Good for any holiday breakfast or brunch, it's filled with the fresh taste of blueberries, and covered with a rich blueberry sauce to make it a one of a kind.",
    #                 "update_date": "2020-11-19",
    #                 "recipe_src": "intro_image/test.jpeg"
    #             },
    #             {
    #                 "id": 35,
    #                 "title": "11",
    #                 "description": "221",
    #                 "update_date": "2020-11-19",
    #                 "recipe_src": "intro_image/default.png"
    #             },
    #             {
    #                 "id": 37,
    #                 "title": "qwdqw",
    #                 "description": "qwdq",
    #                 "update_date": "2020-11-19",
    #                 "recipe_src": "intro_image/ttt_lvuBhye.jpg"
    #             },
    #             {
    #                 "id": 38,
    #                 "title": " Potato Dauphinoise",
    #                 "description": "This crispy, creamy gratin is so indulgently good it might upstage your main. Try our step-by-step guide for an indulgent potato dauphinoise dish, the ideal side-dish treat - easy to make and delicious to eat – you’ll love this creamy, layered potato dish. Don't forget to screenshot the ingredients list at the bottom of the page to take in store.",
    #                 "update_date": "2020-11-20",
    #                 "recipe_src": "intro_image/Xnip2020-11-20_01-00-32.jpg"
    #             },
    #             {
    #                 "id": 39,
    #                 "title": "Easy Quiche",
    #                 "description": "This is an easy mix-it-up-in-one-bowl-and-cook recipe. I make it for every brunch I attend. You may substitute chopped spinach for the broccoli if you wish.\n\n",
    #                 "update_date": "2020-11-20",
    #                 "recipe_src": "intro_image/dt.png"
    #             },
    #             {
    #                 "id": 40,
    #                 "title": "Shrimp Scampi with Pasta",
    #                 "description": "Well-rounded seafood and pasta dish. Good with any pasta; angel hair is less filling.",
    #                 "update_date": "2020-11-20",
    #                 "recipe_src": "intro_image/Xnip2020-11-20_01-52-19.jpg"
    #             },
    #             {
    #                 "id": 42,
    #                 "title": "Mackerel Fishcakes",
    #                 "description": "Make a batch of these wallet-friendly smoked mackerel fishcakes for a simple family dinner using just 3-ingredients. Batch cook and freeze the rest for an easy last-minute meal another day – there’s a handy ingredients list at the bottom of the page for everything you need.",
    #                 "update_date": "2020-11-20",
    #                 "recipe_src": "intro_image/Xnip2020-11-20_01-29-08.jpg"
    #             },
    #             {
    #                 "id": 43,
    #                 "title": "Iced Buns",
    #                 "description": "Iced buns: a retro bake that’s just the right mix of sweet and savoury. With a little bit of help, older kids will love owning this baking project – just make sure they remember to share the finished product!",
    #                 "update_date": "2020-11-20",
    #                 "recipe_src": "intro_image/Xnip2020-11-20_01-35-28.jpg"
    #             },
    #             {
    #                 "id": 44,
    #                 "title": "Iced Buns",
    #                 "description": "Iced buns: a retro bake that’s just the right mix of sweet and savoury. With a little bit of help, older kids will love owning this baking project – just make sure they remember to share the finished product!",
    #                 "update_date": "2020-11-20",
    #                 "recipe_src": "intro_image/Xnip2020-11-20_01-35-28_dlbWv7T.jpg"
    #             },
    #             {
    #                 "id": 48,
    #                 "title": "Roasted cauliflower and fennel salad",
    #                 "description": "A seasonal salad that's easy to make and packed full of flavour. Spice it up with rocket and curry-roasted cauliflower, then scatter with sultanas to serve",
    #                 "update_date": "2020-11-20",
    #                 "recipe_src": "intro_image/default.png"
    #             },
    #             {
    #                 "id": 49,
    #                 "title": "BBQ Chicken Loaded Sweet Potatoes",
    #                 "description": "Swap a plain jacket potato for these loaded BBQ chicken sweet potatoes, made with just 3 ingredients. Shredded chicken thighs and tangy BBQ sauce are loaded into roasted sweet potatoes for an easy, budget-friendly family dinner. Plus, you can make enough for 6 and freeze for another time. There’s a handy ingredients list at the bottom of the page for everything you need.",
    #                 "update_date": "2020-11-20",
    #                 "recipe_src": "intro_image/Xnip2020-11-20_02-04-54.jpg"
    #             },
    #             {
    #                 "id": 50,
    #                 "title": "Chilli Bean and Squash Pot Pies",
    #                 "description": "Take the hassle out of family dinners with these easy veggie pot pies that are made with just three ingredients. Full of spiced mixed beans and soft roasted squash, there's hardly any prep and what's more, you can freeze them ahead for another time. There’s a handy ingredients list at the bottom of the page for everything you need.",
    #                 "update_date": "2020-11-20",
    #                 "recipe_src": "intro_image/Xnip2020-11-20_02-10-12.jpg"
    #             },
    #             {
    #                 "id": 54,
    #                 "title": "Harissa Lamb Chops",
    #                 "description": "Bring some North African spice to your next barbecue with these quick and easy lamb chops. Simply marinate with harissa paste while you preheat the barbecue, then grill and serve on top of cool, creamy tzatziki. There’s a handy ingredients list at the bottom of the page for everything you need.",
    #                 "update_date": "2020-11-20",
    #                 "recipe_src": "intro_image/Xnip2020-11-20_02-30-23.jpg"
    #             },
    #             {
    #                 "id": 56,
    #                 "title": " Arancini",
    #                 "description": "Arancini are an Italian street food star made with sticky balls of risotto filled with gooey mozzarella and lightly fried until crisp and golden. Traditionally served with a rich tomato sauce, they make a satisfying snack any time. Whether you're starting from scratch or using up leftover risotto, master this delicious dish in just six steps with our simple arancini recipe.",
    #                 "update_date": "2020-11-20",
    #                 "recipe_src": "intro_image/Xnip2020-11-20_02-41-59.jpg"
    #             },
    #             {
    #                 "id": 58,
    #                 "title": "Gnocchi",
    #                 "description": "Soft, doughy gnocchi is a real Italian classic. Making your own is easier than you think – our simple gnocchi recipe shows you how to transform Desiree potatoes into moreish mini dumplings served in a gorgeous sage-infused butter.\n\n",
    #                 "update_date": "2020-11-20",
    #                 "recipe_src": "intro_image/Xnip2020-11-20_02-55-27.jpg"
    #             },
    #             {
    #                 "id": 59,
    #                 "title": "Pork Dumplings",
    #                 "description": "It may seem like a challenge, but making your own dumplings is really simple with our easy step-by-step recipe. Served with a homemade dipping sauce for an added kick, our easy pork dumpling recipe makes a flavoursome starter, sharing dish or canapé.",
    #                 "update_date": "2020-11-20",
    #                 "recipe_src": "intro_image/Xnip2020-11-20_03-03-35.jpg"
    #             },
    #             {
    #                 "id": 60,
    #                 "title": "Mini Porchetta",
    #                 "description": "A classic Italian recipe, porchetta is a succulent piece of pork stuffed with fresh herbs, rolled and then roasted until gorgeously golden and crisp. Our mini porchetta uses a smaller cut of meat but is packed with the same big flavours – make it in just six simple steps with our easy recipe.",
    #                 "update_date": "2020-11-20",
    #                 "recipe_src": "intro_image/Xnip2020-11-20_03-13-40.jpg"
    #             },
    #             {
    #                 "id": 61,
    #                 "title": "Melt-in-the-middle Meatballs",
    #                 "description": "Take your homemade meatballs to a whole new level by loading them up with a wonderfully gooey, melt-in-the-middle mozzarella centre. Master these delicious meatballs in just six simple steps, and enjoy with classic spaghetti or piled into an American-style sub.",
    #                 "update_date": "2020-11-20",
    #                 "recipe_src": "intro_image/Xnip2020-11-20_03-19-28.jpg"
    #             },
    #             {
    #                 "id": 62,
    #                 "title": "hhh",
    #                 "description": "s",
    #                 "update_date": "2020-11-20",
    #                 "recipe_src": "intro_image/default.png"
    #             },
    #             {
    #                 "id": 63,
    #                 "title": "mmmm",
    #                 "description": "t",
    #                 "update_date": "2020-11-20",
    #                 "recipe_src": "intro_image/Netflix_Logo_Final.png"
    #             },
    #             {
    #                 "id": 71,
    #                 "title": "Barbecue a Whole Fish",
    #                 "description": "Mackerel, sea bass, sea bream, sardines and trout are all good cooked whole on the barbecue. Make sure the fish is scaled and gutted and the fins have been removed. Learn how to cook the delicious fruits of the sea with our easy guide.",
    #                 "update_date": "2020-11-20",
    #                 "recipe_src": "intro_image/Xnip2020-11-20_04-37-47.jpg"
    #             },
    #             {
    #                 "id": 72,
    #                 "title": "Marinate Chicken Breasts",
    #                 "description": "Maximise your marinating this summer and learn how to intensify the flavour of chicken breasts with our simple step-by-step guide.",
    #                 "update_date": "2020-11-20",
    #                 "recipe_src": "intro_image/Xnip2020-11-20_04-43-05.jpg"
    #             },
    #             {
    #                 "id": 73,
    #                 "title": "Moules Frites",
    #                 "description": "Moules frites is an absolute classic which really lets the flavour of fresh mussels shine and involves simply cooking in a buttery parsley and white wine sauce. This showstopping dish is surprisingly good value and a great introduction to cooking with mussels, so don't be daunted and learn how to make moules frites with our easy recipe and expert tips. There’s a handy ingredients list at the bottom of the page with everything you need.\n\n",
    #                 "update_date": "2020-11-20",
    #                 "recipe_src": "intro_image/Xnip2020-11-20_04-48-55.jpg"
    #             },
    #             {
    #                 "id": 81,
    #                 "title": "meat",
    #                 "description": "good",
    #                 "update_date": "2020-11-20",
    #                 "recipe_src": "intro_image/ttt_Sl3Fqtn.jpg"
    #             },
    #             {
    #                 "id": 83,
    #                 "title": "Meat",
    #                 "description": "good",
    #                 "update_date": "2020-11-20",
    #                 "recipe_src": "intro_image/test_ddlhJzC.jpeg"
    #             }
    #         ]


    #     self.assertEqual(search_category_response.data["data"], expected_data)
    

    # def test_get_search_title(self):

    #     # get status code
    #     search_title_url = "/api/search/"      
    #     search_title_request = self.factory.get(search_title_url, {"recipe_title":"potato"})
    #     search_title_view = Search.as_view()
    #     search_title_response = search_title_view(search_title_request)
    #     self.assertEqual(search_title_response.status_code, 200)

    #     # get msg
    #     self.assertEqual(search_title_response.data['code'], 100)
    #     self.assertEqual(search_title_response.data['msg'], "success")

    #     # get data
    #     expected_data = [

    #             {
    #                 "id": 38,
    #                 "title": " Potato Dauphinoise",
    #                 "description": "This crispy, creamy gratin is so indulgently good it might upstage your main. Try our step-by-step guide for an indulgent potato dauphinoise dish, the ideal side-dish treat - easy to make and delicious to eat – you’ll love this creamy, layered potato dish. Don't forget to screenshot the ingredients list at the bottom of the page to take in store.",
    #                 "update_date": "2020-11-20",
    #                 "recipe_src": "intro_image/Xnip2020-11-20_01-00-32.jpg"
    #             },
    #             {
    #                 "id": 49,
    #                 "title": "BBQ Chicken Loaded Sweet Potatoes",
    #                 "description": "Swap a plain jacket potato for these loaded BBQ chicken sweet potatoes, made with just 3 ingredients. Shredded chicken thighs and tangy BBQ sauce are loaded into roasted sweet potatoes for an easy, budget-friendly family dinner. Plus, you can make enough for 6 and freeze for another time. There’s a handy ingredients list at the bottom of the page for everything you need.",
    #                 "update_date": "2020-11-20",
    #                 "recipe_src": "intro_image/Xnip2020-11-20_02-04-54.jpg"
    #             },
    #             {
    #                 "id": 51,
    #                 "title": " Creamy Ham and Potato Casserole",
    #                 "description": "Winter comfort food just got easy with this 3-ingredient creamy ham and potato casserole. Perfect for feeding the family, make a big batch and freeze for future cold nights. There’s a handy ingredients list at the bottom of the page for everything you need, so remember to take a screenshot of the ingredients before heading to the shops.",
    #                 "update_date": "2020-11-20",
    #                 "recipe_src": "intro_image/Xnip2020-11-20_02-15-31.jpg"
    #             }
    #         ]

    #     self.assertEqual(search_title_response.data["data"], expected_data)


    def test_get_search_user(self):

        """Test get user recipe after logging in"""
        login_url = "/api/auth/"      
        login_request = self.factory.post(login_url,{"username":"root","password":"root"})
        login_view = User_auth.as_view()
        login_response = login_view(login_request)
        self.token = login_response.data["data"]["token"]

        user = User.objects.get(id=1)

        # get status code
        search_user_url = "/api/search_user/"      
        search_user_request = self.factory.get(search_user_url, {"id":1})
        force_authenticate(search_user_request, user=user)
        search_user_view = Search_user.as_view()
        search_user_response = search_user_view(search_user_request)
        self.assertEqual(search_user_response.status_code, 200)

        # get msg
        self.assertEqual(search_user_response.data['code'], 100)
        self.assertEqual(search_user_response.data['msg'], "success")

        # get data
        expected_data = [

                {
                    "recipe_id": 3,
                    "recipe_title": "naozi",
                    "recipe_description": "haochi",
                    "recipe_update_date": date(int(2020), int(11), int(19)),
                    "recipe_src": "intro_image/2020-05-22-Scene_0iqQ2Lx.png"
                },
                {
                    "recipe_id": 6,
                    "recipe_title": "advsd",
                    "recipe_description": "casca",
                    "recipe_update_date": date(int(2020), int(11), int(19)),
                    "recipe_src": "intro_image/ttt.jpg"
                },
                {
                    "recipe_id": 34,
                    "recipe_title": "Overnight Blueberry French Toast",
                    "recipe_description": "This is a very unique breakfast dish. Good for any holiday breakfast or brunch, it's filled with the fresh taste of blueberries, and covered with a rich blueberry sauce to make it a one of a kind.",
                    "recipe_update_date": date(int(2020), int(11), int(19)),
                    "recipe_src": "intro_image/test.jpeg"
                },
                {
                    "recipe_id": 35,
                    "recipe_title": "11",
                    "recipe_description": "221",
                    "recipe_update_date": date(int(2020), int(11), int(19)),
                    "recipe_src": "intro_image/default.png"
                },
                {
                    "recipe_id": 36,
                    "recipe_title": "131",
                    "recipe_description": "qwfqf",
                    "recipe_update_date": date(int(2020), int(11), int(19)),
                    "recipe_src": "intro_image/test_Qtwpz3b.jpeg"
                },
                {
                    "recipe_id": 37,
                    "recipe_title": "qwdqw",
                    "recipe_description": "qwdq",
                    "recipe_update_date": date(int(2020), int(11), int(19)),
                    "recipe_src": "intro_image/ttt_lvuBhye.jpg"
                },
                {
                    "recipe_id": 41,
                    "recipe_title": "111",
                    "recipe_description": "222",
                    "recipe_update_date": date(int(2020), int(11), int(20)),
                    "recipe_src": "intro_image/test_HArjKyH.jpeg"
                },
                {
                    "recipe_id": 62,
                    "recipe_title": "hhh",
                    "recipe_description": "s",
                    "recipe_update_date": date(int(2020), int(11), int(20)),
                    "recipe_src": "intro_image/default.png"
                },
                {
                    "recipe_id": 63,
                    "recipe_title": "mmmm",
                    "recipe_description": "t",
                    "recipe_update_date": date(int(2020), int(11), int(20)),
                    "recipe_src": "intro_image/Netflix_Logo_Final.png"
                },
                {
                    "recipe_id": 84,
                    "recipe_title": "qqq",
                    "recipe_description": "ddd",
                    "recipe_update_date": date(int(2020), int(11), int(24)),
                    "recipe_src": "intro_image/test_v8AYyaH.jpeg"
                }
            ] 

        self.assertEqual(search_user_response.data["data"], expected_data)

        
        

    
