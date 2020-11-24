layui.use(['form','layer','jquery'], function () {

        var form = layui.form;
        var $ = layui.jquery;
        
        form.on('submit(forget)',function (data) {
            $.ajax({
                
                url:$("#backend").html()+'api/f_password/',
                data:data.field,
                dataType:'text',
                type:'post',
                success: function (data) {
                    var result = JSON.parse(data)
                    if (result.msg == "success"){
                        layer.msg(result.msg);
                        window.location.href="/signin";
                    }else{
                        layer.msg(result.msg);
                    }
                },
                error: function(data){
                    console.log(data);
                }
            })
            return false;
        })
 
    });

function send(){

    if ($("#email").val()!=""){
        var form = new FormData();
        form.append("email", $("#email").val());

        var settings = {
        "url": $("#backend").html()+'api/e_password/',
        "method": "POST",
        "timeout": 0,
        "processData": false,
        "mimeType": "multipart/form-data",
        "contentType": false,
        "data": form
        };

        $.ajax(settings).done(function (response) {
            var result = JSON.parse(response)
            if (result.msg == "success"){
                $("#code-block").addClass("layui-hide");
                $("#password-block").removeClass("layui-hide");
                layer.msg("Email send success");
            }else{
                layer.msg(result.msg);
            }
        });
    }else{
        layer.msg("Please enter the email")
    }
    

}