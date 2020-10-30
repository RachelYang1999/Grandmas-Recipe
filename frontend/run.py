import bottle
import sys
from bottle import run
import controller

host = '0.0.0.0'
port = 8080
debug = True

run(host=host, port=port, debug=debug)

