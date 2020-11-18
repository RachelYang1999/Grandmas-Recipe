layui.use(['form','jquery','upload'], function(){
    var upload = layui.upload;
    var form = layui.form;
    var $ = layui.jquery;

    var uploadInst = upload.render({
        elem: '#main-pic'
        ,url:'http://'+$("#backend").html()+':9999/api/upload/recipe_image/'
        ,auto:false
        ,field: "document"
        ,headers:{"token":$.cookie("token")}
        ,bindAction:'#submit'
        ,choose:function(obj){
            var files = obj.pushFile();
        
            obj.preview(function(index,file,result){
                $('#demo1').attr('src', result); 
                console.log(result);
            });
            
        }
        ,done: function(res){
            layer.msg('success');
            $("#demo1").attr("src","/img/"+res.data.src);


        }
        ,error: function(){

        }
    });

    form.on('submit(submit)',function (data) {
        var arr_box = [];
        $('input[type=checkbox]:checked').each(function() {
            arr_box.push($(this).val());
        });
        console.log(arr_box.join(","));
        data.field.category=arr_box.join(",");
        console.log(data.field);
        
        $.ajax({
            
            url:'http://'+$("#backend").html()+':9999/api/recipe/',
            data:data.field,
            type:'post',
            headers:{"token":$.cookie("token")},
            success: function (data) {
                // var result = JSON.parse(data)
                // if (result.msg == "success"){
                //     $.cookie("token",result.token);
                //     window.location.href="/";
                // }
                console.log("success")
            },
            error: function(data){
                console.log(data);
            }
        })
        return false;
    })
});

function change_is_publish(){
    $("#is-pub").val(0);
}

function add_ingredient(){
    
    var in_counter = Number($("#in-counter").val());
    in_counter = in_counter+1;
    $("#in-counter").val(String(in_counter));

    var in_block=' <div id="ingredient-'+in_counter+'"> \
                            <div class="layui-inline ingredient-input" >\
                                <input type="text" id="ingredient-input-'+in_counter+'" name="ingredient-'+in_counter+'" placeholder="Please enter your ingredient here..." autocomplete="off" class="layui-input"> \
                            </div>\
                            <div class="layui-inline">\
                                <button type="button" id="ingredient-delete-'+in_counter+'" onclick= "delete_ingredient('+in_counter+')" class="layui-btn layui-btn-warm layui-btn-sm"  >\
                                    <i class="layui-icon">&#xe640;</i>\
                                </button>\
                            </div>\
                            <div class="layui-inline ingredient-input" >\
                                <input type="text" id="ingredient-shoppinglink-'+in_counter+'" name="ingredient-'+in_counter+'-shoppinglink" placeholder="Please enter shopping link here..." autocomplete="off" class="layui-input"> \
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

function add_step(){
    
    var step_counter = Number($("#step-counter").val());
    step_counter = step_counter+1;
    $("#step-counter").val(step_counter);
    console.log("add"+step_counter);

    step_block='<div id="step-'+step_counter+'">\
                        <div class="layui-inline" >\
                            <div class="layui-input-block step-explanation" >\
                                <textarea name="step-1" placeholder="Step explanation" class="layui-textarea" ></textarea>\
                            </div>\
                        </div>\
                        <div class="layui-inline" >\
                            <div class = "step-pic-boader">\
                                <button type="button" class="layui-btn layui-btn-warm upload-pic-step ">\
                                    <i class="layui-icon">&#xe654;</i>picture\
                                </button>\
                            </div>\
                        </div>\
                        <div class="layui-inline" >\
                            <button type="button" onclick= "delete_step('+step_counter+')" class="layui-btn layui-btn-sm layui-btn-primary" style="margin-left: 50px;">\
                                <i class="layui-icon">&#x1006;</i>\
                            </button>\
                        </div>\
                    </div>'
    $("#step-block").append(step_block);
}

function delete_step(del_id){
    $("#step-"+del_id).remove();
}


    
