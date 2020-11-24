layui.use(['form','jquery'], function () {
    var f = layui.form;
    var $ = layui.jquery;
    f.on('submit(comment)',function (data) {
        if($("#comment").val()!=""){
            var form = new FormData();
            form.append("comment_content", $("#comment").val());
            // form.append("user_name", $("#user_name").text());
            form.append("recipe_id", $("#r_id").val());

            var settings = {
            "url":$("#backend").html()+'api/comments/',
            "method": "POST",
            "timeout": 0,
            "headers": {
                "token": $.cookie("token"),
                "ctoken": $.cookie("ctoken"),
            },
            "processData": false,
            "mimeType": "multipart/form-data",
            "contentType": false,
            "data": form
            };

            $.ajax(settings).done(function (response) {
                location.reload();
            });

        }else{
            layer.msg("This field is required")
        }

        
    })
    window.follow = function (){
        var form = new FormData();
        form.append("to_user", $("#auth_id").val());

        var settings = {
        "url":$("#backend").html()+'api/follow/',
        "method": "POST",
        "timeout": 0,
        "headers": {
            "token": $.cookie("token"),
            "ctoken": $.cookie("ctoken"),
        },
        "processData": false,
        "mimeType": "multipart/form-data",
        "contentType": false,
        "data": form
        };

        $.ajax(settings).done(function (response) {
            layer.msg("Followed :)");
             $("#fo").addClass("layui-hide");
            $("#unfo").removeClass("layui-hide");
            console.log(response);
        });

    }
    window.favourite = function (){

        var form = new FormData();
        form.append("recipe_id", $("#r_id").val());

        var settings = {
        "url":$("#backend").html()+"api/fav_recipe/",
        "method": "POST",
        "timeout": 0,
        "headers": {
            "token": $.cookie("token"),
            "ctoken": $.cookie("ctoken"),
        },
        "processData": false,
        "mimeType": "multipart/form-data",
        "contentType": false,
        "data": form
        };

        $.ajax(settings).done(function (response) {
            layer.msg("Success :)");
            $("#fav").addClass("layui-hide");
            $("#unfav").removeClass("layui-hide");
            console.log(response);
        });

    }
});