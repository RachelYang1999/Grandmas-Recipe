function following_layer(){

    layer.open({
            type:1,
            area: ['500px', '300px'],
            content: $("#following-block").html(),
            title:"Following",
            btn: ['Confirm', 'Cancel'], 
  
            yes:function(index,layero){
                var form = new FormData();
                form.append("recipe_id", $('#r_id').val());
                form.append("date", datas[0]);
                form.append("meal_type", datas[1]);

                var settings = {
                    "url": "http://"+$("#backend").html()+":9999/api/calendar/",
                    "method": "POST",
                    "timeout": 0,
                    "headers": {
                        "token": $.cookie("token")
                    },
                    "processData": false,
                    "mimeType": "multipart/form-data",
                    "contentType": false,
                    "data": form
                };

                $.ajax(settings).done(function (response) {
                    var dateTemp = datas[0].split("-");
                    var nDate = new Date(dateTemp[1] + '-' + dateTemp[2] + '-' + dateTemp[0]);
                    var date = new Date(nDate);
                    newDate(date);
                });
                layer.close(index);
                    
            }
        }); 
    

}