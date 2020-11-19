layui.use(['form','layer','jquery'], function () {

        var form = layui.form;
        var $ = layui.jquery;
        form.on('submit(login)',function (data) {
            $.ajax({
                
                url:'http://'+$("#backend").html()+':9999/api/auth/',
                data:data.field,
                dataType:'text',
                type:'post',
                success: function (data) {
                    var result = JSON.parse(data)
                    if (result.msg == "success"){
                        $.cookie("token",result.data.token);
                        window.location.href=($("#redirect").val());
                    }
                },
                error: function(data){
                    console.log(data);
                }
            })
        })
 
    });

