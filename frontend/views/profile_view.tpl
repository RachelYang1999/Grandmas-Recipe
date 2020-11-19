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
                    <label class="layui-form-label title" style="font-family: Comic Sans MS;">{{username}}'s Recipes</label>
                </div>
            </div>
            <div class="layui-col-md3">
                <div class="follow-box ">
                    <div class="layui-row">
                        <div class="layui-col-md4 ">
                            <a class="layui-form-label" onclick="following_layer()">
                                <div class="follow-text">
                                    Following<br/>{{follow_data["following"]}}
                                </div> 
                            </a>
                        </div>
                        <div class="layui-col-md4 ">
                            <div class="middle-line follow-line-margin"></div> 
                        </div>
                        <div class="layui-col-md4 ">
                            <a class="layui-form-label" onclick="follower_layer()">
                                <div class="follow-text follow-text-margin">
                                    Follower<br/>{{follow_data["follower"]}}
                                </div> 
                            </a>
                        </div>
                            
                    </div>
                </div>
            </div>
        </div>
        
        <div class="layui-tab tab">
            <ul class="layui-tab-title">
                <li class="{{t1}}">My Recipes</li>
                <li class="{{t2}}">My Favourite</li>
                <li class="{{t3}}">Draft Box</li>

            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item {{t1s}}">
                    <div class="center">       
                        % for r in recipes:
                            
                            <div class = "layui-row ">


                                   
                                <div class = "height_width">
                                    <a href = "/recipe_detail?id={{r['recipe_id']}}">
                                        <div class="layui-col-md5">
                                            <img src='/img/{{r["recipe_src"]}}' width="200" height="200" style="margin-top: 15px;">
                                        </div>
                                        <div class="layui-col-md7">
                                            <br>
                                            <br>
                                            <div style="font-family:Comic Sans MS;font-weight: bold;font-size: large;">{{r["recipe_title"]}}</div>
                                            <br>
                                            <br>
                                            <div style="font-family:Palatino;font-weight: lighter; text-align: center; line-height: 20px;">{{r["recipe_description"]}}</div>
                                            <br> 
                                        </div>
                                    </a>
                                </div>    
                                
                                <div style="margin-top: -150px;">
                                <button type="button" class="layui-btn layui-btn-radius layui-btn-warm">
                                    <i class="layui-icon">&#xe642;</i>
                                </button>
                                <button type="button" class="layui-btn layui-btn-radius layui-btn-danger">
                                    <i class="layui-icon">&#xe640;</i>
                                </button>
                                </div>
                                
                            </div>
                        %end 
                    </div>
                </div>
                <div class="layui-tab-item {{t2s}}">
                    <div class="center">       
                        % for r in favrecipes:
                            <div class = "layui-row ">   
                                <div class = "height_width">
                                    <a href = "/recipe_detail?id={{r['id']}}">
                                        <div class="layui-col-md5">
                                            <img src='/img/{{r["meta"]}}' width="200" height="200" style="margin-top: 15px;">
                                        </div>
                                        <div class="layui-col-md7">
                                            <br>
                                            <br>
                                            <div style="font-family:Comic Sans MS;font-weight: bold;font-size: large;">{{r["title"]}}</div>
                                            <br>
                                            <br>
                                            <div style="font-family:Palatino;font-weight: lighter; text-align: center; line-height: 20px;">{{r["description"]}}</div>
                                            <br> 
                                        </div>
                                    </a>
                                </div>    
                                
                                <div style="margin-top: -150px;">
                                <button type="button" class="layui-btn layui-btn-radius layui-btn-danger">
                                    <i class="layui-icon">&#xe640;</i>
                                </button>
                                </div>
                                
                            </div>
                        %end 
                    </div>
                    
                </div>
                <div class="layui-tab-item {{t3s}}">内容3</div>
            </div>
        </div>       
    </div>
</div>
    
%include('footer.tpl')
<script type="text/javascript" src="/js/profile_view.js"></script>
</body>

<div id="following-block" class="layui-hide">
    % for following_data in follow_data["following_data"]:
        <div class="layui-row">
            <div class="layui-col-md8">
                <img class="logo" src='/img/{{following_data["to_user_avatar"]}}'>{{following_data["to_user_name"]}}
            </div>
            <div class="layui-col-md4">
                <button type="button" class="layui-btn layui-btn-primary">UNFOLLOW</button>
            </div>
        </div>
    % end
</div>
<div id="follower-block" class="layui-hide">

</div>

</html>