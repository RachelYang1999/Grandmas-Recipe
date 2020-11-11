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
    if rtv is not None:
        return template("index",backend=get_backend(),username=rtv[1],avatar=rtv[2],signin=True)
    else:
        return template("index",backend=get_backend(),signin=False)

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
