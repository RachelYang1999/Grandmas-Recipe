<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/search.css">
<title>Search</title>
%include('header.tpl') 
</head>
<body>
    <div class="layui-body index-body">
        <div class="layui-container">
            <div class = "margin_to_header">
                <div class = "layui-row">
                    <h1> "{{keyword}}" Related results</h1>
                </div>
            </div>
            <div class="center">
                </script>          
                    <br>
                    <ul>
                        % for r in search_data:
                           
                            <div class = "layui-row ">
                                    
                                <div class = "layui-row grid-demo"> 
                                   
                                    <div class = "height_width">
                                        <a href = "/recipe_detail?id={{r['id']}}">
                                            <div class="layui-col-md5">
                                                picture
                                            </div>
                                            <div class="layui-col-md7">
                                                <br>
                                                <br>
                                                <br>    
                                            %for elem in r:
                                                <li>{{elem}}: {{r[elem]}}</li>
                                                <br>
                                            %end
                                            </div>
                                        </a>
                                    </div>    
                                </div>
                            </div>
                        %end
                    </ul>   
                </script>
            </div>
        </div>
    </div>
%include('footer.tpl')
<script type="text/javascript" src="/js/signin.js"></script>
</body>
</html>