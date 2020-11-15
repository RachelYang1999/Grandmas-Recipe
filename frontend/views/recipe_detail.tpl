<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/css/recipe_detail.css">
    <title>Recipe Detail</title>
    %include('header.tpl')
</head>
<body>
    <div class = "layui-container">
        <div>
            
        </div>   

        <div class="layui-row">
            <div class="layui-col-md8">
                <div class="layui-col-md12 recipe-title">
                    <h1> {{recipe_data.get("title")}} </h1>
                </div>
                <div class="layui-col-md12 vertical-distance">
                    <div class="layui-col-md3">
                        <div class="layui-col-md4">
                            <i class="layui-icon layui-icon-face-smile"></i>
                        </div>
                        <div class="layui-col-md8 on-bottom">
                            <h2> {{recipe_data.get("user_name")}} </h2>
                        </div>
                    </div>
                    <form class="layui-col-md9 ", action="post">
                        <button type="submit", class="layui-btn layui-btn-warm", name = "follow">Follow the Author</button>
                    </form>
                </div>
            </div>
            <form class="layui-col-md4 right-align", action="post">
                <div class="layui-col-md12 vertical-distance", style = "margin-left:auto; margin-right:0">
                    <button type="submit", class="layui-btn layui-btn-warm", name = "follow">Add to Calendar</button>
                </div>
                <br>
                <div class="layui-col-md12 vertical-distance ">
                    <button type="submit", class="layui-btn layui-btn-warm", name = "favourite">Add to Favourite</button>
                </div>
            </form>
        </div>

        <div class = "center">
            <img src="https://user-images.githubusercontent.com/54244602/64422294-1c294400-d0e7-11e9-9ec5-560a14ef628a.png" alt="">
        </div>
        <h1> Description </h1>
        <p> {{recipe_data.get("description")}}</p>
        <br>
        <h1> Ingredient </h1>
        <div class="layui-row", id = "ingredient">
            {{recipe_data.get("ingredient_name_list")}}
        </div>
        </br>

        <script>
                    
            var wrapper = document.getElementById("ingredient");

            var myHTML = '';

            var ingredientList ={{recipe_data.get("")}}
            document.getElementById("ingredient").innerHTML = ingredientList;
            for (i of ingredientList) {
                myHTML += '<h2>' + i + '</h2><br/><br/>';
            }

            wrapper.innerHTML = myHTML;

        </script>
        <h1> Steps </h1>
        <div class="layui-row", id = "ingredient">
            <div class="layui-col-md7", id = "ingredient">
                {{recipe_data.get("step_list")}}
            </div>
            <div class="layui-col-md5">
                Put the image here.
            </div>
        </div>
        </br>

        <h1> Comments </h1>



    </div> 

%include('footer.tpl')

</body>
</html>