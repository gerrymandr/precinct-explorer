DROP VIEW IF EXISTS precinct_view_2012 CASCADE;

CREATE VIEW precinct_view_2012
AS
SELECT
    v.gid,
    v.statefp10,
    v.countyfp10,
    v.vtdst10,
    v.geoid10,
    s.name AS state_name,
    c.name AS county_name,
    v.namelsad10 AS precinct_name,
    v.the_geom
FROM
    tiger2012.vtd v
    JOIN tiger2012.county c ON v.statefp10 = c.statefp
        AND v.countyfp10 = c.countyfp
        JOIN tiger2012.state s ON v.statefp10 = s.statefp;

ALTER TABLE precinct_view_2012 OWNER TO census;

DROP VIEW IF EXISTS cd_view_2012 CASCADE;

CREATE VIEW cd_view_2012
AS
SELECT
    s.name AS state_name,
    c.gid,
    c.statefp,
    c.cd112fp,
    c.namelsad,
    c.lsad,
    c.cdsessn,
    c.the_geom
FROM
    tiger2012.cd c
    JOIN tiger2012.state s ON c.statefp = s.statefp;

ALTER TABLE cd_view_2012 OWNER TO census;
