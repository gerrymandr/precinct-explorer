from dbconnect import conn

def get_demo_shapefile():
    cur = conn.cursor()
    get_one_shapefile = "SELECT ST_AsGeoJSON(the_geom) FROM tiger2012.cd LIMIT 1"
    cur.execute(get_one_shapefile)
    shapefile = cur.fetchone()
    shapefile = shapefile[0]
    return shapefile