function add_ingredient(){
    
    var counter=Number($("#in-counter").val())+1;
    $("#in-counter").val(counter);
    var test=$("#test_i").html();
    test=test+'<div class="ingredient-margin">\
                        <div class="layui-inline ingredient-margin-input" >\
                            <input type="text" name="ingredient-'+counter+'" placeholder="Please enter your ingredient here..." autocomplete="off" class="layui-input"> \
                        </div>\
                        <div class="layui-inline ">\
                            <button type="button" class="layui-btn layui-btn-warm layui-btn-sm">\
                                <i class="layui-icon">&#xe640;</i>\
                            </button>\
                        </div>\
                        <div class="layui-inline ingredient-margin-input" >\
                            <input type="text" name="shoppinglink" placeholder="Please enter shopping link here..." autocomplete="off" class="layui-input"> \
                        </div>\
                    </div>';
    $("#test_i").html(test);
    
    console.log($("#in-counter").val());

}