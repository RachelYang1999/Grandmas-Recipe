<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/css/recipe_detail.css">
    <title>Recipe Detail</title>
    %include('header.tpl')
    <script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
    <!-- <script>
        function insertIngredients() {
            var ages = [3, 10, 18, 20];

            
            // var recipeJSONArray = ${recipe_data};
            // $.each(recipeJSONArray, function(idx, obj){
            //     var ingredient = document.getElementById("ingredient");
            //     var ingredients = ingredient.firstElementChild || ingredient.firstChild;
            //     ingredients.innerHTML += '<div><span>'
            //         + obj.ingredient_name_list + '</span><br>'
            //         // + obj.name + '</span><br><span style="font-size: 15px; margin-left: 20px; margin-top: 5px">Date: '
            //         // + new Date(obj.createTime).toDateString()
            //         + '</span></div>';
            // });
        }

        
    </script> -->
</head>
<body style = "overflow: scroll", onload = insertIngredients()>
    <div class = "layui-container">
        <div>
            
        </div>   
        <div class="layui-row">
            <div class="layui-col-md8">
                <div class="layui-col-md12 recipe-title">
                    <h1> {{recipe_data.get("title")}} </h1>
                </div>
                <div class="layui-col-md12 vertical-distance">
                    <div class="layui-col-md3 on-bottom layui-inline">
                        <div class="layui-col-md4">
                        </div>
                        <div style = "margin: 10px">
                            <h2>
                                <img src="/img/{{avatar}}" class="layui-nav-img"> 
                                {{recipe_data.get("user_name")}} 
                            </h2>
                        </div>
                    </div>
                    <div class="layui-col-md9 layui-inline">
                        <button type="submit", class="layui-btn layui-btn-warm", name = "follow">Follow the Author</button>
                    </div>
                </div>
            </div>
            <form class="layui-col-md4 right-align", action="post">
                <div class="layui-col-md12 vertical-distance", style = "padding-left: 240px;">
                    <button type="submit", class="layui-btn layui-btn-warm", name = "follow">Add to Calendar</button>
                </div>
                <br>
                <div class="layui-col-md12 vertical-distance", style = "padding-left: 240px;">
                    <button type="submit", class="layui-btn layui-btn-warm", name = "favourite">Add to Favourite</button>
                </div>
            </form>
        </div>

        <div class = "center">
            <img src="https://media.github.sydney.edu.au/user/4849/files/66508100-26ff-11eb-9e66-63155c9c402f" alt="">
            <br>
        </div>
        <h1> Description </h1>
        <br>
        <p class = "normal-text">{{recipe_data.get("description")}}</p>
        
        <h1> Ingredient </h1>

        <br>
        <div class="layui-row">
            <div class="layui-col-md6", id = "ingredient-text">
                    % index = 1
                    % for i in recipe_data['ingredient_name_list']:
                        % if index % 2 != 0:
                            <li class = "layui-col-md6 normal-text">{{i}}</li>
                            <a class = "layui-col-md6  normal-link" href = "https://www.coles.com.au/"> Shopping Link </a>
                        % end
                        % index += 1  
                    % end
            </div>
            <div class="layui-col-md6", id = "step-image">
                <ul>
                    % index = 1
                    % for i in recipe_data['ingredient_name_list']:
                        % if index % 2 == 0:
                            <li class = "layui-col-md6  normal-text">{{i}}</li>
                            <a class = "layui-col-md6  normal-link" href = "https://www.coles.com.au/"> Shopping Link </a>
                        % end
                        % index += 1  
                    % end
                </ul>
                
            </div>
        </div>

        <!-- <button onclick="myFunction()">Try it</button> -->
        <!-- <p id="demo"> </p>

        <script>
            var ages = [3, 10, 18, 20];

            function checkAdult(age) {
                return age >= 18;
            }

            function myFunction() {
                document.getElementById("demo").innerHTML = ages.find(checkAdult);
                console.log("myfunction");
            }
            window.onload = myFunction;     
        </script> -->

        <h1> Steps </h1>
        <br>
        <div class="layui-row">
            <div class="layui-col-md7 normal-text", id = "step-text">

                <!-- Both ways are okay
                <br>
                {{recipe_data['step_list'][0]}}
                <br>
                {{recipe_data.get("step_list")[1]}} -->
                <ul>
                    % count = 1
                    % for step in recipe_data['step_list']:
                        % step_with_count = str(count) + ": " + str(step)
                        <li>Step {{step_with_count}}</li> <br>
                        % count += 1
                    % end
                </ul>
            </div>
            <div class="layui-col-md5 normal-text", id = "step-image">
                <ul>
                    % for step in recipe_data['step_list']:
                        <li>Put the image here.</li> <br>
                    % end
                </ul>
            </div>
        </div>

        </br>
        <h1> Comments </h1>
        <div>
            % for comment in recipe_data['comment_dic_list']:
                <!-- <li>{{comment}}</li> <br> -->
            
                <div style = "margin: 10px">
                    
                    <h2>
                        <img src="/img/{{avatar}}" class="layui-nav-img"> 
                        {{comment['comment_user_name']}} 
                    </h2>
                </div>
                <div style = "padding-left: 55px;">
                    <p class = "normal-text">{{comment['comment_content']}}</p>
                </div>

                
                <br>
            % end
            <img src="https://media.github.sydney.edu.au/user/4849/files/88c7b600-2762-11eb-8c11-c48c77502f32" alt="">
        </div>
        
    </div> 

%include('footer.tpl')

</body>
</html>