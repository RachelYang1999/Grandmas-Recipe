<!DOCTYPE html>

</html>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
 
    <title>Calendar</title>

        %include('header.tpl')

        <div class="cal-main layui-body"">
            <header>Choose the date:</header>
            <input type="text" id="date1" lay-verify="date1" class="layui-input data-item" style="width:300px;" value="" />
            <br>
            <table class="cal-table" width="100%">
                <tr>
                    <th style="width:7%"></th>
                    <th style="width:11%">Sunday
                    <br>
                    <input id="Sunday" type="text" style="width:80px;border:0" value="" readonly/>
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
        </div>
    

 %include('footer.tpl')

<script type="text/javascript" src="/js/calendar.js"></script>

</body>
</html>