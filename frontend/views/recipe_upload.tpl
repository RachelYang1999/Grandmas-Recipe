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
                            <input type="text" name="title" required  lay-verify="required" placeholder="Recipe Title" autocomplete="off" class="layui-input recipe-title">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <button type="button" class="layui-btn layui-btn-warm">
                            <i class="layui-icon">&#xe608;</i> Add to Draft
                        </button>
                    </div>
                </div>
                
                <div class="layui-form-item">
                    <div class="layui-row">

                        <div class="layui-col-md6">
                            <div class="main-pic-boarder">
                                <button type="button" class="layui-btn layui-btn-warm button-upload-image">
                                    <i class="layui-icon">&#xe67c;</i>Upload Image
                                </button>
                            </div>
                        </div>

                        <div class="layui-col-md6">

                            <label class="layui-form-label add-to-category">Add Category</label>
                            <div class="add-to-cat-boarder" >
                                <div class="layui-input-block button-select-category">
                                    % for c in category:
                                    <input type="checkbox" name="{{c['id']}}" title="{{c['category']}}">
                                    % end
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                               
                <div class="layui-form-item" >
                    <label class="layui-form-label introduction-label">Introduction</label>
                    <div class="layui-input-block introduction" >
                        <textarea name="introduction" placeholder="Please enter your introduction here..." class="layui-textarea" ></textarea>
                    </div>
                </div>
                <label class="layui-form-label ingredient-label">Ingredient</label>
                <input id="in-counter" value="1" style="display:none"/>
                <div class="layui-form-item" id="test_i">
                    <div class="ingredient-margin">
                        <div class="layui-inline ingredient-margin-input" >
                            <input type="text" name="ingredient-1" placeholder="Please enter your ingredient here..." autocomplete="off" class="layui-input"> 
                        </div>
                        <div class="layui-inline ">
                            <button type="button" class="layui-btn layui-btn-warm layui-btn-sm">
                                <i class="layui-icon">&#xe640;</i>
                            </button>
                        </div>
                        <div class="layui-inline ingredient-margin-input" >
                            <input type="text" name="shoppinglink" placeholder="Please enter shopping link here..." autocomplete="off" class="layui-input"> 
                        </div>
                    </div>
                </div>
                
                <button type="button" class="layui-btn layui-btn-warm add-ingredient" onclick="add_ingredient()">
                        <i class="layui-icon">&#xe608;</i> Add More Ingredient
                </button>
                
                <label class="layui-form-label step-label">Step</label>
                
                <div class="layui-form-item">
                    <div class="layui-inline" >
                        <label class="layui-form-label step-id">1</label>
                    </div>
                    
                    <div class="layui-inline" >
                        <div class="layui-input-block step-explanation" >
                            <textarea name="step-explanation" placeholder="Step explanation" class="layui-textarea" ></textarea>
                        </div>
                    </div>
                    <div class="layui-inline" >
                        <div class = "step-pic-boader">
                            <button type="button" class="layui-btn layui-btn-warm upload-pic-step " id="test1">
                                <i class="layui-icon">&#xe654;</i>picture
                            </button>
                        </div>
                    </div>

                    <div class="layui-inline" >
                        <button type="button" class="layui-btn layui-btn-sm layui-btn-primary" style="margin-left: 50px;">
                            <i class="layui-icon">&#x1006;</i>
                        </button>
                    </div>
                </div>

                <button type="button" class="layui-btn layui-btn-warm add-step">
                        <i class="layui-icon">&#xe608;</i> Add More Step
                </button>

                <div class="layui-form-item" style="margin: 0px 0px 0px 100px;">
                    <div class="layui-input-block">
                        <button class="layui-btn submit-button" lay-submit lay-filter="*">Submit</button>
                        <button type="reset submit-button" class="layui-btn layui-btn-primary">Reset</button>
                    </div>
                </div>

            </form>
        </div>
    </div>

%include('footer.tpl')
<script type="text/javascript" src="/js/recipe_upload.js"></script>

</body>
</html>