<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
 
    <title>Sign Up</title>
    <link rel="stylesheet" href="/css/layui.css">
    <link rel="stylesheet" href="/css/layui-suit.css">
 
</head>
<body>
 
<div class="login-main">
    <header class="layui-elip">Sign Up</header>
    <form class="layui-form">
        <div class="layui-input-inline">
            <input type="text" name="username" required lay-verify="required" placeholder="Username" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-input-inline">
            <input type="password" name="password" required lay-verify="required" placeholder="Password" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-input-inline login-btn">
            <button lay-submit lay-filter="login" class="layui-btn">Sign Up</button>
        </div>
        <hr/>

        <a href="signin" class="fl">Have an account? Sign in here.</a></p>
    </form>
</div>

 


<script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/jquery.cookie.js"></script>
<script type="text/javascript" src="/js/layui.js"></script>
<script type="text/javascript" src="/js/signup.js"></script>

Debug: <label name="backend" id="backend" value="{{backend}}">{{backend}}</label>

</body>
</html>