layui.use('upload', function(){
  var upload = layui.upload;
   
  var uploadInst = upload.render({
    elem: '#test1'
    ,url: 'http://'+$("#backend").html()+':9999/api/'
    ,done: function(res){

    }
    ,error: function(){

    }
  });
});