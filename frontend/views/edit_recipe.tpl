<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
 
    <title>Upload Recipe</title>
    <link rel="stylesheet" href="/css/upload_recipe.css">
    %include('header.tpl')
    

    <div class="layui-body recipe-title-margin">
        <div class="layui-container">
        
            <form class="layui-form" > 
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <div class="layui-input-block ">
                            <input type="text" name="recipe_title" required  lay-verify="content" value='{{recipe_data.get("title")}}' autocomplete="off" class="layui-input recipe-title">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <input type="text" name="is_published" value=1 id="is-pub" style="display:none" readonly>
                        <button type="button" onclick="change_is_publish()" class="layui-btn layui-btn-warm">
                            <i class="layui-icon">&#xe608;</i> Add to Draft
                        </button>
                    </div>
                </div>
                
                <div class="layui-form-item">
                    <div class="layui-row">

                        <div class="layui-col-md6">
                            <div class="main-pic-boarder main-pic-margin">
                                <div class="layui-upload-drag" id="main-pic">
                                    <i class="layui-icon"></i>
                                    <p>Click or Drag Here</p>
                                    <div class="" id="intro-pic-view">
                                        <hr>
                                        <img id="intro-pic" name="intro-pic" src='/img/{{recipe_data.get("intro_src")}}' style="max-width: 400px">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="layui-col-md6">

                            <label class="layui-form-label add-to-category">Choose Category</label>
                            <div class="add-to-cat-boarder" >
                                <div class="layui-input-block button-select-category">
                                    % for c in category:
                                        % if c['id'] in recipe_data['category_id_list']:
                                            <input type="checkbox" name="category" title="{{c['category']}}" value="{{c['id']}}" checked>
                                        % else:
                                            <input type="checkbox" name="category" title="{{c['category']}}" value="{{c['id']}}">
                                        % end
                                    % end
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                               
                <div class="layui-form-item" >
                    <label class="layui-form-label introduction-label">Introduction</label>
                    <div class="layui-input-block introduction" >
                        <textarea name="description" required lay-verify="content" placeholder="Please enter your introduction here..." class="layui-textarea" >{{recipe_data.get("description")}}</textarea>
                    </div>
                </div>
                <div>
                <label class="layui-form-label ingredient-label">Ingredient</label>
                </div>

                <div class="layui-form-item ingredient-margin">
                    <input type="text" value = '{{len(recipe_data["ingredient_name_list"])}}' name="ingredient_count" id="in-counter" style="display: none;" readonly>
                    <div id="ingredient-block">
                         % for i in range(0,len(recipe_data['ingredient_name_list'])):
                        <div id="ingredient-{{i+1}}"> 
                            <div class="layui-inline ingredient-input" >
                                <input type="text" required lay-verify="content" id="ingredient-input-{{i+1}}" name="ingredient-{{i+1}}" value="{{recipe_data['ingredient_name_list'][i][0]}}" autocomplete="off" class="layui-input">   
                            </div>
                            <div class="layui-inline ingredient-input" >
                                <input type="text" required lay-verify="content" id="ingredient-shoppinglink-{{i+1}}" name="ingredient-{{i+1}}-shoppinglink" value="{{recipe_data['ingredient_name_list'][i][1]}}" autocomplete="off" class="layui-input"> 
    
                            </div>
                            <div class="layui-inline">
                                <button type="button" id="ingredient-delete-{{i+1}}" onclick= "delete_ingredient({{i+1}})" class="layui-btn layui-btn-sm layui-btn-primary"  >
                                    <i class="layui-icon">&#xe640;</i>
                                </button>
                            </div>
                        </div>
                        % end 
                    </div>
                </div>
                
                <button type="button" onclick="add_ingredient()" class="layui-btn layui-btn-warm add-ingredient">
                        <i class="layui-icon">&#xe608;</i> Add More Ingredient
                </button>
                
                <label class="layui-form-label step-label">Step</label>
                <input type="text" value=1 id="step-counter" name="step_count" style="display: none;" readonly>
                <div class="layui-form-item step-block" id="step-block"> 

                    % for i in range(0,len(recipe_data['step_list'])):
                    <div id="step-{{i+1}}">
                        <input type="text" value="" id="step-id-{{i+1}}" style="display:none"  readonly>
                        <div class="layui-inline" >
                            <div class="layui-input-block step-explanation" >
                                <textarea id="step-input-{{i+1}}" required lay-verify="content" name="step-{{i+1}}" placeholder="Step explanation" class="layui-textarea" >{{recipe_data['step_list'][i][0]}}</textarea>
                            </div>
                        </div>
                        <div class="layui-inline" >
                            <div class="layui-upload-drag " id="step-addpic-{{i+1}}">
                                <i class="layui-icon"></i>
                                <p>Click or Drag Here</p>
                            </div>
                        </div>
                        <div class="layui-inline" > 
                            <div  id="uploadDemoView-{{i+1}}">
                                <img id="step-pic-{{i+1}}" name="step-{{i+1}}-pic" src="/img/{{recipe_data['step_list'][i][1]}}" style="max-width: 180px">
                            </div>
                        </div>
                        <div class="layui-inline" >
                            <a type="button" class="layui-btn layui-btn-sm layui-btn-primary" id="step-delete-{{i+1}}" onclick= "delete_step({{i+1}})" >
                                <i class="layui-icon">&#xe640;</i>
                            </a>
                        </div>
                    </div>
                    % end

            
                </div>

                <button id="add-step-btn" type="button" onclick= "add_step()" class="layui-btn layui-btn-warm add-step">
                        <i class="layui-icon">&#xe608;</i> Add More Step
                </button>

                <div class="layui-form-item" style="margin: 0px 0px 0px 50px;">
                    <div class="layui-input-block">
                        <button class="layui-btn submit-button" id="submit" lay-submit lay-filter="submit">Submit</button>
                        <button type="reset" class="layui-btn layui-btn-primary">Reset</button>
                        <a href="/"><button type="button" class="layui-btn layui-btn-primary cancel-button">Cancel</button></a>
                    </div>
                </div>
                <input type="text" id="recipe-id" name="recipe_id" value="{{recipe_data['id']}" style="display:none" readonly />
            </form>
            <div id="submit-block">
            
            <button class="layui-btn" id="intro-submit" style="display: none;"></button>
            <button class="layui-btn" id="step-submit-1" style="display:none"></button>
            </div>
           
        </div>
    </div>

%include('footer.tpl')
<script type="text/javascript" src="/js/upload_recipe.js"></script>

</body>
</html>