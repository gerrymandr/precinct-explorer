import os
import psycopg2

def get_dbconnection():
    pw = os.environ.get('CENSUS_DB_PW')
    username = os.environ.get('CENSUS_DB_USERNAME')
    host = os.environ.get('CENSUS_DB_HOST')
    db_name = os.environ.get('CENSUS_DB_NAME')
    conn = psycopg2.connect(dbname=db_name, user=username, password=pw, host=host)
    return conn


conn = get_dbconnection()