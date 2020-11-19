from bottle import route, get, post, request, static_file, response, redirect,template,error
import configparser
import requests
import json

def get_backend():
    config = configparser.ConfigParser()
    config.read('config.ini')
    return config['SETTING']['backend']

root='http://'+get_backend()+':9999/api/'

def getToken():
    token = request.get_cookie('token')
    if token!=None:
        token=token.replace("%24","$")
        headers={}
        headers['token']=token

        url=root+'auth/'
        r = requests.get(url,headers=headers)
        rtv=json.loads(r.text)
        print(r.text)

        if rtv["msg"]=="success":
            return token,rtv["data"]["username"],rtv["data"]["avatar"]
        else:
            return None
    else:
        return None

@route('/img/<img:path>')
def serve_js(img):
    return static_file(img, root='../upload/')

@route('/js/<js:path>')
def serve_js(js):
    return static_file(js, root='static/js/')

@route('/icon/<icon:path>')
def serve_icon(icon):
    return static_file(icon, root='static/icon/')

@route('/font/<font:path>')
def serve_font(font):
    return static_file(font, root='static/font/')

@route('/css/<css:path>')
def serve_css(css):
    return static_file(css, root='static/css/')

@error(404)
def error404(error):
   return 'Page not Found'

@get('/signin')
def signin():
    url=request.query.redirect_url

    rtv = getToken()
    if rtv is not None:
        redirect('/')
    return template("signin",backend=get_backend(),page="signin",redirect_url=url)

@get('/signup')
def signup():
    return template("signup",backend=get_backend(),page="signup")

@get('/signout')
def signout():
    url=root+'auth/'
    header={'token': getToken()[0]}
    r = requests.request("DELETE", url, headers=header)
    response.delete_cookie("token")
    redirect('/')

@get('/forget')
def signout():
    
    return template("forget",backend=get_backend(),page="forget")

@get('/calendar')
def calendar():
    rtv = getToken()
    if rtv is not None:
        return template("calendar",backend=get_backend(),username=rtv[1],avatar=rtv[2],signin=True)
    else:
        redirect('/signin?redirect_url=calendar')
    
@get('/')
def index():
    rtv = getToken()

    url=root+'category/'

    r = requests.request("GET", url)
    category=json.loads(r.text)["data"]

    url=root+'index_recipe/'
    payload = {'position': "banner"}

    r = requests.request("GET", url,data=payload)
    banner=json.loads(r.text)["data"]

    payload = {'position': "hottest"}

    r = requests.request("GET", url,data=payload)
    hottest=json.loads(r.text)["data"]

    print(hottest)

    if rtv is not None:
        return template("index",backend=get_backend(),username=rtv[1],avatar=rtv[2],signin=True,category=category,banner=banner,hottest=hottest)
    else:
        return template("index",backend=get_backend(),signin=False,category=category,banner=banner,hottest=hottest)

@get('/profile')
def profile():
    rtv = getToken()
    if rtv is not None:
        url=root+'profile/'

        
        headers = {
        'token': rtv[0]
        }

        r = requests.request("GET", url, headers=headers)
        u_data=json.loads(r.text)["data"]

        checked_male=""
        checked_female=""
        checked_other=""

        if u_data['gender']=="male":
            checked_male="checked"
        elif u_data['gender']=="female":
            checked_female="checked"
        else:
            checked_other="checked"
        return template("profile",backend=get_backend(),username=rtv[1],avatar=rtv[2],signin=True,checked_male=checked_male,checked_female=checked_female,checked_other=checked_other,u_data=u_data)
    else:
        redirect('/signin?redirect_url=profile')


@get('/recipe_detail')
def recipe_detail():
    rid=request.query.id

    if len(rid)==0:
        redirect('/') 

    rtv = getToken()

    if rtv is not None:
        url=root+'recipe/'

        payload = {'id': rid}

        headers = {
        'token': rtv[0]
        }
        r = requests.request("GET", url, headers=headers, data = payload)
        recipe_data=json.loads(r.text)["data"]

        # print(recipe_data)

        return template("recipe_detail", backend=get_backend(), username = rtv[1], avatar = rtv[2], signin = True, recipe_data = recipe_data)
    else:
        redirect('/signin?redirect_url=recipe_detail?id='+rid)

@get('/search')
def search():
    keyword=request.query.keyword
    category=request.query.category

    if len(keyword)==0:
        redirect('/') 

    payload={}

    if category == "true":
        payload["category"] = keyword
    elif keyword != None:
        payload['recipe_title'] = keyword

    url=root+'search/'

    r = requests.request("GET", url, data = payload)
    search_data=json.loads(r.text)["data"]
    print(search_data)

    rtv = getToken()

    if search_data==None or search_data==[]:
        redirect("/")
        

    if rtv is not None:
        return template("search",backend=get_backend(),username=rtv[1],avatar=rtv[2],signin=True,search_data = search_data,keyword=keyword)
    else:
        return template("search", backend=get_backend(), signin = False, search_data = search_data, keyword=keyword)
    

@get('/upload_recipe')
def upload_recipe():
    rtv = getToken()
    if rtv is not None:
        url=root+'category/'

        r2 = requests.request("GET", url)
        category=json.loads(r2.text)["data"]

        return template("upload_recipe",backend=get_backend(),username=rtv[1],avatar=rtv[2],signin=True,category=category)
    else:
        redirect('/signin?redirect_url=upload_recipe')

@get('/profile_view')
def profile_view():
    tab=request.query.tab

    t1=""
    t2=""
    t3=""
    t1s=""
    t2s=""
    t3s=""

    if tab=="1":
        t1="layui-this"
        t1s="layui-show"
    elif tab=="2":
        t2="layui-this"
        t2s="layui-show"
    elif tab=="3":
        t3="layui-this"
        t3s="layui-show"
    else:
        t1="layui-this"
        t1s="layui-show"

    rtv = getToken()
    if rtv is not None:
        headers = {
        'token': rtv[0]
        }

        url=root+'follow/'
        r2 = requests.request("GET", url,headers=headers)
        follow_data=json.loads(r2.text)["data"]

        print(follow_data)

        url=root+'search_user/'
        r2 = requests.request("GET", url,headers=headers)
        recipes=json.loads(r2.text)["data"]

        return template("profile_view",backend=get_backend(),username=rtv[1],avatar=rtv[2],signin=True,follow_data=follow_data,recipes=recipes,t1=t1,t2=t2,t3=t3,t1s=t1s,t2s=t2s,t3s=t3s)
    else:
        redirect('/signin?redirect_url=profile_view')


@get('/edit_recipe')
def edit_recipe():
    rid=request.query.id

    if len(rid)==0:
        redirect('/') 

    rtv = getToken()

    if rtv is not None:
        url=root+'recipe/'

        payload = {'id': rid}

        headers = {
        'token': rtv[0]
        }
        r = requests.request("GET", url, headers=headers, data = payload)
        recipe_data=json.loads(r.text)["data"]

        url2=root+'category/'
        r2 = requests.request("GET", url2)
        category=json.loads(r2.text)["data"]

        return template("edit_recipe", backend=get_backend(), username = rtv[1], avatar = rtv[2], signin = True, recipe_data = recipe_data, category=category)
    else:
        redirect('/signin?redirect_url=edit_recipe?id='+rid)