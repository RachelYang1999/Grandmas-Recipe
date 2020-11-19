layui.use(['form','layer','jquery'], function () {

        var form = layui.form;
        var $ = layui.jquery;
        form.on('submit(login)',function (data) {
            $.ajax({
                url:'http://'+$("#backend").html()+':9999/api/auth/',
                data:data.field,
                dataType:'text',
                type:'put',
                success: function (data) {
                    var result = JSON.parse(data)
                    console.log(result);
                    if (result.msg == "success"){
                        window.location.href="/signin";
                    }
                },
                error: function(data){
                    console.log(data);
                }
            })
        })
 
    });

