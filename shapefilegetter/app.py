import os
import psycopg2
from flask import Flask, request, session, g, redirect, url_for, abort, \
     render_template, flash, jsonify

from dbconnect import conn, metadata
from utils import get_demo_shapefile

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'


@app.route('/my-route')
def my_route():
  page = request.args.get('page', default = 1, type = int)
  filter = request.args.get('filter', default = '*', type = str)


@app.route('/shapefiles/precinct'):
def precinct_shapefiles():
    geoid = request.args.get('geoid', default=None, type=str)
    precinct = Table('precinct_view_2012', metadata, autoload=True)
    if geoid is not None:
        precinct = precinct.select(precinct.c.geoid == geoid)

    result = precinct.execute()
    rows = result.fetchall()
    # except we want to make sure these are json formatted
    return rows 

@app.route('/demo_response')
def demo_response():
    shapefile = get_demo_shapefile()
    return jsonify(shapefile)

