layui.use(['form','element'], function () {
    var form = layui.form;
    var element = layui.element;
    var $ = layui.$;

    form.verify({
        content: function (value) {
            if(value==""){
                return "Missing field";
            }
        },
        pass: [
            /^[\S]{8,24}$/
            ,'Password length must be 8~24'
        ],
        same: function (value) {
            if($("#password-first").val()!=$("#password-second").val()){
                return "The password are different";
            }
        },
        same_change: function (value) {
            if($("#new-password").val()!=$("#new-password-re").val()){
                return "The password are different";
            }
        },
        code: [
            /^[\S]{8,8}$/
            ,'Code length must be 8'
        ],
        email: [
            /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/
            ,'This is not an email'
        ],
    });
    $.ajax({
            url:$("#backend").html()+'api/csrftoken/',
            type: 'get',
            success: function (res) {
                $.cookie("ctoken",res.data.ctoken);
                console.log(res);
            }
        })

});


