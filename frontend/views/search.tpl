<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/search.css">
<title>Search</title>
%include('header.tpl') 

    <div class="layui-body index-body">
        <div class="layui-container">
            <div class = "margin_to_header">
                <div class = "layui-row">
                    <h1> "{{keyword}}" Related results</h1>
                </div>
            </div>
            <div class="center">       
                % for r in search_data:
                    
                    <div class = "layui-row ">
                        <div class = "height_width">
                            <a href = "/recipe_detail?id={{r['id']}}">
                                <div class="layui-col-md5">
                                    <img src='/img/{{r["recipe_src"]}}' width="200" height="200" style="margin-top: 15px;">
                                </div>
                                <div class="layui-col-md7">
                                    <br>
                                    <br>
                                    <div style="font-family:Comic Sans MS;font-weight: bold;font-size: large;">{{r["title"]}}</div>
                                    <br>
                                    <br>
                                    <div style="font-family:Palatino;font-weight: lighter; text-align: center; line-height: 20px;">{{r["description"]}}</div>
                                    <br> 
                                </div>
                            </a>
                        </div>    
                    </div>
                %end 
            </div>
        </div>
    </div>
%include('footer.tpl')
</body>
</html>