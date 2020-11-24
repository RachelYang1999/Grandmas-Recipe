import bottle
from bottle import request, static_file, response, redirect,template
import configparser
import requests
import json

app = application = bottle.Bottle()

def get_backend():
    config = configparser.ConfigParser()
    config.read('config.ini')
    return config['SETTING']['backend']

root=get_backend()+'api/'

def getToken():
    token = request.get_cookie('token')
    if token!=None:
        token=token.replace("%24","$")
        headers={}
        headers['token']=token

        url=root+'auth/'
        r = requests.get(url,headers=headers)
        rtv=json.loads(r.text)
        # print(r.text)

        if rtv["msg"]=="success":
            return token,rtv["data"]["username"],rtv["data"]["avatar"]
        else:
            return None
    else:
        return None

@app.route('/img/<img:path>')
def serve_js(img):
    return static_file(img, root='../upload/')

@app.route('/js/<js:path>')
def serve_js(js):
    return static_file(js, root='static/js/')

@app.route('/icon/<icon:path>')
def serve_icon(icon):
    return static_file(icon, root='static/icon/')

@app.route('/font/<font:path>')
def serve_font(font):
    return static_file(font, root='static/font/')

@app.route('/css/<css:path>')
def serve_css(css):
    return static_file(css, root='static/css/')

@app.error(404)
def error404(error):
   return static_file(html, root='/app/frontend/error.html')

@app.get('/signin')
def signin():
    url=request.query.redirect_url

    rtv = getToken()
    if rtv is not None:
        redirect('/')
    return template("signin",backend=get_backend(),page="signin",redirect_url=url)

@app.get('/signup')
def signup():
    return template("signup",backend=get_backend(),page="signup")

@app.get('/signout')
def signout():
    url=root+'auth/'
    header={'token': getToken()[0]}
    r = requests.request("DELETE", url, headers=header)
    response.delete_cookie("token")
    redirect('/')

@app.get('/forget')
def forget():
    rtv = getToken()
    if rtv is not None:
        redirect('/')
    return template("forget",backend=get_backend(),page="forget")

@app.get('/calendar')
def calendar():
    rtv = getToken()
    if rtv is not None:
        headers = {
        'token': rtv[0]
        }
        url2=root+'fav_recipe/'
        r3= requests.request("get", url2,headers=headers)
        favrecipes=json.loads(r3.text)["data"]
        # print(favrecipes)

        return template("calendar",backend=get_backend(),username=rtv[1],avatar=rtv[2],signin=True,favrecipes=favrecipes)
    else:
        redirect('/signin?redirect_url=calendar')
    
@app.get('/')
def index():
    rtv = getToken()

    url=root+'category/'

    r = requests.request("get", url)
    category=json.loads(r.text)["data"]

    url=root+'index_recipe/'
    payload = {'position': "banner"}

    r = requests.request("get", url,data=payload)
    banner=json.loads(r.text)["data"]

    payload = {'position': "hottest"}

    r = requests.request("get", url,data=payload)
    hottest=json.loads(r.text)["data"]

    # print(hottest)

    if rtv is not None:
        return template("index",backend=get_backend(),username=rtv[1],avatar=rtv[2],signin=True,category=category,banner=banner,hottest=hottest)
    else:
        return template("index",backend=get_backend(),signin=False,category=category,banner=banner,hottest=hottest)

@app.get('/profile')
def profile():
    rtv = getToken()
    if rtv is not None:
        url=root+'profile/'

        
        headers = {
        'token': rtv[0]
        }

        r = requests.request("get", url, headers=headers)
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


@app.get('/recipe_detail')
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
        r = requests.request("get", url, headers=headers, data = payload)
        recipe_data=json.loads(r.text)["data"]

        # print(recipe_data)

        return template("recipe_detail", backend=get_backend(), username = rtv[1], avatar = rtv[2], signin = True, recipe_data = recipe_data)
    else:
        redirect('/signin?redirect_url=recipe_detail?id='+rid)

@app.get('/search')
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

    r = requests.request("get", url, data = payload)
    search_data=json.loads(r.text)["data"]
    # print(search_data)

    rtv = getToken()

    if search_data==None or search_data==[]:
        redirect("/")
        

    if rtv is not None:
        return template("search",backend=get_backend(),username=rtv[1],avatar=rtv[2],signin=True,search_data = search_data,keyword=keyword)
    else:
        return template("search", backend=get_backend(), signin = False, search_data = search_data, keyword=keyword)
    

@app.get('/upload_recipe')
def upload_recipe():
    rtv = getToken()
    if rtv is not None:
        url=root+'category/'

        r2 = requests.request("get", url)
        category=json.loads(r2.text)["data"]

        return template("upload_recipe",backend=get_backend(),username=rtv[1],avatar=rtv[2],signin=True,category=category)
    else:
        redirect('/signin?redirect_url=upload_recipe')

@app.get('/profile_view')
def profile_view():
    userid=request.query.userid
    tab=request.query.tab

    userid="?userid="+userid
    if userid==None:
        userid=""


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

        url=root+'follow/'+userid
        r2 = requests.request("get", url,headers=headers)
        follow_data=json.loads(r2.text)["data"]

        # print(follow_data)

        url=root+'search_user/'+userid
        r2 = requests.request("get", url,headers=headers)
        recipes=json.loads(r2.text)["data"]

        url2=root+'fav_recipe/'+userid
        r3= requests.request("get", url2,headers=headers)
        favrecipes=json.loads(r3.text)["data"]
        # print(favrecipes)

        url2=root+'auth/'+userid
        r3= requests.request("get", url2,headers=headers)
        userdata=json.loads(r3.text)["data"]
        # print(userdata)

        return template("profile_view",backend=get_backend(),username=rtv[1],avatar=rtv[2],signin=True,follow_data=follow_data,recipes=recipes,t1=t1,t2=t2,t3=t3,t1s=t1s,t2s=t2s,t3s=t3s,favrecipes=favrecipes,userdata=userdata)
    else:
        redirect('/signin?redirect_url=profile_view')


@app.get('/edit_recipe')
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
        r = requests.request("get", url, headers=headers, data = payload)
        recipe_data=json.loads(r.text)["data"]

        url2=root+'category/'
        r2 = requests.request("get", url2)
        category=json.loads(r2.text)["data"]
        

        return template("edit_recipe", backend=get_backend(), username = rtv[1], avatar = rtv[2], signin = True, recipe_data = recipe_data, category=category)
    else:
        redirect('/signin?redirect_url=edit_recipe?id='+rid)



if __name__ == '__main__':
    bottle.run(app=app,host='0.0.0.0', port=8080, debug=True)