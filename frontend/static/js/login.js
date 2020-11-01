layui.use(['form','layer','jquery'], function () {

        var form = layui.form;
        var $ = layui.jquery;
        form.on('submit(login)',function (data) {
            $.ajax({
                url:'http://172.17.0.7:9999/api/auth/?action=login',
                data:data.field,
                dataType:'text',
                type:'post',
                success: function (data) {
                    var result = JSON.parse(data)
                    console.log(result);
                    if (result.msg == "success"){
                        $.cookie("token",result.token);
                        console.log($.cookie("token"));
                    }
                },
                error: function(data){
                    console.log(data);
                }
            })
            return false;
        })
 
    });

