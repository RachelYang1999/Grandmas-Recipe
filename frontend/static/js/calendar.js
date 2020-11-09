layui.use(['laydate'], function () {
    var layer = layui.layer;
    var laydate = layui.laydate;

    var date = new Date();
    newDate(date);
    laydate.render({
        elem: '#date1',
        max: "2021-12-31",
        format: "yyyy-MM-dd~yyyy-MM-dd",
        done: function (value, date, endDate) {
            var today = new Date(value.substring(0, 10));
            newDate(today);
        },
        lang: 'en'
    });
});

function get_data(start, end) {
    console.log(start + " ~ " + end);


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
    if (weekday == 0) {
        $("#date1").val(end + "~" + start);
    } else {
        $("#date1").val(start + "~" + end);
    }
    get_data(start, end);

}