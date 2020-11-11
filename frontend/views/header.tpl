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
                        
                        <form class="layui-form">
                            <div class="layui-inline">
                                <div class="layui-input-inline input-item">
                                    <input type="text" name="title" required lay-verify="input" placeholder="Type in keywords" autocomplete="off" class="layui-input" />
                                </div>
                            </div>
                            <div class="layui-inline">
                                <div class="layui-input-inline select-item">
                                    <select name="search_type" >
                                        <option value="category">Category</option>
                                        <option value="title">Recipe Title</option>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <button class="layui-btn layui-bg-orange">Search</button>
                                </div>
                            </div>
                        </form>  

                    </li>
                </ul>

                <ul id="changeable" class="layui-nav layui-layout-right" >
                    % if signin:
                    <li class="layui-nav-item " lay-unselect="">
                        <a style="color:#393D49;" href="javascript:;"><img src="/img/{{avatar}}" class="layui-nav-img">{{username}}</a>
                        <dl class="layui-nav-child">
                        <dd><a href="/profile">My Profile</a></dd>
                        <dd><a href="javascript:;">My Favourite</a></dd>
                        <dd><a href="javascript:;">My Recipe</a></dd>
                        <dd><a href="/signout">Signout</a></dd>
                        </dl>
                    </li>
                    <li style="margin:0px 10px 0px 10px;color:#393D49;" class="layui-nav-item">|</li>
                    <li class="layui-nav-item"><a href="/calendar"><i class="layui-icon layui-icon-date" style="margin:20px 0px 0px -15px;font-size: 30px; color: #393D49;"></i></a></li>
                    % else:

                    <li class="layui-nav-item"><a style="color:#393D49;" href="/signin">Signin</a></li>
                    <li class="layui-nav-item"><a style="color:#393D49;" href="/signup">Signup</a></li>
                    % end
                    
                </ul>
            </div>
        </div>