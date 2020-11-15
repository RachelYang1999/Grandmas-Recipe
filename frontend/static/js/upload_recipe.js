function add_ingredient(){
    var in_block = $("#ingredient-block").html();
    
    var in_counter = Number($("#in-counter").val());
    in_counter = in_counter+1;
    $("#in-counter").val(in_counter);
    console.log(in_counter);

    in_block=in_block+' <div id="ingre-'+in_counter+'"><div class="layui-inline ingredient-input" >\
                            <input type="text" name="ingredient-'+in_counter+'" placeholder="Please enter your ingredient here..." autocomplete="off" class="layui-input"> \
                        </div>\
                        <div class="layui-inline">\
                            <button type="button" onclick= "delete_ingredient('+in_counter+')" class="layui-btn layui-btn-warm layui-btn-sm"  >\
                                <i class="layui-icon">&#xe640;</i>\
                            </button>\
                        </div>\
                        <div class="layui-inline ingredient-input" >\
                            <input type="text" name="shoppinglink" placeholder="Please enter shopping link here..." autocomplete="off" class="layui-input"> \
                        </div></div>'
    $("#ingredient-block").html(in_block);
}

function delete_ingredient(del_id){
    var in_counter = Number($("#in-counter").val());
    var counter = in_counter;
    in_counter=in_counter-1;
    if (in_counter<1){
        in_counter=1;
    }
    $("#in-counter").val(in_counter);
    $("#ingre-"+del_id).remove();
    var j=1;
    for(var i=0; i<=counter;i++){
        if($("#ingre-"+String(i+1)).html()!=undefined){
            
            $("#ingre-"+String(i+1)).attr("id","ingre-"+String(j));

            j=j+1;
        }
        
    }
}

function add_step(){
    var step_block = $("#step-block").html();
    
    var step_counter = Number($("#step-counter").val());
    step_counter = step_counter+1;
    $("#step-counter").val(step_counter);
    console.log("add"+step_counter);

    step_block=step_block+'<div id="step-'+step_counter+'">\
                        <div class="layui-inline" >\
                            <label class="layui-form-label step-id" id="label-'+step_counter+'">'+step_counter+'</label>\
                        </div>\
                        <div class="layui-inline" >\
                            <div class="layui-input-block step-explanation" >\
                                <textarea name="step-explanation" placeholder="Step explanation" class="layui-textarea" ></textarea>\
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
    $("#step-block").html(step_block);
}

function delete_step(del_id){
    
    var step_counter = Number($("#step-counter").val());
    var counter = step_counter;
    step_counter=step_counter-1;
    if (step_counter<1){
        step_counter=1;
    }

    $("#step-counter").val(step_counter);
    $("#step-"+del_id).remove();
    var j=1;
    for(var i=0; i<=counter;i++){
       console.log($("#label-"+String(i+1)).html());
        if($("#label-"+String(i+1)).html()!=undefined){
            
            $("#label-"+String(i+1)).html(j);
            $("#label-"+String(i+1)).attr("id","label-"+String(j));
            $("#step-"+String(i+1)).attr("id","step-"+String(j));

            j=j+1;
        }
        
    }

    
    
}

