    <link rel="stylesheet" href="/css/layui.css">
    <link rel="stylesheet" href="/css/layui-suit.css">
 
</head>

<body class="layui-layout-body">
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header layui-bg-gray">
            <div class="layui-container">
                <div class="layui-logo"><a href="/"><img class="logo" src="/icon/logo.png">Grandma's Recipe</a></div>
                
                <ul class="layui-nav layui-layout-left" lay-filter="">

                    <li class="layui-nav-item">
                        
                        <div class="layui-inline search-bar">
                            <form class="layui-form" action="/search">
                                <div class="layui-inline input-item">
                                    <input type="text" id="r_title" name="keyword" required lay-verify="content" placeholder="Type in keywords" autocomplete="off" class="layui-input" />
                                </div>
                                <button class="layui-btn layui-bg-orange" lay-submit>Search</button>
                            </form>

                        </div>  

                    </li>
                </ul>

                <ul id="changeable" class="layui-nav layui-layout-right" >
                    <li class="layui-nav-item header-up">
                        <a href="/upload_recipe"><button class="layui-btn layui-btn-radius layui-bg-primary"><i class='layui-icon layui-icon-add-1'></i>NEW</button></a>
                    </li>
                    % if signin:
                    <li class="layui-nav-item header-up" lay-unselect="">
                        <a style="color:#393D49;" href="javascript:;"><img id="avatar-header" src="/img/{{avatar}}" class="layui-nav-img">{{username}}</a>
                        <dl class="layui-nav-child">
                        <dd><a href="/profile">My Profile</a></dd>
                        <dd><a href="/profile_view?tab=1">My Recipe</a></dd>
                        <dd><a href="/profile_view?tab=2">My Favourite</a></dd>
                        <hr>
                        <dd><a href="/signout">Sign Out</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item seperater">|</li>
                    <li class="layui-nav-item"><a href="/calendar"><i class="layui-icon layui-icon-date cal-header" ></i></a></li>
                    % else:

                    <li class="layui-nav-item"><a style="color:#393D49;" href="/signin">Sign In</a></li>
                    <li class="layui-nav-item"><a style="color:#393D49;" href="/signup">Sign Up</a></li>
                    % end
                    
                </ul>
            </div>
        </div>