layui.use(['form','jquery','upload'], function(){
    var upload = layui.upload;
    var form = layui.form;
    var $ = layui.jquery;

    var uploadInst = upload.render({
        elem: '#main-pic'
        ,url:'http://'+$("#backend").html()+':9999/api/upload/intro_image/'
        ,auto:false
        ,size: 1024
        ,field: "document"
        ,headers:{"token":$.cookie("token")}
        ,data: { recipe_id: function () {
                        return $("#recipe-id").val();
                    },
                }
        ,bindAction:'#intro-submit'
        ,choose:function(obj){
            var files = obj.pushFile();
            $('#intro-pic-view').removeClass('layui-hide');
        
            obj.preview(function(index,file,result){
                $('#intro-pic').attr('src', result); 
            });  
        }
        ,done: function(res){
            console.log(res);
        }
        ,error: function(res){
            console.log(res);
        }
    });

    picupload(1);
    function picupload(id) {
        upload.render({
            elem: "#step-addpic-"+id
            ,url:'http://'+$("#backend").html()+':9999/api/upload/recipe_image/'
            ,auto:false
            ,size: 1024
            ,field: "document"
            ,headers:{"token":$.cookie("token")}
            ,data: { recipe_id: function () {
                            return $("#recipe-id").val();
                        },
                        step_id:  function () {
                            return $("#step-id-"+id).val();
                        },
                    }
            ,bindAction:'#step-submit-'+id
            ,choose:function(obj){
                var files = obj.pushFile();
                $('#uploadDemoView-'+id).removeClass('layui-hide');
            
                obj.preview(function(index,file,result){
                    $('#step-pic-'+id).attr('src', result); 
                });
                
            }
            ,done: function(res){
                console.log(res);
            }
            ,error: function(res){
                console.log(res);
            }
        });
    }

    window.add_step = function(){
    
        var step_counter = Number($("#step-counter").val());
        step_counter = step_counter+1;
        $("#step-counter").val(step_counter);
        console.log("add"+step_counter);

        var step_block='<div id="step-'+step_counter+'">\
                            <input type="text" value="" id="step-id-'+step_counter+'" style="display:none"  readonly>\
                            <div class="layui-inline" >\
                                <div class="layui-input-block step-explanation" >\
                                    <textarea required lay-verify="content" id="step-input-'+step_counter+'" name="step-'+step_counter+'" placeholder="Step explanation" class="layui-textarea" ></textarea>\
                                </div>\
                            </div>\
                            <div class="layui-inline" >\
                                <div class="layui-upload-drag " id="step-addpic-'+step_counter+'">\
                                    <i class="layui-icon"></i>\
                                    <p>Click or Drag Here</p>\
                                </div>\
                            </div>\
                            <div class="layui-inline" > \
                                <div class="layui-hide" id="uploadDemoView-'+step_counter+'">\
                                    <img id="step-pic-'+step_counter+'" name="step-'+step_counter+'-pic" src="" style="max-width: 180px">\
                                </div>\
                            </div>\
                            <div class="layui-inline" >\
                                <button type="button" id="step-delete-'+step_counter+'" onclick= "delete_step('+step_counter+')" class="layui-btn layui-btn-sm layui-btn-primary">\
                                    <i class="layui-icon">&#xe640;</i>\
                                </button>\
                            </div>\
                        </div>'

        var submit_block='<button class="layui-btn" id="step-submit-'+step_counter+'" style="display:none" >test</button>'

        $("#step-block").append(step_block);
        $("#submit-block").append(submit_block);
        picupload(step_counter);
    }
    


    var sleep = function(time) {
        var startTime = new Date().getTime() + parseInt(time, 10);
        while(new Date().getTime() < startTime) {}
    };


    form.on('submit(submit)',function (data) {
        var arr_box = [];
        $('input[type=checkbox]:checked').each(function() {
            arr_box.push($(this).val());
        });
        data.field.category=arr_box.join(",");
    
        
        $.ajax({
            url:'http://'+$("#backend").html()+':9999/api/recipe/',
            data:data.field,
            type:'post',
            headers:{"token":$.cookie("token")},
            success: function (data) {
                console.log(data.data)
                if (data.code==100){
                    layer.msg("uploading...");
                    $("#recipe-id").val(data.data.recipe_id);
                    $("#intro-submit").click();
                    for(var key in data.data.steps){
                        $("#step-id-"+key).val(data.data.steps[key]);
                        $("#step-submit-"+key).click();
                    }
                    sleep(3000); 
                    window.location.href="/recipe_detail?id="+data.data.recipe_id;
                    
                }else{
                    layer.msg(data.msg);
                }
            },
            error: function(data){
                console.log(data);
            }
        })
        return false;
    })
});



function delete_step(del_id){
    $("#step-"+del_id).remove();

    var step_counter = Number($("#step-counter").val());
    for (var i=del_id+1;i<=step_counter;i++){
        $("#step-"+i).attr("id","step-"+String(i-1));

        $("#step-input-"+i).attr("name","step-"+String(i-1));
        $("#step-input-"+i).attr("id","step-input-"+String(i-1));

        $("#step-addpic-"+i).attr("id","step-addpic-"+String(i-1));

        $("#uploadDemoView-"+i).attr("id","uploadDemoView-"+String(i-1));
        

        $("#step-pic-"+i).attr("name",'step-'+String(i-1)+'-pic');
        $("#step-pic-"+i).attr("id","step-pic-"+String(i-1));

        $("#step-delete-"+i).attr("onclick",'delete_step('+String(i-1)+')');
        $("#step-delete-"+i).attr("id","step-delete-"+String(i-1));

        $("#step-id-"+i).attr("id","step-id-"+String(i-1));
        
    }

    step_counter-=1;
    $("#step-counter").val(String(step_counter));  
}

function change_is_publish(){
    $("#is-pub").val(0);
}

function add_ingredient(){
    
    var in_counter = Number($("#in-counter").val());
    in_counter = in_counter+1;
    $("#in-counter").val(String(in_counter));

    var in_block=' <div id="ingredient-'+in_counter+'"> \
                            <div class="layui-inline ingredient-input" >\
                                <input type="text" required lay-verify="content" id="ingredient-input-'+in_counter+'" name="ingredient-'+in_counter+'" placeholder="Please enter your ingredient here..." autocomplete="off" class="layui-input"> \
                            </div>\
                            <div class="layui-inline ingredient-input" >\
                                <input type="text" required lay-verify="content" id="ingredient-shoppinglink-'+in_counter+'" name="ingredient-'+in_counter+'-shoppinglink" placeholder="Please enter shopping link here..." autocomplete="off" class="layui-input"> \
                            </div>\
                            <div class="layui-inline">\
                                <button type="button" id="ingredient-delete-'+in_counter+'" onclick= "delete_ingredient('+in_counter+')" class="layui-btn layui-btn-primary layui-btn-sm"  >\
                                    <i class="layui-icon">&#xe640;</i>\
                                </button>\
                            </div>\
                        </div>'
    $("#ingredient-block").append(in_block);
}

function delete_ingredient(del_id){
    $("#ingredient-"+del_id).remove();

    var in_counter = Number($("#in-counter").val());
    for (var i=del_id+1;i<=in_counter;i++){
        $("#ingredient-"+i).attr("id","ingredient-"+String(i-1));
        $("#ingredient-input-"+i).attr("name","ingredient-"+String(i-1));
        $("#ingredient-input-"+i).attr("id","ingredient-input-"+String(i-1));

        $("#ingredient-delete-"+i).attr("onclick",'delete_ingredient('+String(i-1)+')');
        $("#ingredient-delete-"+i).attr("id","ingredient-delete-"+String(i-1));

        $("#ingredient-shoppinglink-"+i).attr("name",'ingredient-'+String(i-1)+'-shoppinglink');
        $("#ingredient-shoppinglink-"+i).attr("id","ingredient-shoppinglink-"+String(i-1));
    }

    in_counter-=1;
    $("#in-counter").val(String(in_counter));  

}





    
