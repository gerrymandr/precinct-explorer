import os
import json
import psycopg2.extras

from flask import Flask, request, session, g, redirect, url_for, abort, \
     render_template, flash, jsonify
from flask_compress import Compress
from flask_cors import CORS

from werkzeug.contrib.cache import FileSystemCache

from dbconnect import get_dbconnection
from utils import get_demo_shapefile
from sqlalchemy import Table

app = Flask(__name__)
Compress(app)
CORS(app)

app_cache = FileSystemCache('app_cache', threshold=500, default_timeout=0)

@app.route('/')
def hello_world():
    return 'Hello, World!'


@app.route('/my-route')
def my_route():
  page = request.args.get('page', default = 1, type = int)
  filter = request.args.get('filter', default = '*', type = str)


def get_state_precincts_shapefile(state):
    response_obj = []
    state_query = """SELECT state_name, county_name, precinct_name,
        ST_AsGeoJSON(ST_Centroid(the_geom)) AS centroid, ST_AsGeoJSON(the_geom),
        polsby_popper(ST_Transform(the_geom, 4326)::geography),
        schwartzberg(ST_Transform(the_geom, 4326)::geography)
        FROM precinct_view_2012 WHERE state_name = %(state)s"""
    with get_dbconnection() as conn:
        with conn.cursor(cursor_factory=psycopg2.extras.DictCursor) as cur:
            cur.execute(state_query, {'state': state})
            for row in cur:
                row_obj = {}
                for key, value in row.iteritems():
                    if key in ('centroid', 'st_asgeojson'):
                        row_obj[key] = json.loads(value)
                    else:
                        row_obj[key] = value
                response_obj.append(row_obj)
    json_response_obj = json.dumps(response_obj)
    return json_response_obj


@app.route('/shapefiles/precincts')
def precinct_shapefiles():
    # get 'state' from URL param
    state = request.args.get('state', default=None, type=str)

    # get database connection and special psycopg2 DictCursor

    # return empty response if we don't have a state specified
    if state is None:
        return jsonify({})

    json_response_obj = app_cache.get(state)
    print 'state=%s cache=%s' % (state, json_response_obj is not None)
    if json_response_obj is None:
        json_response_obj = get_state_precincts_shapefile(state)
        app_cache.set(state, json_response_obj, timeout=0)

    response = app.response_class(
        response=json_response_obj,
        status=200,
        mimetype='application/json'
    )
    return response

@app.route('/shapefiles/cds')
def cd_shapefiles():
    state = request.args.get('state', default=None, type=str)
    precinct = Table('precinct_view_2012', metadata, autoload=True)
    if state is not None:
        precinct = precinct.select(precinct.c.geoid == geoid)

        result = precinct.execute()
        rows = result.fetchall()
        # except we want to make sure these are json formatted
        return rows
    else:
        # return nothing bc we don't want to
        return jsonify({})


# @app.route('/shapefiles/precinct_by_geoid'):
# def precinct_shapefiles():
#     geoid = request.args.get('geoid', default=None, type=str)
#     precinct = Table('precinct_view_2012', metadata, autoload=True)
#     if geoid is not None:
#         precinct = precinct.select(precinct.c.geoid == geoid)

#     result = precinct.execute()
#     rows = result.fetchall()
#     # except we want to make sure these are json formatted
#     return rows

@app.route('/demo_response')
def demo_response():
    shapefile = get_demo_shapefile()
    return jsonify(shapefile)


def main():
    app.run(threaded=True)

if __name__ == '__main__':
    main()
