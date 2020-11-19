layui.use(['form','layer','jquery'], function () {
    var f = layui.form;
    var $ = layui.jquery;
    f.on('submit(comment)',function (data) {
        var form = new FormData();
        form.append("comment_content", $("#comment").val());
        // form.append("user_name", $("#user_name").text());
        form.append("recipe_id", $("#r_id").val());

        var settings = {
        "url":'http://'+$("#backend").html()+':9999/api/comments/',
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
            location.reload();
        });
    })
    window.follow = function (){
        var form = new FormData();
        form.append("to_user", $("#auth_id").val());

        var settings = {
        "url":'http://'+$("#backend").html()+':9999/api/follow/',
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

    }
    window.favourite = function (){

    }
});