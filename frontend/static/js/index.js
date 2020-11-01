layui.use('table', function(){
  var table = layui.table;
  
  table.render({
    elem: '#test'
    ,url:'http://172.17.0.7:9999/api/auth/'
    ,where:{"token":$.cookie("token")}
    ,cellMinWidth: 80 
    ,cols: [[
      {field:'id', width:80, title: 'ID', sort: true}
      ,{field:'username', width:200, title: 'username'}
      ,{field:'password', width:400, title: 'password'}
      ,{field:'is_super', width:200, title: 'is_super'}
    ]],
    parseData: function(res){ //res 即为原始返回的数据
    return {
      "code": 0, //解析接口状态
      "msg": $.cookie("token"), //解析提示文本
      "count": 2, //解析数据长度
      "data": res //解析数据列表
    };
  }
  });
});