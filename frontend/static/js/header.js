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
        code: [
            /^[\S]{6,6}$/
            ,'Password length must be 8~24'
        ],
        email: [
            /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/
            ,'Password length must be 8~24'
        ],
    });

});


