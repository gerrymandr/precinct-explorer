import os
import psycopg2
from sqlalchemy import create_engine, MetaData, Table
import geoalchemy2

def get_dbconnection():
    pw = os.environ.get('CENSUS_DB_PW')
    username = os.environ.get('CENSUS_DB_USERNAME')
    host = os.environ.get('CENSUS_DB_HOST')
    db_name = os.environ.get('CENSUS_DB_NAME')
    conn = psycopg2.connect(dbname=db_name, user=username, password=pw, host=host)
    return conn


def get_engine():
    pw = os.environ.get('CENSUS_DB_PW')
    username = os.environ.get('CENSUS_DB_USERNAME')
    host = os.environ.get('CENSUS_DB_HOST')
    db_name = os.environ.get('CENSUS_DB_NAME')
    connection_str = (
        'postgresql+psycopg2://{username}:{pw}@{host}:5432/{db_name}').format(
            username=username, pw=pw, host=host, db_name=db_name)
    engine = create_engine(connection_str)
    return engine

def get_metadata():
    engine = get_engine()
    metadata = MetaData(bind=engine)  


# metadata = get_metadata()
conn = get_dbconnection()