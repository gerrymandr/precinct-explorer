S3_BACKUP_URL = https://s3.amazonaws.com/census-backup/tiger/2012/tiger2012_backup.sql.gz
GS_BACKUP_URL = https://storage.googleapis.com/gerrymandr-census-backup-7gklgatcldhafsq/data
PG_URI       ?= fill_me_in

data/tiger2012_backup.sql.gz:
	curl -o data/tiger2012_backup.sql.gz -L -O -C - $(S3_BACKUP_URL)

data/nc.cd.csv.gz:
	curl -o data/nc.cd.csv.gz -L -O -C - $(GS_BACKUP_URL)/nc.cd.csv.gz

data/nc.vtd.csv.gz:
	curl -o data/nc.vtd.csv.gz -L -O -C - $(GS_BACKUP_URL)/nc.vtd.csv.gz

data/nc.county.csv.gz:
	curl -o data/nc.county.csv.gz -L -O -C - $(GS_BACKUP_URL)/nc.county.csv.gz

data/nc.state.csv.gz:
	curl -o data/nc.state.csv.gz -L -O -C - $(GS_BACKUP_URL)/nc.state.csv.gz

mock_data: data/nc.cd.csv.gz data/nc.vtd.csv.gz data/nc.county.csv.gz data/nc.state.csv.gz

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

load_testdb: mock_data
	psql -U census -q -f schema/test/20180328-init-tiger2012.sql census
	psql -U census -q -f schema/migrations/20180324-init-tables.sql census
	gzcat data/nc.cd.csv.gz | psql -U census -c "COPY tiger2012.cd FROM STDIN CSV HEADER;" census
	gzcat data/nc.vtd.csv.gz | psql -U census -c "COPY tiger2012.vtd FROM STDIN CSV HEADER;" census
	gzcat data/nc.state.csv.gz | psql -U census -c "COPY tiger2012.state FROM STDIN CSV HEADER;" census
	gzcat data/nc.county.csv.gz | psql -U census -c "COPY tiger2012.county FROM STDIN CSV HEADER;" census
