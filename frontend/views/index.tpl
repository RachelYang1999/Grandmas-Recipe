<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
 
    <title>Home</title>
%include('header.tpl')
 


    <div class="layui-body index-body" style="left: 0px">
        <div class="layui-container">
            <div class="layui-row layui-col-space30">
                <div class="layui-col-md3">
                    <ul class="layui-nav layui-nav-tree layui-inline" lay-filter="" style="margin-right: 10px;">
                        % for c in category:
                            <li class="layui-nav-item"><a href="">{{c["category"]}} ({{c["total_recipe"]}})</a></li>
                        % end
                    </ul>
                </div>
                <div class="layui-col-md9">
                    <div class="layui-carousel" id="test1">
                        <div carousel-item>
                            % for c in category:
                             <div>{{c}}</div>
                            % end
                        </div>
                    </div>
                    <br>
                    <br>
                    <fieldset class="layui-elem-field layui-field-title">
                        <legend>Hots</legend>
                    </fieldset>
                    <div class="layui-row layui-col-space10">
                        <div class="layui-col-md4">
                            <img class="logo" src="/icon/logo.png">
                            1/3
                        </div>
                        <div class="layui-col-md4">
                            <img class="logo" src="/icon/logo.png">
                            1/3
                        </div>
                        <div class="layui-col-md4">
                            <img class="logo" src="/icon/logo.png">
                            1/3
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

 
 %include('footer.tpl')
<script type="text/javascript" src="/js/index.js"></script>



</body>
</html>