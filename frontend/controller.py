from bottle import route, get, post, request, static_file, response, redirect,template
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
        redirect('/signin')
    
@get('/')
def index():
    rtv = getToken()

    url=root+'category/'

    r = requests.request("GET", url)
    category=json.loads(r.text)["data"]

    if rtv is not None:
        return template("index",backend=get_backend(),username=rtv[1],avatar=rtv[2],signin=True,category=category)
    else:
        return template("index",backend=get_backend(),signin=False,category=category)

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
        redirect('/')


@get('/recipe_detail')
def recipe_detail():
    rtv = getToken()

    if rtv is not None:
        url=root+'recipe/'

        payload = {'id': '14'}

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

@get('/search')
def search():
    keyword=request.query.keyword

    url=root+'search/'

    payload = 'recipe_title={}'.format(keyword)
    headers = {
        'Content-Type': 'application/x-www-form-urlencoded'
    }

    r = requests.request("GET", url, headers=headers,data = payload)
    search_data=json.loads(r.text)

    rtv = getToken()

    if rtv is not None:
        return template("search",backend=get_backend(),username=rtv[1],avatar=rtv[2],signin=True,search_data = search_data)
    else:
        return template("search", backend=get_backend(), signin = False, search_data = search_data)
    




