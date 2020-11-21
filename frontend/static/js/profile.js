layui.use(['upload','laydate'], function(){
    var upload = layui.upload;
    var laydate = layui.laydate;
    var form = layui.form;
    var $ = layui.jquery;
   
    upload = upload.render({
        elem: '#test1'
        ,url: 'http://'+$("#backend").html()+':9999/api/upload/profile_image/'
        ,headers:{"token":$.cookie("token")}
        ,field: "document"
        ,done: function(res){
            layer.msg('success');
            $("#avatar").attr("src","/img/"+res.data.src);
            $("#avatar-header").attr("src","/img/"+res.data.src);

        }
        ,error: function(){

        }
    });

    laydate.render({
        elem: '#test2',
        lang: 'en',
        showBottom: false
    });


    form.on('submit(profile-submit)',function (data) {
        $.ajax({
            url:'http://'+$("#backend").html()+':9999/api/profile/',
            data:data.field,
            headers:{"token":$.cookie("token")},
            type:'post',
            success: function (data) {
                layer.msg('success');
                window.location.href="profile";
            },
            error: function(data){
                console.log(data);
            }
        })
        return false;
    })
 
});

function change(){

    layui.use('layer', function(){
        layer.open({
            type:1,
            content: '<form class="layui-form">\
                        <div class="layui-input-inline">\
                            Old password: <input id="old-password" name="old-password" required lay-verify="content" type="password" style="width:80px;" value="" />\
                        </div>\
                        <div class="layui-input-inline">\
                            New password: <input id="new-password" name="new-password" required lay-verify="content" type="password" style="width:80px;" value="" />\
                        </div>\
                        <div class="layui-input-inline">\
                            Re-type new password: <input id="new-password-re" required lay-verify="content|same_change" type="password" style="width:80px;" value="" />\
                        </div>\
                        <div class="layui-input-inline login-btn">\
                            <button lay-submit lay-filter="Sumbit" class="layui-btn">Sumbit</button>\
                        </div>\
                    </form>',

            title:"Change Password",
            btn: ['Confirm', 'Cancel'], 
  
            yes:function(index,layero){
                var form = new FormData();
                form.append("old-password", $("#old-password").val());
                form.append("new-password", $("#new-password").val());

                var settings = {
                "url": 'http://'+$("#backend").html()+':9999/api/password/',
                "method": "POST",
                "timeout": 0,
                "headers": {
                    "token": $.cookie("token")
                },
                "processData": false,
                "mimeType": "multipart/form-data",
                "contentType": false,
                "data": form
                };

                $.ajax(settings).done(function (response) {
                console.log(response);
                });
                layer.close(index);  
            }
        }); 
    }); 
}