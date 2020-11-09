from bottle import route, get, post, request, static_file, response, redirect,template
import configparser
import requests
import json

def get_backend():
    config = configparser.ConfigParser()
    config.read('config.ini')
    return config['SETTING']['backend']

def getToken():
    token = request.get_cookie('token').replace("%24","$")
    if token!=None:
        headers={}
        headers['token']=token
        print(token)

        url='http://'+get_backend()+':9999/api/auth/'
        r = requests.get(url,headers=headers)
        rtv=json.loads(r.text)

        if rtv["msg"]=="success":
            return token
        else:
            return None
    else:
        return None

@route('/js/<js:path>')
def serve_js(js):
    return static_file(js, root='static/js/')

@route('/font/<font:path>')
def serve_font(font):
    return static_file(font, root='static/font/')

@route('/css/<css:path>')
def serve_css(css):
    return static_file(css, root='static/css/')

@get('/signin')
def signin():
    token = getToken()
    if token is not None:
        return template("index",backend=get_backend())
    return template("signin",backend=get_backend())

@get('/signup')
def signup():
    return template("signup",backend=get_backend())

@get('/signout')
def signup():
    response.delete_cookie("token")
    return template("signin",backend=get_backend())

@get('/calendar')
def calendar():
    token = getToken()
    if token is not None:
        return template("calendar",backend=get_backend())
    else:
        redirect('/signin')
    
@get('/')
def get_login_controller():
    token = getToken()
    if token is not None:
        redirect('/calendar')
    else:
        redirect('/signin')

