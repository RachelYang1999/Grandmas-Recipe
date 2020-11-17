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
                            <input type="text" name="recipe_title" required  lay-verify="required" placeholder="Recipe Title" autocomplete="off" class="layui-input recipe-title">
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
                                <img class="layui-upload-img " id="demo1" src="" style="max-height: 300px;max-width: 400px;">
                            </div>
                            <div class="button-upload-image">
                                <button type="button" id="main-pic" class="layui-btn layui-btn-warm ">
                                    <i class="layui-icon">&#xe67c;</i>Upload Image
                                </button>
                            </div>
                        </div>

                        <div class="layui-col-md6">

                            <label class="layui-form-label add-to-category">Add Category</label>
                            <div class="add-to-cat-boarder" >
                                <div class="layui-input-block button-select-category">
                                    % for c in category:
                                    <input type="checkbox" name="category" title="{{c['category']}}" value="{{c['id']}}">
                                    % end
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                               
                <div class="layui-form-item" >
                    <label class="layui-form-label introduction-label">Introduction</label>
                    <div class="layui-input-block introduction" >
                        <textarea name="description" placeholder="Please enter your introduction here..." class="layui-textarea" ></textarea>
                    </div>
                </div>
                <div>
                <label class="layui-form-label ingredient-label">Ingredient</label>
                </div>
                <div class="layui-form-item ingredient-margin">
                    <input type="text" value = 1 name="ingredient_count" id="in-counter" style="display: none;" readonly>
                    <div id="ingredient-block">
                        <div id="ingre-1"> 
                            <div class="layui-inline ingredient-input" >
                                <input type="text" name="ingredient-1" placeholder="Please enter your ingredient here..." autocomplete="off" class="layui-input"> 
                            </div>
                            <div class="layui-inline">
                                <button type="button" onclick= "delete_ingredient(1)" class="layui-btn layui-btn-warm layui-btn-sm"  >
                                    <i class="layui-icon">&#xe640;</i>
                                </button>
                            </div>
                            <div class="layui-inline ingredient-input" >
                                <input type="text" name="shoppinglink" placeholder="Please enter shopping link here..." autocomplete="off" class="layui-input"> 
                            </div>
                        </div>
                    </div>
                </div>
                
                <button type="button" onclick="add_ingredient()" class="layui-btn layui-btn-warm add-ingredient">
                        <i class="layui-icon">&#xe608;</i> Add More Ingredient
                </button>
                
                <label class="layui-form-label step-label">Step</label>
                <input type="text" value=1 id="step-counter" name="step_count" style="display: none;" readonly>
                <div class="layui-form-item step-block" id="step-block"> 
                    <div id="step-1">
                        <div class="layui-inline" >
                            <div class="layui-input-block step-explanation" >
                                <textarea name="step-1" placeholder="Step explanation" class="layui-textarea" ></textarea>
                            </div>
                        </div>
                        <div class="layui-inline" >
                            <div class = "step-pic-boader">
                                <button type="button" class="layui-btn layui-btn-warm upload-pic-step ">
                                    <i class="layui-icon">&#xe654;</i>picture
                                </button>
                            </div>
                        </div>
                        <div class="layui-inline" >
                            <button type="button" onclick= "delete_step(1)" class="layui-btn layui-btn-sm layui-btn-primary" style="margin-left: 50px;">
                                <i class="layui-icon">&#x1006;</i>
                            </button>
                        </div>
                    </div>
                </div>

                <button type="button" onclick="add_step()" class="layui-btn layui-btn-warm add-step">
                        <i class="layui-icon">&#xe608;</i> Add More Step
                </button>

                <div class="layui-form-item" style="margin: 0px 0px 0px 50px;">
                    <div class="layui-input-block">
                        <button class="layui-btn submit-button" id="submit" lay-submit lay-filter="submit">Submit</button>
                        <button type="reset" class="layui-btn layui-btn-primary">Reset</button>
                        <a href="/"><button type="button" class="layui-btn layui-btn-primary cancel-button">Cancel</button></a>

                    </div>
                </div>

            </form>
        </div>
    </div>

%include('footer.tpl')
<script type="text/javascript" src="/js/upload_recipe.js"></script>

</body>
</html>