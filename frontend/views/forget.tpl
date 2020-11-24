<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
 
    <title>Forget Password</title>
%include('header_sign.tpl')
<div class="login-main layui-body">
    <header class="layui-elip">Forget Password</header>
    <form class="layui-form" id="code-block">
        <div class="layui-input-inline">
            <input type="text" id="email" name="email"  placeholder="E-mail" autocomplete="off"class="layui-input email" >
        </div>
        <div class="layui-input-inline">
            <button class="layui-btn" lay-submit lay-filter="send" >Send Code</button>
        </div>
    </form>
    <form class="layui-form layui-hide" id="password-block">
        <div class="layui-input-inline">
            <input type="test" name="code" required lay-verify="code" placeholder="Verification Code" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-input-inline">
            <input id="password-first" type="password" name="new-password" required lay-verify="content|pass" placeholder="Password" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-input-inline">
            <input id="password-second" type="password" required lay-verify="content|same" placeholder="Re-type Password" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-input-inline login-btn">
            <button lay-submit lay-filter="forget" class="layui-btn">Submit</button>
        </div>

    </form>
</div>

%include('footer.tpl')

<script type="text/javascript" src="/js/forget.js"></script>



</body>
</html>