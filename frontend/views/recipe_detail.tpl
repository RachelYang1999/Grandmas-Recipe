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
                    <h1 id = "recipe_title" style="font-family:Monospace;font-weight: bold;"> {{recipe_data.get("title")}} </h1>
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
                    <div class="layui-col-md9 layui-inline" style="margin-left: -50px;margin-top: 10px;">
                        <button type="submit", class="layui-btn layui-btn-sm layui-btn-radius layui-btn-warm", name = "follow"><i class="layui-icon">&#xe6af;</i> Follow</button>
                    </div>
                </div>
            </div>
            <form class="layui-col-md4 right-align", action="post">
                <div class="layui-col-md12 vertical-distance", style = "padding-left: 100px;padding-top: 50px;">
                    <button type="submit", class="layui-btn layui-btn-sm layui-btn-radius layui-btn-normal", name = "follow"><i class="layui-icon">&#xe63c;</i>Add to Calendar</button>
                </div>
                <br>
                <div class="layui-col-md12 vertical-distance", style = "padding-left: 100px;">
                    <button type="submit", class="layui-btn layui-btn-sm layui-btn-radius layui-btn-danger", name = "favourite"><i class="layui-icon">&#xe68c;</i>Add to Favourite</button>
                </div>
            </form>
        </div>

        <div class = "center" style="margin-top: 50px;margin-bottom: 20px;">
            <img src='/img/{{recipe_data.get("intro_src")}}' width="400" height="400" alt="">
            <br>
        </div>
        
        
        <br>
        <p class = "normal-text" style="margin-bottom: 20px; text-align: center;">{{recipe_data.get("description")}}</p>
   
        <br>
        <h1> Ingredient </h1>
        <br>

        <br>
        <div class="layui-row">
            <div class="layui-col-md6", id = "ingredient-text">
                    % index = 1
                    % for i in recipe_data['ingredient_name_list']:
                        % if index % 2 != 0:
                            <li class = "layui-col-md6 normal-text">{{i[0]}}</li>
                            <a class = "layui-col-md6 normal-link" href = "{{i[1]}}"> Shopping Link </a>
                        % end
                        % index += 1  
                    % end
            </div>
            <div class="layui-col-md6", id = "step-image">
                <ul>
                    % index = 1
                    % for i in recipe_data['ingredient_name_list']:
                        % if index % 2 == 0:
                            <li class = "layui-col-md6  normal-text">{{i[0]}}</li>
                            <a class = "layui-col-md6  normal-link" href = "{{i[1]}}"> Shopping Link </a>
                        % end
                        % index += 1  
                    % end
                </ul>
                
            </div>
        </div>

        
        <br>
        <br>
        <h1> Steps </h1>
        <br>
        
        % count = 1
        % for step in recipe_data['step_list']:
            % step_with_count = str(count) + ": " + str(step[0])
            <div class="layui-row">
                
                <div class="layui-col-md7", id = "step-text">
                    <label class="layui-form-label" style="font-weight: 200;font-family: sans-serif">Step {{step_with_count}}</label>
                    
                    
                </div>
                <div class="layui-col-md5", id = "step-image">
                    <div><img src='/img/{{step[1]}}' width="200" height="200" style="margin-bottom: 40px;"></div>
                </div>
            </div>
            % count += 1
         % end
        
        <br>
        <br>
        <h1> Comments </h1>
        <div>
            % for comment in recipe_data['comment_dic_list']:
            
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
        
        <h2 class = "comment-input-header, left-space ">Write Something</h2>
        <br>

            <div class = "comment-block", style = "margin-left: 55px;">
            <!-- <div style = "border-radius: 7px; box-shadow: 0px 0px 5px 2px black;"> -->
                <textarea required lay-verify="input" rows="6" cols="20" id="comment"
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