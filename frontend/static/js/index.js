layui.use('table', function(){
  var table = layui.table;
  
  table.render({
    elem: '#test'
    ,url:'http://'+$("#backend").html()+':9999/api/auth/'
    ,where:{"token":$.cookie("token")}
    ,cellMinWidth: 80 
    ,cols: [[
      {field:'id', width:80, title: 'ID', sort: true}
      ,{field:'username', width:200, title: 'username'}
      ,{field:'password', width:400, title: 'password'}
      ,{field:'is_super', width:200, title: 'is_super'}
    ]],
    parseData: function(res){
    return {
      "code": 0,
      "msg": $.cookie("token"),
      "count": 2,
      "data": res
    };
  }
  });
});