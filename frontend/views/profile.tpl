<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
 
    <title>Profile</title>
    %include('header.tpl')

    <div class="layui-body profile-body">
        <div class="layui-container">
        
            <form class="layui-form profile-form">
                <div class="layui-form-item">
                    <label class="layui-form-label">Avatar: </label> 
                    <img class="p_avatar" src="/img/{{avatar}}" />
                    <button type="button" class="layui-btn" id="test1">
                        <i class="layui-icon">&#xe67c;</i>Upload new avatar
                    </button>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                    <label class="layui-form-label">Username: </label>
                        <div class="layui-input-block" style="width:90px;">
                            <input type="text" autocomplete="off" value="{{username}}" class="layui-input non_border" readonly>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <button type="button" class="layui-btn" onclick='change()' id="test1">Change password</button>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">Gender: </label>
                    <div class="layui-input-block">
                        <input type="radio" name="sex" value="male" title="Male" {{checked_male}}>
                        <input type="radio" name="sex" value="female" title="Female" {{checked_female}}>
                        <input type="radio" name="sex" value="other" title="Other" {{checked_other}}>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">DOB: </label>
                    <div class="layui-input-block" style="width: 120px;">
                        <input type="text" name="dob" value="{{u_data['dob']}}" class="layui-input" id="test2">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">Join Date: </label>
                    <div class="layui-input-block" style="width: 120px;">
                        <input type="text" name="signup" autocomplete="off" value="{{u_data['dor'].split('T')[0]}}" class="layui-input non_border" readonly>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">E-mail: </label>
                    <div class="layui-input-block" style="width: 200px;">
                        <input type="text" autocomplete="off" value="{{u_data['email']}}" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">Introduction: </label>
                    <div class="layui-input-block" style="width: 600px;">
                        <textarea name="desc" placeholder="Write your introduction" class="layui-textarea" >{{u_data['introduction']}}</textarea>
                    </div>
                </div>
                <div class="layui-form-item" style="margin: 0px 0px 0px 100px;">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="*">Submit</button>
                        <button type="reset" class="layui-btn layui-btn-primary">Reset</button>
                    </div>
                </div>

            </form>
        </div>
    </div>

%include('footer.tpl')
<script type="text/javascript" src="/js/profile.js"></script>

</body>
</html>