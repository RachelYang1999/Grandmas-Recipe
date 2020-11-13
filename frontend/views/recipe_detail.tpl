<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/css/recipe_detail.css">
    <title>Recipe Detail</title>
    %include('header.tpl')
    <script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
    <script>
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

        
    </script>
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
                    <div class="layui-col-md3 on-bottom">
                        <div class="layui-col-md4">
                            <i class="layui-icon layui-icon-face-smile"></i>
                        </div>
                        <div class="layui-col-md8">
                            <h2> {{recipe_data.get("user_name")}} </h2>
                        </div>
                    </div>
                    <form class="layui-col-md9 ", action="post">
                        <button type="submit", class="layui-btn layui-btn-warm", name = "follow">Follow the Author</button>
                    </form>
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
            <img src="https://user-images.githubusercontent.com/54244602/64422294-1c294400-d0e7-11e9-9ec5-560a14ef628a.png" alt="">
        </div>
        <h1> Description </h1>
        <p> {{recipe_data.get("description")}}</p>
        <br>
        <h1> Ingredient </h1>

        <!-- <button onclick="myFunction()">Try it</button> -->

        <p id="demo"> </p>


        <div id = "ingredient">
            
        </div>
        <!-- <script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.min.js"></script> -->
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
            
        </script>

        <script>
            // 403 forbidden
            // function insert() {
            //     $(function(){
            //         $.getJSON('http://'+$("#backend").html()+':9999/api/recipe/', function(data) {
            //             console.log(data);
            //             // document.getElementById("demo").innerHTML = data;
            //         });
            //     });
            // };
            function get_recipe() {
                $.ajax({
                    // url: 'http://'+$("#backend").html()+':9999/api/recipe/',
                    url: 'http://172.17.0.10:9999/api/recipe/',
                    type:'GET',
                    // data: {id: '9'},
                    data: {id: 9},
                    dataType: 'json',
                    headers: {"token": $.cookie("token")},
                    success: function(response) {
                        // window.onload = myFunction;
                        console.log("what?");
                    },
                 });
             }
            // window.onload = get_recipe();
            
            // getData('http://172.17.0.10:9999/api/recipe', {id: 9})
            //     .then(data => console.log(data)) // JSON from `response.json()` call
            //     .catch(error => console.error(error))

            // function getData(url, data) {
            //     // Default options are marked with *
            //     return fetch(url, {
            //         headers: {"token": $.cookie("token")},
            //         method: 'GET',   
            //     })
            //     .then(response => response.json()) // parses response to JSON
            //     }


                
            // fetch('http://172.17.0.10:9999/api/recipe/', {id: 9})
            //     .then(response => response.json())
            //     .then(data => {
            //         console.log(response);
            //         // Do what you want with your data
            //     })
            //     .catch(err => {
            //         console.error('An error ocurred', err);
            //     });
  
            
            // function insertIngredients() {
            //     var recipeJSONArray = ${recipe_data};
            //     $.each(recipeJSONArray, function(idx, obj){
            //         var ingredient = document.getElementById("ingredient");
            //         var ingredients = ingredient.firstElementChild || ingredient.firstChild;
            //         ingredients.innerHTML += '<div><span>'
            //             + obj.ingredient_name_list + '</span><br>'
            //             // + obj.name + '</span><br><span style="font-size: 15px; margin-left: 20px; margin-top: 5px">Date: '
            //             // + new Date(obj.createTime).toDateString()
            //             + '</span></div>';

            // });
                    
            // var wrapper = document.getElementById("ingredient");

            // var myHTML = '';
            // // var i = recipe_data;

            // // var ingredientList = recipe_data['ingredient_name_list'];

            // // document.getElementById("ingredient").innerHTML = ingredientList;
            // // for (i of ingredientList) {
            // //     myHTML += '<h2>' + i + '</h2><br/><br/>';
            // // }
            // myHTML += '<h2>' + '{{recipe_data["ingredient_name_list"][0]}}' + '</h2>'; 
            // myHTML += '<h2>' + '{{recipe_data.get("ingredient_name_list")[0]}}' + '</h2>';
            // // myHTML += '<span>#' + '{{recipe_data.get("ingredient_name_list")[0]}}' + '</span><br/><br/>';

            // wrapper.innerHTML = myHTML;
            
        </script>

        <h1> Steps </h1>
        <div class="layui-row">
            <div class="layui-col-md7", id = "step-text">
                <!-- Both ways are okay -->
                {{recipe_data['step_list'][0]}}
                <br>
                {{recipe_data.get("step_list")[1]}}

            </div>
            <div class="layui-col-md5", id = "step-image">
                Put the image here.
            </div>
        </div>

        <script>
            window.onload = function getRData() {
                var myHTML = '';

                var last = JSON.stringify({{recipe_data}});
                // in console:
                // var last = JSON.stringify({&#039;title&#039;: &#039;Fried rice&#039;, &#039;description&#039;: &#039;Good&#039;, &#039;is_published&#039;: 1, &#039;update_date&#039;: &#039;2020-11-13&#039;, &#039;user_id&#039;: 1, &#039;category_id_list&#039;: [&#039;test1&#039;, &#039;tttt&#039;], &#039;step_list&#039;: [&#039;Steam rice&#039;, &#039;Add oil and fry&#039;], &#039;ingredient_name_list&#039;: [&#039;Rice&#039;, &#039;Oil&#039;], &#039;user_name&#039;: &#039;root&#039;});


                // var i = {{recipe_data['step_list'][0]}};
                // in console:
                // var i = {&#039;title&#039;: &#039;Fried rice&#039;, &#039;description&#039;: &#039;Good&#039;, &#039;is_published&#039;: 1, &#039;update_date&#039;: &#039;2020-11-13&#039;, &#039;user_id&#039;: 1, &#039;category_id_list&#039;: [&#039;test1&#039;, &#039;tttt&#039;], &#039;step_list&#039;: [&#039;Steam rice&#039;, &#039;Add oil and fry&#039;], &#039;ingredient_name_list&#039;: [&#039;Rice&#039;, &#039;Oil&#039;], &#039;user_name&#039;: &#039;root&#039;};

                // console.log(i);
            }
            // window.onload = getRData();
            

            // var ingredientList = recipe_data['ingredient_name_list'];

            // document.getElementById("ingredient").innerHTML = ingredientList;
            // for (i of ingredientList) {
            //     myHTML += '<h2>' + i + '</h2><br/><br/>';
            // }
            // myHTML += '<h2>' + '{{recipe_data["ingredient_name_list"][0]}}' + '</h2>'; 
            // myHTML += '<h2>' + '{{recipe_data.get("ingredient_name_list")[0]}}' + '</h2>';

            // myHTML += '<span>#' + '{{recipe_data.get("ingredient_name_list")[0]}}' + '</span><br/><br/>';

            // wrapper.innerHTML = myHTML;  
        </script>

        </br>

        <h1> Comments </h1>
        <div>
            <img src="https://user-images.githubusercontent.com/54244602/64422294-1c294400-d0e7-11e9-9ec5-560a14ef628a.png" alt="">
        </div>
    </div> 

%include('footer.tpl')

</body>
</html>