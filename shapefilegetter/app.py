import os
import psycopg2
from flask import Flask, request, session, g, redirect, url_for, abort, \
     render_template, flash, jsonify

from dbconnect import conn
from utils import get_demo_shapefile

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!' 


@app.route('/demo_response')
def demo_response():
    shapefile = get_demo_shapefile()
    return jsonify(shapefile)

