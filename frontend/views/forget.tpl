<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
 
    <title>Sign In</title>
%include('header_sign.tpl')
<div class="login-main layui-body">
    <header class="layui-elip">Forget Password</header>
    <form class="layui-form">
        <div class="layui-input-inline">
            <input type="text" name="username" required lay-verify="content" placeholder="E-mail" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-input-inline">
            <input type="password" name="password" required lay-verify="code|email" placeholder="Code" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-input-inline">
            <input type="password" name="password" required lay-verify="content|pass" placeholder="Password" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-input-inline">
            <input type="password" name="password" required lay-verify="content|pass|same" placeholder="Re-type Password" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-input-inline login-btn">
            <button lay-submit lay-filter="login" class="layui-btn">Submit</button>
        </div>

    </form>
</div>

%include('footer.tpl')

<script type="text/javascript" src="/js/signin.js"></script>



</body>
</html>