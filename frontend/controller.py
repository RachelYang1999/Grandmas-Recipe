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
        redirect('/calendar')
    return template("signin",backend=get_backend(),)

@get('/signup')
def signup():
    return template("signup",backend=get_backend())

@get('/signout')
def signup():
    response.delete_cookie("token")
    redirect('/signin')

@get('/calendar')
def calendar():
    rtv = getToken()
    if rtv is not None:
        return template("calendar",backend=get_backend(),username=rtv[1],avatar=rtv[2])
    else:
        redirect('/signin')
    
@get('/')
def get_login_controller():
    rtv = getToken()
    if rtv is not None:
        redirect('/calendar')
    else:
        redirect('/signin')

