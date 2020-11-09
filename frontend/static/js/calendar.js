layui.use(['laydate'], function () {
    var layer = layui.layer;
    var laydate = layui.laydate;
    var date = new Date();
    newDate(date);
    laydate.render({
        elem: '#date1',
        max: "2021-12-31",
        format: "yyyy-MM-dd ~ yyyy-MM-dd",
        done: function (value, date, endDate) {
            var today = new Date(value.substring(0, 10));
            newDate(today);
        },
        lang: 'en'
    });
});


function get_data(start, end) {
    $.ajax({
        url: 'http://'+$("#backend").html()+':9999/api/calendar/',
        type:'get',
        data: {start: start,
            end: end},
        dataType: 'json',
        headers: {"token": $.cookie("token")},
        success: function(response) {
            console.log(response);
            
            var tableStr="<td>Breaky</td>";
            for ( var i = 0; i < 7; i++) {
                tableStr = tableStr +"<td>"+ get_recipe(response,getNewDay(start,i),"breakfirst") + "</td>";
            };
            $("#Breaky").html(tableStr);

            var tableStr="<td>Lunch</td>";
            for ( var i = 0; i < 7; i++) {
                tableStr = tableStr +"<td>"+ get_recipe(response,getNewDay(start,i),"lunch") + "</td>";
            };
            $("#Lunch").html(tableStr);

            var tableStr="<td>Dinner</td>";
            for ( var i = 0; i < 7; i++) {
                tableStr = tableStr +"<td>"+ get_recipe(response,getNewDay(start,i),"dinner") + "</td>";
            };
            $("#Dinner").html(tableStr);

        },
    });
}

function get_recipe(response,date,type){
    for ( var i = 0; i < response.length; i++) { 
        if (response[i].date==date && response[i].meal_type==type){
            return  '<input id="'+date+":"+type+'" type="text" style="width:80px;border:0" value="'+response[i].recipe_id+'" readonly/>' + "  <input type='submit' value='change' onclick='add_cal(\""+date+":"+type+"\")'>"
        }
    }
    return '<input id="'+date+":"+type+'" type="text" style="width:80px;border:0" value="" readonly/>' + "<input type='submit' value='add' onclick='add_cal(\""+date+":"+type+"\")'>"
}
 
function add_cal(data){
    console.log(data);
    var datas = data.split(":");
    layui.use('layer', function(){
        layer.open({
            type:1,
            content: 'reciep_id: <input id="r_id" type="text" style="width:80px;" value="" />',
            title:"Select Recipe",
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
    }); 
    

    
}

function newDate(day) {
    var weekday = day.getDay();
    var monday;
    var sunday;
    if (weekday == 0) {
        monday = new Date(1000 * 60 * 60 * 24 * (weekday + 6) + day.getTime());
        sunday = day;
    } else {
        monday = new Date(1000 * 60 * 60 * 24 * (0 - weekday) + day.getTime());
        sunday = new Date(1000 * 60 * 60 * 24 * (6 - weekday) + day.getTime());
    }
    var month = monday.getMonth() + 1;
    if (month < 10) {
        month = "0" + month;
    }
    var day1 = monday.getDate();
    if (day1 < 10) {
        day1 = "0" + day1;
    }
    var start = "" + monday.getFullYear() + "-" + month + "-" + day1;
    var month2 = sunday.getMonth() + 1;
    if (month2 < 10) {
        month2 = "0" + month2;
    }
    var day2 = sunday.getDate();
    if (day2 < 10) {
        day2 = "0" + day2;
    }
    var end = "" + sunday.getFullYear() + "-" + month2 + "-" + day2;
    
    var first;

    if (weekday == 0) {
        $("#date1").val(end + " ~ " + start);
        first = end;

        console.log(end + " ~ " + start);
        get_data(end, start);
    } else {
        $("#date1").val(start + " ~ " + end);
        first = start;

        console.log(start + " ~ " + end);
        get_data(start, end);
    }

    $("#Sunday").val(first);
    $("#Monday").val(getNewDay(first,1));
    $("#Tuesday").val(getNewDay(first,2));
    $("#Wednesday").val(getNewDay(first,3));
    $("#Thursday").val(getNewDay(first,4));
    $("#Friday").val(getNewDay(first,5));
    $("#Saturday").val(getNewDay(first,6));
}


function getNewDay(dateTemp, days) {
    var dateTemp = dateTemp.split("-");
    var nDate = new Date(dateTemp[1] + '-' + dateTemp[2] + '-' + dateTemp[0]);
    var millSeconds = Math.abs(nDate) + (days * 24 * 60 * 60 * 1000);
    var rDate = new Date(millSeconds);
    var year = rDate.getFullYear();
    var month = rDate.getMonth() + 1;
    if (month < 10) month = "0" + month;
    var date = rDate.getDate();
    if (date < 10) date = "0" + date;
    return (year + "-" + month + "-" + date);
}