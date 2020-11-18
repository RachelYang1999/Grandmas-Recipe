<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/profile_view.css">
<title>Search</title>
%include('header.tpl') 
<div class="layui-body index-body">
    <div class="layui-container">
        <div>
            <img id="avatar-header" src="/img/{{avatar}}" class="avarta-margin">
        </div>
        <div>
            <label class="layui-form-label title">{{username}}'s Recipes</label>
        </div>
        <div class="tab-margin">
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
        <div>
            <div class="follow-box">
                <div style="float:left;width: 1px;height: 45px; background-color:Gray;" class="middle-line"></div> 
                <div style="margin-top: 10px;">
                    <label></label>
                    <a href="javascript:void(0);" class="layui-form-label" style="display: inline-block;text-align: center; margin-top: -50px;margin-left: -10px; color: grey;" onclick="following_layer()">Following<br/>{{following}}</a>
                    
                    <label class="layui-form-label" style="display: inline-block;text-align: center; margin-left: 75px;margin-top: -57px; color: grey" onclick="">Follower<br />{{follower}}</label>
                </div>
            </div>
        </div>
    </div>
    </div>
    
%include('footer.tpl')
<script type="text/javascript" src="/js/profile_view.js"></script>
</body>
</html>