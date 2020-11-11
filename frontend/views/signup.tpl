<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
 
    <title>Sign Up</title>
    <link rel="stylesheet" href="/css/layui.css">
    <link rel="stylesheet" href="/css/layui-suit.css">
 
</head>
<body>
 
%include('header_sign.tpl')
<div class="login-main layui-body">
    <header class="layui-elip">Sign Up</header>
    <form class="layui-form">
        <div class="layui-input-inline">
            <input type="text" name="username" required lay-verify="input" placeholder="Username" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-input-inline">
            <input type="password" id="password-first" name="password" required lay-verify="input|pass" placeholder="Password" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-input-inline">
            <input type="password" id="password-second" name="password-second" required lay-verify="input|pass|same" placeholder="Re-type Password" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-input-inline login-btn">
            <button lay-submit lay-filter="login" class="layui-btn">Sign Up</button>
        </div>
        <hr/>

        <a href="signin" class="fl">Have an account? Sign in here.</a></p>
    </form>
</div>

 
%include('footer.tpl')
<script type="text/javascript" src="/js/signup.js"></script>


</body>
</html>