layui.use(['form','layer','jquery'], function () {
    var f = layui.form;
    var $ = layui.jquery;
    f.on('submit(comment)',function (data) {
        var form = new FormData();
        form.append("comment_content", data.field['comment']);
        form.append("user_name", $("#user_name").text());
        form.append("recipe_name", $("#recipe_title").text());

        var settings = {
        "url": "http://172.17.0.10:9999/api/comments/",
        "method": "POST",
        "timeout": 0,
        "headers": {
            "token": "$1$0644e5912bf741b185de0ac5ce6a558a"
        },
        "processData": false,
        "mimeType": "multipart/form-data",
        "contentType": false,
        "data": form
        };

        $.ajax(settings).done(function (response) {
        console.log(response);
        });
    })
});

    // var form = layui.form;
    // var $ = layui.jquery;
    // form.on('submit(comment)',function (data) {
    //     $.ajax({
    //         url:'http://'+$("#backend").html()+':9999/api/comments/',
    //         // data: data.field,
    //         headers: {"token": $.cookie("token")},
    //         data: {
    //             comment_content: "I got it!",
    //             user_name: "root",
    //             recipe_name: "Egg Fried Rice",
    //             // comment_content: data.field['comment'],
    //             // user_name: $("#user_name").text(),
    //             // recipe_name: $("#recipe_title").text(),
    //         },

    //         dataType:'text',
    //         type:'post',
    //         success: function (data) {
    //             var result = JSON.parse(data)
    //             if (result.msg == "success"){
    //                 $.cookie("token",result.token);
    //             }
    //         },
    //         error: function(data){
    //             console.log($("#user_name").text())
    //             console.log(data);
    //         }
    //     })
    //     return false;
    // })
