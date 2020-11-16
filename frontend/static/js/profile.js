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
            content: 'password: <input id="password" type="text" style="width:80px;" value="" />',
            title:"Change Password",
            btn: ['Confirm', 'Cancel'], 
  
            yes:function(index,layero){
                var form = new FormData();


                var settings = {
                };

                $.ajax(settings).done(function (response) {
                    
                });
                layer.close(index);  
            }
        }); 
    }); 
}