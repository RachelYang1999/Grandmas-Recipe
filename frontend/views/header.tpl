    <link rel="stylesheet" href="/css/layui.css">
    <link rel="stylesheet" href="/css/layui-suit.css">
 
</head>

<body class="layui-layout-body" style="overflow: hidden">
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header ">
            <div class="layui-container">
                <div class="layui-logo"><img class="logo" src="/icon/logo.png">Grandma's Recipe</div>
                
                <ul class="layui-nav layui-layout-left" lay-filter="">

                    <li class="layui-nav-item">
                        
                        <form class="layui-form">
                            <div class="layui-inline">
                                <div class="layui-input-inline input-item">
                                    <input type="text" name="title" required lay-verify="required" placeholder="Type in keywords" autocomplete="off" class="layui-input" />
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
                                    <button class="layui-btn layui-bg-red">Search</button>
                                </div>
                            </div>
                        </form>  

                    </li>
                </ul>

                <ul class="layui-nav layui-layout-center ">
                    <li class="layui-nav-item"><a href="/">Home</a></li>
                    <li class="layui-nav-item"><a href="/category">Category</a></li>
                    <li class="layui-nav-item"><a href="/hots">Hots</a></li>
                </ul>

                <ul id="changeable" class="layui-nav layui-layout-right" >
                    % if signin:
                    <li class="layui-nav-item" lay-unselect="">
                        <a href="javascript:;"><img src="/img/{{avatar}}" class="layui-nav-img">{{username}}</a>
                        <dl class="layui-nav-child">
                        <dd><a href="/calendar">My Calendar</a></dd>
                        <dd><a href="/profile">My Profile</a></dd>
                        <dd><a href="javascript:;">My Favourite</a></dd>
                        <dd><a href="javascript:;">My Recipe</a></dd>
                        <dd><a href="/signout">Signout</a></dd>
                        </dl>
                    </li>
                    % else:

                    <li class="layui-nav-item"><a href="/signin">Signin</a></li>
                    <li class="layui-nav-item"><a href="/signup">Signup</a></li>
                    % end
                    
                </ul>
            </div>
        </div>