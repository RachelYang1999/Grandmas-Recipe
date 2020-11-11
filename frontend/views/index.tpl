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
                    <ul class="layui-nav layui-nav-tree layui-inline layui-bg-orange" lay-filter="" style="margin-right: 10px;">
                        % for c in category:
                            <li class="layui-nav-item"><a style="color:#ffffff;" href="">{{c["category"]}} ({{c["total_recipe"]}})</a></li>
                        % end
                    </ul>
                </div>
                <div class="layui-col-md9">
                    <div class="layui-carousel " id="test1">
                        <div carousel-item>
                            % for c in category:
                             <div>{{c}}</div>
                            % end
                        </div>
                    </div>
                </div>
            </div>
            <br>
            <br>
            
            <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
                <ul class="layui-tab-title">
                    <li class="layui-this">Newest</li>
                    <li>Hotest</li>
                    <li>Simplest</li>
                </ul>
                <div class="layui-tab-content" style="height: 100px;">
                    <div class="layui-tab-item layui-show">
                        % for i in range (0,3):
                        <div class="layui-row layui-col-space10">
                            % for i in range (0,4):
                            <div class="layui-col-md3">
                                <img class="r_i" src="/icon/logo.png">
                                <div class="center">Newest 1</div>
                            </div>
                            % end
                        </div>
                        <br>
                        % end
                    </div>
                    <div class="layui-tab-item">
                        % for i in range (0,3):
                        <div class="layui-row layui-col-space10">
                            % for i in range (0,4):
                            <div class="layui-col-md3">
                                <img class="r_i" src="/icon/logo.png">
                                <div class="center">Hotest 2</div>
                            </div>
                            % end
                        </div>
                        <br>
                        % end
                    </div>
                    <div class="layui-tab-item">
                        % for i in range (0,3):
                        <div class="layui-row layui-col-space10">
                            % for i in range (0,4):
                            <div class="layui-col-md3">
                                <img class="r_i" src="/icon/logo.png">
                                <div class="center">Simplest 2</div>
                            </div>
                            % end
                        </div>
                        <br>
                        % end
                    </div>
                </div>
            </div> 

                
            
        </div>
    </div>

 
 %include('footer.tpl')
<script type="text/javascript" src="/js/index.js"></script>



</body>
</html>