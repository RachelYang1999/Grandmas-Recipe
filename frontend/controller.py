from bottle import route, get, post, request, static_file, response, redirect

@route('/js/<js:path>')
def serve_js(js):
    return static_file(js, root='static/js/')

@route('/font/<font:path>')
def serve_font(font):
    return static_file(font, root='static/font/')

@route('/html/<html:path>')
def serve_pages(html_page):
    return static_file(html_page, root='static/html/')

@route('/css/<css:path>')
def serve_css(css):
    return static_file(css, root='static/css/')

@get('/test')
def test():
    return serve_pages("test.html")