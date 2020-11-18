function following_layer(){
    layer.open({
        type: 1,
        title:'Following',
        skin: 'layui-layer-rim', //加上边框
        area: ['420px', '240px'], //宽高
        content: 'html内容',
        area: ['400px', '400px'],
        btn: ['按钮一', '按钮二', '按钮三'],
        btnAlign: 'r'
        
    });
    layer.msg('不开心。。', {icon: 5});
    

}