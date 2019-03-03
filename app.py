# coding: utf8
import bottle
from bottle import template, route, request, redirect, get, post, hook, run
from argparse import ArgumentParser
import fpdf
import os

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

def output_pdf(text):
    pdf = fpdf.FPDF(format=(100,50))
    pdf.set_margins(3, 3, 3)
    pdf.set_auto_page_break(False)
    pdf.add_page()

    font_size = 40
    is_text_ok = False
    pdf.set_font("Arial", size=font_size)
    while(not is_text_ok):
        font_size -= 0.5
        pdf.set_font_size(font_size)
        is_text_ok = True
        for line in text.split("\n"):
            if pdf.get_string_width(line) > 90:
                is_text_ok = False

    pdf.multi_cell(95, 11, txt=text, align="C")
    pdf.output("print.pdf")

@post('/print')
def print_label():
    form = request.forms.getunicode
    copies = form('quantity')
    copies = min(5, int(copies))
    text = form('text')
    text = "\n".join(text.splitlines())
    output_pdf(text)
    os.system("lp -d " + args.printer + " print.pdf")
    return template('warning.tpl')


parser = ArgumentParser()
parser.add_argument("--port", dest="port",
                    help="port for the webfrontend")
parser.add_argument("--printer", dest="printer",
                    help="wich printer to use")
args = parser.parse_args()


run(host='0.0.0.0', port=args.port)
