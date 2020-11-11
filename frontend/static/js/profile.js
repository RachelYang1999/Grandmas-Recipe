layui.use(['upload','laydate'], function(){
  var upload = layui.upload;
  var laydate = layui.laydate;
   
  upload = upload.render({
    elem: '#test1'
    ,url: 'http://'+$("#backend").html()+':9999/api/'
    ,done: function(res){

    }
    ,error: function(){

    }
  });

  laydate.render({
    elem: '#test2',
    lang: 'en',
    showBottom: false
  });
});


function change(){

    layui.use('layer', function(){
        layer.open({
            type:1,
            content: '',
            title:"Change Password",
            btn: ['Confirm', 'Cancel'], 
  
            yes:function(index,layero){
                var form = new FormData();


                var settings = {
                };

                $.ajax(settings).done(function (response) {
                    
                });
                layer.close(index);  
            }
        }); 
    }); 
}