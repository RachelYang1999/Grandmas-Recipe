<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/profile_view.css">
<title>Profile</title>
%include('header.tpl') 
<div class="layui-body index-body">
    <div class="layui-container">
        <div class="layui-row">
            <div class="layui-col-md9">
                <div>
                    <img id="avatar-header" src="/img/{{avatar}}" class="avarta-margin">
                </div>
                <div>
                    <label class="layui-form-label title">{{username}}'s Recipes</label>
                </div>
            </div>
            <div class="layui-col-md3">
                <div class="follow-box ">
                    <div class="layui-row">
                        <div class="layui-col-md4 ">
                            <a class="layui-form-label" onclick="following_layer()">
                                <div class="follow-text">
                                    Following<br/>{{following}}
                                </div> 
                            </a>
                        </div>
                        <div class="layui-col-md4 ">
                            <div class="middle-line follow-line-margin"></div> 
                        </div>
                        <div class="layui-col-md4 ">
                            <a class="layui-form-label" onclick="follower_layer()">
                                <div class="follow-text follow-text-margin">
                                    Follower<br/>{{follower}}
                                </div> 
                            </a>
                        </div>
                            
                    </div>
                </div>
            </div>
        </div>
        
        <div class="layui-tab tab">
            <ul class="layui-tab-title">
                <li class="layui-this">My Recipes</li>
                <li>My Favourite</li>
                <li>Draft Box</li>

            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show">
                    内容1
                </div>
                <div class="layui-tab-item">内容2</div>
                <div class="layui-tab-item">内容3</div>
            </div>
        </div>
            
    </div>
</div>
    
%include('footer.tpl')
<script type="text/javascript" src="/js/profile_view.js"></script>
</body>
</html>