#!/usr/local/bin/python

from flask import Flask

app = Flask(__name__)


@app.route('/')
def home():
    return "<h1>Hello</h1>"


@app.route('/app')
def blog():
    return "Hello, from App!"


@app.route('/health_check')
def health_check():
    return "It works!"


if __name__ == '__main__':
    app.run(threaded=True, host='0.0.0.0', port=3000, debug=True)
