function following_layer(){
    layui.use('layer', function () {
        var layer = layui.layer;
        layer.open({
                type:1,
                area: ['500px', '300px'],
                content: $("#following-block").html(),
                title:"Following",
                btn: ['Confirm', 'Cancel'], 
    
                yes:function(index,layero){
                    layer.close(index);
                        
                }
            }); 

        }); 
}
function follower_layer(){
    layui.use('layer', function () {
        var layer = layui.layer;
        layer.open({
                type:1,
                area: ['500px', '300px'],
                content: $("#follower-block").html(),
                title:"Follower",
                btn: ['Confirm', 'Cancel'], 
    
                yes:function(index,layero){
                    layer.close(index);
                        
                }
            }); 

        }); 
}
function my_delt(ele){
    $("#my-"+ele).remove();
}

function fav_delt(ele){
    $("#fav-"+ele).remove();
}

function u_follow(ele){
    var form = new FormData();
        form.append("to_user", ele);

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
            console.log(response);
            layer.msg("Followed :)");
            location.reload();
            
        });
        

}

function u_unfollow(ele){
    var form = new FormData();
    form.append("to_user", ele);

    var settings = {
    "url":$("#backend").html()+'api/follow/',
    "method": "DELETE",
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
        console.log(response);
        layer.msg("Unfllowed :)");
        location.reload();
    });
       

}