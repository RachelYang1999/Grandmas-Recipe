from bottle import route, get, post, request, static_file, response, redirect,template
import configparser

def get_backend():
    config = configparser.ConfigParser()
    config.read('config.ini')
    return config['SETTING']['backend']

def getToken():
    token = request.get_cookie('token')
    return token

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

@get('/')
def get_login_controller():
    token = getToken()
    if token is not None:
        return template("index",backend=get_backend())
    else:
        redirect('/signin')

