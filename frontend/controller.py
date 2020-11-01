from bottle import route, get, post, request, static_file, response, redirect

@route('/js/<js:path>')
def serve_js(js):
    return static_file(js, root='static/js/')

@route('/font/<font:path>')
def serve_font(font):
    return static_file(font, root='static/font/')

@route('/css/<css:path>')
def serve_css(css):
    return static_file(css, root='static/css/')

def serve_pages(html_page):
    return static_file(html_page, root='template/')

def getToken():
    token = request.get_cookie('token')
    return token

@get('/signin')
def signin():
    return serve_pages("signin.html")

@get('/signup')
def signup():
    return serve_pages("signup.html")

@get('/')
def get_login_controller():
    token = getToken()
    if token is not None:
        return serve_pages("index.html")
    else:
        redirect('/login')

