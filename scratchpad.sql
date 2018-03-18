-- State query

SELECT gid, region, division, statefp, statens, geoid, stusps, name, lsad,
mtfcc, funcstat, aland, awater, intptlat, intptlon
FROM tiger2012.state ORDER BY geoid;


-- county query
SELECT
 gid, statefp, countyfp, countyns, geoid, name, namelsad, lsad, classfp, mtfcc,
 csafp, cbsafp, metdivfp, funcstat, aland, awater, intptlat, intptlon
FROM
	tiger2012.county
LIMIT 1
;


-- vtd query

SELECT gid, statefp10, countyfp10, vtdst10, geoid10, vtdi10, name10,
 namelsad10, lsad10, mtfcc10, funcstat10, aland10, awater10, intptlat10,
 intptlon10
FROM tiger2012.vtd
LIMIT 1;


-- vtd with extra info query
CREATE VIEW precinct_view AS
SELECT v.gid, v.statefp10, v.countyfp10, v.vtdst10, v.geoid10,
	s.name AS state_name, c.name AS county_name, v.namelsad10 AS precinct_name,
	v.the_geom
FROM tiger2012.vtd v
JOIN tiger2012.county c ON v.statefp10 = c.statefp AND v.countyfp10 = c.countyfp
JOIN tiger2012.state s ON v.statefp10 = s.statefp
;

