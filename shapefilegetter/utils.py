from dbconnect import conn

from flask import after_this_request, request
from cStringIO import StringIO as IO
import gzip
import functools 

def get_demo_shapefile():
    cur = conn.cursor()
    get_one_shapefile = "SELECT ST_AsGeoJSON(the_geom) FROM tiger2012.cd LIMIT 1"
    cur.execute(get_one_shapefile)
    shapefile = cur.fetchone()
    shapefile = shapefile[0]
    return shapefile


def create_view():
    cur = conn.cursor()
    cur.execute("DROP VIEW IF EXISTS precinct_view_2012")
    create = """CREATE VIEW precinct_view_2012 AS
        SELECT v.gid, v.statefp10, v.countyfp10, v.vtdst10, v.geoid10,
            s.name AS state_name, c.name AS county_name,
            v.namelsad10 AS precinct_name, ST_AsGeoJSON(v.the_geom)
        FROM tiger2012.vtd v
        JOIN tiger2012.county c ON v.statefp10 = c.statefp
            AND v.countyfp10 = c.countyfp
        JOIN tiger2012.state s ON v.statefp10 = s.statefp
        """
    cur.execute(create)
    conn.commit()
    cur.close()
    conn.close()
