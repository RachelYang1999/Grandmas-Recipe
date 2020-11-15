from bottle import route, get, post, request, static_file, response, redirect,template
import configparser
import requests
import json

def get_backend():
    config = configparser.ConfigParser()
    config.read('config.ini')
    return config['SETTING']['backend']

def getToken():
    token = request.get_cookie('token')
    if token!=None:
        token=token.replace("%24","$")
        headers={}
        headers['token']=token

        url='http://'+get_backend()+':9999/api/auth/'
        r = requests.get(url,headers=headers)
        rtv=json.loads(r.text)

        if rtv["msg"]=="success":
            return token,rtv["username"],rtv["avatar"]
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

@get('/signin')
def signin():
    rtv = getToken()
    if rtv is not None:
        redirect('/')
    return template("signin",backend=get_backend(),page="signin")

@get('/signup')
def signup():
    return template("signup",backend=get_backend(),page="signup")

@get('/signout')
def signout():
    url='http://'+get_backend()+':9999/api/auth/?action=signout'
    payload={'token': getToken()[0]}
    r = requests.request("POST", url, data=payload)
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
        redirect('/signin')
    
@get('/')
def index():
    rtv = getToken()

    url = "http://172.17.0.7:9999/api/category/"

    r = requests.request("GET", url)
    category=json.loads(r.text)

    if rtv is not None:
        return template("index",backend=get_backend(),username=rtv[1],avatar=rtv[2],signin=True,category=category)
    else:
        return template("index",backend=get_backend(),signin=False,category=category)

@get('/profile')
def profile():
    rtv = getToken()
    if rtv is not None:
        url = "http://172.17.0.7:9999/api/user/profile/"

        headers = {
        'token': rtv[0]
        }

        r = requests.request("GET", url, headers=headers)
        u_data=json.loads(r.text)

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
        redirect('/')


@get('/recipe_detail')
def recipe_detail():
    rtv = getToken()

    if rtv is not None:
        url = "http://172.17.0.10:9999/api/recipe/"

        payload = {'id': '9'}

        files = [

        ]

        headers = {
        'token': rtv[0]
        }
        r = requests.request("GET", url, headers=headers, data = payload, files = files)
        recipe_data=json.loads(r.text)

        # response = requests.request("GET", url, headers = headers, data = payload, files = files)
        # return response

        return template("recipe_detail", backend=get_backend(), username = rtv[1], avatar = rtv[2], signin = True, recipe_data = recipe_data)
    else:
        redirect('/signin')

# @get('/search')
@get('/search/<title>/<category>')
def search(title,category):

    # url = "http://172.17.0.8:9999/api/search/"

    # payload = 'recipe_title=Fried%20Rice'
    # headers = {
    # 'token': '$1$80f10c9c7f4047a79cf5be667378bac5',
    # 'Content-Type': 'application/x-www-form-urlencoded'
    # }

    # response = requests.request("GET", url, headers=headers, data = payload)


    # rtv = getToken()
    # if rtv is not None:
    url = "http://172.17.0.8:9999/api/search/"
    # payload = 'recipe_title=Fried%20Rice'
    payload = 'recipe_title=param'
        
        # files = [

        # ]

    # headers = {
    #     'token': rtv[0]
    #     }
    headers = {
        # 'token': '$1$53ec7a0b425549cb9be7ce998105fb53',
        'Content-Type': 'application/x-www-form-urlencoded'
    }

    r = requests.request("GET", url, headers=headers,data = payload)
    search_data=json.loads(r.text)

    
# response = requests.request("GET", url, headers=headers, data = payload)

# print(response.text.encode('utf8'))
    
    return template("search", backend=get_backend(), page="signup", signin = False, search_data = search_data)
    # return template("search", backend=get_backend(), page="signup", signin = True)
    # else:
    #     redirect('/')




