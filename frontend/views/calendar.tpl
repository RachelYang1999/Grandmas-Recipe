<!DOCTYPE html>

</html>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
 
    <title>Calendar</title>
    <link rel="stylesheet" href="/css/layui.css">
    <link rel="stylesheet" href="/css/layui-suit.css">
 
</head>
<body>

    <br>

    <header class="layui-elip">Choose the date:</header>
    <input type="text" id="date1" lay-verify="date1" class="layui-input test-item" style="width:300px;" value="" />
    <br>
    <table border="1" width="70%">
    <tr>
        <th style="width:7%"></th>
        <th style="width:11%">Sunday
        <br>
        <input id="Sunday" type="text" style="width:80px;border:0" value=""" readonly/>
        </th>
        <th style="width:11%">Monday
        <br>
        <input id="Monday" type="text" style="width:80px;border:0" value="" readonly/>
        </th>
        <th style="width:11%">Tuesday
        <br>
        <input id="Tuesday" type="text" style="width:80px;border:0" value="" readonly/>
        </th>
        <th style="width:11%">Wednesday
        <br>
        <input id="Wednesday" type="text" style="width:80px;border:0" value="" readonly/>
        </th>
        <th style="width:11%">Thursday
        <br>
        <input id="Thursday" type="text" style="width:80px;border:0" value="" readonly/>
        </th>
        <th style="width:11%">Friday
        <br>
        <input id="Friday" type="text" style="width:80px;border:0" value="" readonly/>
        </th>
        <th style="width:11%">Saturday
        <br>
        <input id="Saturday" type="text" style="width:80px;border:0" value="" readonly/>
        </th>
    </tr>
    <tr id='Breaky'>
        <td>Breaky</td>
        <td>None</td>
        <td>None</td>
        <td>None</td>
        <td>None</td>
        <td>None</td>
        <td>None</td>
        <td>None</td>
    </tr>
    <tr id='Lunch'>
        <td>Lunch</td>
        <td>None</td>
        <td>None</td>
        <td>None</td>
        <td>None</td>
        <td>None</td>
        <td>None</td>
        <td>None</td>
    </tr>
    <tr id='Dinner'>
        <td>Dinner</td>
        <td>None</td>
        <td>None</td>
        <td>None</td>
        <td>None</td>
        <td>None</td>
        <td>None</td>
        <td>None</td>
    </tr>
    </table>


 


<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/jquery.cookie.js"></script>
<script type="text/javascript" src="/js/layui.js"></script>
<script type="text/javascript" src="/js/calendar.js"></script>

Debug: <label name="backend" id="backend" value="{{backend}}">{{backend}}</label>

</body>
</html>