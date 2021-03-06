layui.use(['form','layer','jquery'], function () {

    var form = layui.form;
    var $ = layui.jquery;
    form.on('submit(login)',function (data) {
        $.ajax({
            
            url:$("#backend").html()+'api/auth/',
            data:data.field,
            dataType:'text',
            type:'post',
            success: function (data) {
                var result = JSON.parse(data)
                console.log(data);
                if (result.msg == "success"){
                    $.cookie("token",result.data.token);
                    window.location.href=($("#redirect").val());
                }else{
                    layer.msg(result.msg)
                }
            },
            error: function(data){
                
                console.log(data);
            }
        })
        return false;
    })

});
    

