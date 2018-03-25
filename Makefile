BACKUP_URL = https://s3.amazonaws.com/census-backup/tiger/2012/tiger2012_backup.sql.gz
PG_URI ?= fill_me_in

data/tiger2012_backup.sql.gz:
	curl -o data/tiger2012_backup.sql.gz -L -O -C - $(BACKUP_URL)

data/nc.cd.csv:
	psql -c "COPY (select * from tiger2012.cd where statefp = '37') TO STDOUT CSV HEADER;" $(PG_URI) > data/nc.cd.csv

data/nc.vtd.csv:
	psql -c "COPY (select * from tiger2012.vtd where statefp10 = '37') TO STDOUT CSV HEADER;" $(PG_URI) > data/nc.vtd.csv

data/nc.county.csv:
	psql -c "COPY (select * from tiger2012.county where statefp = '37') TO STDOUT CSV HEADER;" $(PG_URI) > data/nc.county.csv

data/nc.state.csv:
	psql -c "COPY (select * from tiger2012.state where statefp = '37') TO STDOUT CSV HEADER;" $(PG_URI) > data/nc.state.csv

backup_data: data/nc.cd.csv data/nc.vtd.csv data/nc.county.csv data/nc.state.csv

.PHONY: setup_db
setup_db:
	dropdb --if-exists census
	createdb census
	dropuser --if-exists census
	psql -c "CREATE USER census;"
	psql -c "CREATE EXTENSION IF NOT EXISTS postgis;" census
	psql -c "GRANT SELECT ON spatial_ref_sys TO PUBLIC;" census
	psql -c "GRANT ALL ON geometry_columns TO census;" census
	psql -c 'GRANT ALL PRIVILEGES ON DATABASE "census" to census;' census
	psql -q -U census -f third_party/pg_compactness/create_compactness_functions.sql census

restore_db: data/tiger2012_backup.sql.gz
	gzcat data/tiger2012_backup.sql.gz | psql -U census -q census
	psql -U census -q -f schema/migrations/20180324-init-tables.sql census

load_testdb: backup_data
	psql -U census -q -f schema/test/20180328-init-tiger2012.sql census
	psql -U census -q -f schema/migrations/20180324-init-tables.sql census
	cat data/nc.cd.csv | psql -c "COPY tiger2012.cd FROM STDIN CSV HEADER;" census
	cat data/nc.vtd.csv | psql -c "COPY tiger2012.vtd FROM STDIN CSV HEADER;" census
	cat data/nc.state.csv | psql -c "COPY tiger2012.state FROM STDIN CSV HEADER;" census
	cat data/nc.county.csv | psql -c "COPY tiger2012.county FROM STDIN CSV HEADER;" census
