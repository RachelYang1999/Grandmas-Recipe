    <link rel="stylesheet" href="/css/layui.css">
    <link rel="stylesheet" href="/css/layui-suit.css">
 
</head>

<body class="layui-layout-body" style="overflow: hidden">
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header layui-bg-gray">
            <div class="layui-container">
                 <div class="layui-logo"><a href="/"><img class="logo" src="/icon/logo.png">Grandma's Recipe</a></div>
            
                <ul id="changeable" class="layui-nav layui-layout-right">
                    % if page == "signup": 
                    <li class="layui-nav-item"><a style="color:#393D49;" href="/signin">Signin</a></li>
                    % elif page == "signin": 
                    <li class="layui-nav-item"><a style="color:#393D49;" href="/signup">Signup</a></li>
                    % else:
                    <li class="layui-nav-item"><a style="color:#393D49;" href="/signin">Signin</a></li>
                    <li class="layui-nav-item"><a style="color:#393D49;" href="/signup">Signup</a></li>
                    % end
                </ul>
            </div>
        </div>