<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/css/recipe_detail.css">
    <title>Recipe Detail - {{recipe_data.get("title")}}</title>
    %include('header.tpl')

<div class="layui-body">
    <div class = "layui-container">  
        <div class="layui-row">
            <div class="layui-col-md8">
                <div class="layui-col-md12 recipe-title" >
                    <input type="text" value = '{{recipe_data["id"]}}' id="r_id" style="display: none;" readonly>
                    <h1 id = "recipe_title"> {{recipe_data.get("title")}} </h1>
                </div>
                <div class="layui-col-md12 vertical-distance">
                    <div class="layui-col-md3 on-bottom layui-inline">
                        <div class="layui-col-md4">
                        </div>
                        <div style = "margin: 10px">
                            <h2 id = "user_name">
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
        <hr>
        <h1> Description </h1>
        <br>
        <p class = "normal-text">{{recipe_data.get("description")}}</p>
        <hr>
        <h1> Ingredient </h1>

        <br>
        <div class="layui-row">
            <div class="layui-col-md6", id = "ingredient-text">
                    % index = 1
                    % for i in recipe_data['ingredient_name_list']:
                        % if index % 2 != 0:
                            <li class = "layui-col-md6 normal-text">{{i}}</li>
                            <a class = "layui-col-md6 normal-link" href = "https://www.coles.com.au/"> Shopping Link </a>
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

        <hr>
        <h1> Steps </h1>
        <br>
        <div class="layui-row">
            <div class="layui-col-md7", id = "step-text">

                <ul>
                    % count = 1
                    % for step in recipe_data['step_list']:
                        % step_with_count = str(count) + ": " + str(step)
                        <li class = normal-text>Step {{step_with_count}}</li> 
                        % count += 1
                    % end
                </ul>
            </div>
            <div class="layui-col-md5", id = "step-image">
                <ul>
                    % for step in recipe_data['step_list']:
                        <li class = normal-text>Put the image here.</li> 
                    % end
                </ul>
            </div>
        </div>
        <hr>
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
        </div>
        <hr>
        <h2 class = "comment-input-header, left-space ">Write Something</h2>
        <br>

            <div class = "comment-block", style = "margin-left: 55px;">
            <!-- <div style = "border-radius: 7px; box-shadow: 0px 0px 5px 2px black;"> -->
                <textarea required lay-verify="input" rows="6" cols="30" id="comment"
                                placeholder="Write your comment here!"></textarea>
               
            </div>
            <br>
            <button lay-submit lay-filter="comment" class="layui-btn layui-btn-sm layui-btn left-space">
                Submit
            </button>

            

    </div> 
</div> 
<!-- <img src="https://media.github.sydney.edu.au/user/4849/files/88c7b600-2762-11eb-8c11-c48c77502f32" alt=""> -->
%include('footer.tpl')
<script type="text/javascript" src="/js/recipe_detail.js"></script>


</body>
</html>