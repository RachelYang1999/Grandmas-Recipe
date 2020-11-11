layui.use(['form','element'], function () {
    var form = layui.form;
    var element = layui.element;

    // var logged='<li class="layui-nav-item" lay-unselect="">\
    //                 <a id="user_name_final" href="javascript:;"></a>\
    //                 <dl class="layui-nav-child">\
    //                 <dd><a href="/calendar">My Calendar</a></dd>\
    //                 <dd><a href="javascript:;">My Profile</a></dd>\
    //                 <dd><a href="javascript:;">My Favourite</a></dd>\
    //                 <dd><a href="javascript:;">My Recipe</a></dd>\
    //                 <dd><a href="/signout">Signout</a></dd>\
    //                 </dl>\
    //             </li>'

    // var notlogged='<li class="layui-nav-item"><a href="">Signin</a></li>\
    //             <li class="layui-nav-item"><a href="">Signup</a></li>'

    // if ($.cookie("token")!=undefined){
    //     $('#changeable').html(logged);
    //     $('#user_name_final').html('<img id="p_logo" src="//t.cn/RCzsdCq" class="layui-nav-img">'+$('#username').val());
    //     $('#p_logo').attr('src',"/img/"+$('#avatar').val());

        
    // }else{
    //     $('#changeable').html(notlogged);
    // };
    // rd();

});

// function rd() {
//     layui.use('element', function () {
//         var element = layui.element;
//         var layFilter = $("#changeable").attr('lay-filter');
//         element.render('changeable', layFilter);
//     })
// }