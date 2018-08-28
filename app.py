# coding: utf8
import bottle
from bottle import template, route, request, redirect, get, post, hook, run
from argparse import ArgumentParser

import configparser
import os
import datetime

def warning(text):
    if not text:
        text = ""
    return template("warning.tpl", text=text)

@route('/')
def main_menu():
    return template('main_menu.tpl')

@post('/print')
def print_label():
    form = request.forms.getunicode
    copies = form('quantity')
    text = form('text')
    #os.system()
    text = "\\n".join(text.splitlines())
    with open("text.csv", "w+") as file:
        file.write(text)
    os.system("rm output.pdf")
    os.system("glabels-3-batch -i text.csv -c " + str(int(copies)) + " 100x50.glabels")
    os.system("lp -d " + args.printer + " output.pdf")

    return template('warning.tpl')

parser = ArgumentParser()
parser.add_argument("--port", dest="port",
                    help="port for the webfrontend")
parser.add_argument("--printer", dest="printer",
                    help="wich printer to use")
args = parser.parse_args()

run(host='0.0.0.0', port=args.port)
