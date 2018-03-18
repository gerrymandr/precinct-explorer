import os
import json
import psycopg2

def get_dbconnection():
    pw = os.environ.get('CENSUS_DB_PW')
    username = os.environ.get('CENSUS_DB_USERNAME')
    host = os.environ.get('CENSUS_DB_HOST')
    db_name = os.environ.get('CENSUS_DB_NAME')
    conn = psycopg2.connect(dbname=db_name, user=username, password=pw, host=host)
    return conn

def get_shapefile():
    conn = get_dbconnection()
    cur = conn.cursor()
    get_one_shapefile = "SELECT ST_AsGeoJSON(the_geom) FROM tiger2012.cd LIMIT 1"
    cur.execute(get_one_shapefile)
    shapefile = cur.fetchone()
    shapefile = shapefile[0]
    return shapefile

def write_shapefile():
    filename = '/tmp/myshapefile.json'
    shapefile = get_shapefile()
    with open(filename, 'wb') as f:
        f.write(shapefile)
    print "Shapefile written to {}".format(filename)

if __name__ == '__main__':
    write_shapefile()

