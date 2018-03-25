CREATE EXTENSION IF NOT EXISTS postgis;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.6
-- Dumped by pg_dump version 10.1

--
-- Name: tiger2012; Type: SCHEMA; Schema: -; Owner: census
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.6
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: tiger2012; Type: SCHEMA; Schema: -; Owner: census
--

CREATE SCHEMA tiger2012;


ALTER SCHEMA tiger2012 OWNER TO census;

SET search_path = tiger2012, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: county; Type: TABLE; Schema: tiger2012; Owner: census
--

CREATE TABLE county (
    gid integer NOT NULL,
    statefp character varying(2),
    countyfp character varying(3),
    countyns character varying(8),
    geoid character varying(5),
    name character varying(100),
    namelsad character varying(100),
    lsad character varying(2),
    classfp character varying(2),
    mtfcc character varying(5),
    csafp character varying(3),
    cbsafp character varying(5),
    metdivfp character varying(5),
    funcstat character varying(1),
    aland double precision,
    awater double precision,
    intptlat character varying(11),
    intptlon character varying(12),
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 4326))
);


ALTER TABLE county OWNER TO census;

--
-- Name: state; Type: TABLE; Schema: tiger2012; Owner: census
--

CREATE TABLE state (
    gid integer NOT NULL,
    region character varying(2),
    division character varying(2),
    statefp character varying(2),
    statens character varying(8),
    geoid character varying(2),
    stusps character varying(2),
    name character varying(100),
    lsad character varying(2),
    mtfcc character varying(5),
    funcstat character varying(1),
    aland double precision,
    awater double precision,
    intptlat character varying(11),
    intptlon character varying(12),
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 4326))
);


ALTER TABLE state OWNER TO census;

--
-- Name: vtd; Type: TABLE; Schema: tiger2012; Owner: census
--

CREATE TABLE vtd (
    gid integer NOT NULL,
    statefp10 character varying(2),
    countyfp10 character varying(3),
    vtdst10 character varying(6),
    geoid10 character varying(11),
    vtdi10 character varying(1),
    name10 character varying(100),
    namelsad10 character varying(100),
    lsad10 character varying(2),
    mtfcc10 character varying(5),
    funcstat10 character varying(1),
    aland10 double precision,
    awater10 double precision,
    intptlat10 character varying(11),
    intptlon10 character varying(12),
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 4326))
);


ALTER TABLE vtd OWNER TO census;

--
-- Name: aiannh; Type: TABLE; Schema: tiger2012; Owner: census
--

CREATE TABLE aiannh (
    gid integer NOT NULL,
    aiannhce character varying(4),
    aiannhns character varying(8),
    geoid character varying(5),
    name character varying(100),
    namelsad character varying(100),
    lsad character varying(2),
    classfp character varying(2),
    comptyp character varying(1),
    aiannhr character varying(1),
    mtfcc character varying(5),
    funcstat character varying(1),
    aland double precision,
    awater double precision,
    intptlat character varying(11),
    intptlon character varying(12),
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 4326))
);


ALTER TABLE aiannh OWNER TO census;

--
-- Name: aiannh_gid_seq; Type: SEQUENCE; Schema: tiger2012; Owner: census
--

CREATE SEQUENCE aiannh_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE aiannh_gid_seq OWNER TO census;

--
-- Name: aiannh_gid_seq; Type: SEQUENCE OWNED BY; Schema: tiger2012; Owner: census
--

ALTER SEQUENCE aiannh_gid_seq OWNED BY aiannh.gid;


--
-- Name: aits; Type: TABLE; Schema: tiger2012; Owner: census
--

CREATE TABLE aits (
    gid integer NOT NULL,
    aiannhce character varying(4),
    trsubce character varying(3),
    trsubns character varying(8),
    geoid character varying(7),
    name character varying(100),
    namelsad character varying(100),
    lsad character varying(2),
    classfp character varying(2),
    mtfcc character varying(5),
    funcstat character varying(1),
    aland double precision,
    awater double precision,
    intptlat character varying(11),
    intptlon character varying(12),
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 4326))
);


ALTER TABLE aits OWNER TO census;

--
-- Name: aits_gid_seq; Type: SEQUENCE; Schema: tiger2012; Owner: census
--

CREATE SEQUENCE aits_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE aits_gid_seq OWNER TO census;

--
-- Name: aits_gid_seq; Type: SEQUENCE OWNED BY; Schema: tiger2012; Owner: census
--

ALTER SEQUENCE aits_gid_seq OWNED BY aits.gid;


--
-- Name: anrc; Type: TABLE; Schema: tiger2012; Owner: census
--

CREATE TABLE anrc (
    gid integer NOT NULL,
    statefp character varying(2),
    anrcfp character varying(5),
    anrcns character varying(8),
    geoid character varying(7),
    name character varying(100),
    namelsad character varying(100),
    lsad character varying(2),
    classfp character varying(2),
    mtfcc character varying(5),
    funcstat character varying(1),
    aland double precision,
    awater double precision,
    intptlat character varying(11),
    intptlon character varying(12),
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 4326))
);


ALTER TABLE anrc OWNER TO census;

--
-- Name: anrc_gid_seq; Type: SEQUENCE; Schema: tiger2012; Owner: census
--

CREATE SEQUENCE anrc_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE anrc_gid_seq OWNER TO census;

--
-- Name: anrc_gid_seq; Type: SEQUENCE OWNED BY; Schema: tiger2012; Owner: census
--

ALTER SEQUENCE anrc_gid_seq OWNED BY anrc.gid;


--
-- Name: bg; Type: TABLE; Schema: tiger2012; Owner: census
--

CREATE TABLE bg (
    gid integer NOT NULL,
    statefp character varying(2),
    countyfp character varying(3),
    tractce character varying(6),
    blkgrpce character varying(1),
    geoid character varying(12),
    namelsad character varying(13),
    mtfcc character varying(5),
    funcstat character varying(1),
    aland double precision,
    awater double precision,
    intptlat character varying(11),
    intptlon character varying(12),
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 4326))
);


ALTER TABLE bg OWNER TO census;

--
-- Name: bg_gid_seq; Type: SEQUENCE; Schema: tiger2012; Owner: census
--

CREATE SEQUENCE bg_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bg_gid_seq OWNER TO census;

--
-- Name: bg_gid_seq; Type: SEQUENCE OWNED BY; Schema: tiger2012; Owner: census
--

ALTER SEQUENCE bg_gid_seq OWNED BY bg.gid;


--
-- Name: cbsa; Type: TABLE; Schema: tiger2012; Owner: census
--

CREATE TABLE cbsa (
    gid integer NOT NULL,
    csafp character varying(3),
    cbsafp character varying(5),
    geoid character varying(5),
    name character varying(100),
    namelsad character varying(100),
    lsad character varying(2),
    memi character varying(1),
    mtfcc character varying(5),
    aland double precision,
    awater double precision,
    intptlat character varying(11),
    intptlon character varying(12),
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 4326))
);


ALTER TABLE cbsa OWNER TO census;

--
-- Name: cbsa_gid_seq; Type: SEQUENCE; Schema: tiger2012; Owner: census
--

CREATE SEQUENCE cbsa_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cbsa_gid_seq OWNER TO census;

--
-- Name: cbsa_gid_seq; Type: SEQUENCE OWNED BY; Schema: tiger2012; Owner: census
--

ALTER SEQUENCE cbsa_gid_seq OWNED BY cbsa.gid;


--
-- Name: cd; Type: TABLE; Schema: tiger2012; Owner: census
--

CREATE TABLE cd (
    gid integer NOT NULL,
    statefp character varying(2),
    cd112fp character varying(2),
    geoid character varying(4),
    namelsad character varying(41),
    lsad character varying(2),
    cdsessn character varying(3),
    mtfcc character varying(5),
    funcstat character varying(1),
    aland double precision,
    awater double precision,
    intptlat character varying(11),
    intptlon character varying(12),
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 4326))
);


ALTER TABLE cd OWNER TO census;

--
-- Name: cd_gid_seq; Type: SEQUENCE; Schema: tiger2012; Owner: census
--

CREATE SEQUENCE cd_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cd_gid_seq OWNER TO census;

--
-- Name: cd_gid_seq; Type: SEQUENCE OWNED BY; Schema: tiger2012; Owner: census
--

ALTER SEQUENCE cd_gid_seq OWNED BY cd.gid;


--
-- Name: census_name_lookup; Type: TABLE; Schema: tiger2012; Owner: census
--

CREATE TABLE census_name_lookup (
    display_name character varying,
    simple_name character varying,
    prefix_match_name character varying,
    sumlevel character varying(3),
    geoid character varying,
    full_geoid character varying(40),
    priority smallint,
    population integer,
    aland numeric(15,0),
    awater numeric(15,0),
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 4326))
);


ALTER TABLE census_name_lookup OWNER TO census;

--
-- Name: cnecta; Type: TABLE; Schema: tiger2012; Owner: census
--

CREATE TABLE cnecta (
    gid integer NOT NULL,
    cnectafp character varying(3),
    geoid character varying(3),
    name character varying(100),
    namelsad character varying(100),
    lsad character varying(2),
    mtfcc character varying(5),
    aland double precision,
    awater double precision,
    intptlat character varying(11),
    intptlon character varying(12),
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 4326))
);


ALTER TABLE cnecta OWNER TO census;

--
-- Name: concity; Type: TABLE; Schema: tiger2012; Owner: census
--

CREATE TABLE concity (
    gid integer NOT NULL,
    statefp character varying(2),
    conctyfp character varying(5),
    conctyns character varying(8),
    geoid character varying(7),
    name character varying(100),
    namelsad character varying(100),
    lsad character varying(2),
    classfp character varying(2),
    mtfcc character varying(5),
    funcstat character varying(1),
    aland double precision,
    awater double precision,
    intptlat character varying(11),
    intptlon character varying(12),
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 4326))
);


ALTER TABLE concity OWNER TO census;

--
-- Name: cousub; Type: TABLE; Schema: tiger2012; Owner: census
--

CREATE TABLE cousub (
    gid integer NOT NULL,
    statefp character varying(2),
    countyfp character varying(3),
    cousubfp character varying(5),
    cousubns character varying(8),
    geoid character varying(10),
    name character varying(100),
    namelsad character varying(100),
    lsad character varying(2),
    classfp character varying(2),
    mtfcc character varying(5),
    cnectafp character varying(3),
    nectafp character varying(5),
    nctadvfp character varying(5),
    funcstat character varying(1),
    aland double precision,
    awater double precision,
    intptlat character varying(11),
    intptlon character varying(12),
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 4326))
);


ALTER TABLE cousub OWNER TO census;

--
-- Name: csa; Type: TABLE; Schema: tiger2012; Owner: census
--

CREATE TABLE csa (
    gid integer NOT NULL,
    csafp character varying(3),
    geoid character varying(3),
    name character varying(100),
    namelsad character varying(100),
    lsad character varying(2),
    mtfcc character varying(5),
    aland double precision,
    awater double precision,
    intptlat character varying(11),
    intptlon character varying(12),
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 4326))
);


ALTER TABLE csa OWNER TO census;

--
-- Name: elsd; Type: TABLE; Schema: tiger2012; Owner: census
--

CREATE TABLE elsd (
    gid integer NOT NULL,
    statefp character varying(2),
    elsdlea character varying(5),
    geoid character varying(7),
    name character varying(100),
    lsad character varying(2),
    lograde character varying(2),
    higrade character varying(2),
    mtfcc character varying(5),
    sdtyp character varying(1),
    funcstat character varying(1),
    aland double precision,
    awater double precision,
    intptlat character varying(11),
    intptlon character varying(12),
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 4326))
);


ALTER TABLE elsd OWNER TO census;

--
-- Name: metdiv; Type: TABLE; Schema: tiger2012; Owner: census
--

CREATE TABLE metdiv (
    gid integer NOT NULL,
    csafp character varying(3),
    cbsafp character varying(5),
    metdivfp character varying(5),
    geoid character varying(10),
    name character varying(100),
    namelsad character varying(100),
    lsad character varying(2),
    mtfcc character varying(5),
    aland double precision,
    awater double precision,
    intptlat character varying(11),
    intptlon character varying(12),
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 4326))
);


ALTER TABLE metdiv OWNER TO census;

--
-- Name: necta; Type: TABLE; Schema: tiger2012; Owner: census
--

CREATE TABLE necta (
    gid integer NOT NULL,
    cnectafp character varying(3),
    nectafp character varying(5),
    geoid character varying(5),
    name character varying(100),
    namelsad character varying(100),
    lsad character varying(2),
    nmemi character varying(1),
    mtfcc character varying(5),
    aland double precision,
    awater double precision,
    intptlat character varying(11),
    intptlon character varying(12),
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 4326))
);


ALTER TABLE necta OWNER TO census;

--
-- Name: nectadiv; Type: TABLE; Schema: tiger2012; Owner: census
--

CREATE TABLE nectadiv (
    gid integer NOT NULL,
    cnectafp character varying(3),
    nectafp character varying(5),
    nctadvfp character varying(5),
    geoid character varying(10),
    name character varying(100),
    namelsad character varying(100),
    lsad character varying(2),
    mtfcc character varying(5),
    aland double precision,
    awater double precision,
    intptlat character varying(11),
    intptlon character varying(12),
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 4326))
);


ALTER TABLE nectadiv OWNER TO census;

--
-- Name: place; Type: TABLE; Schema: tiger2012; Owner: census
--

CREATE TABLE place (
    gid integer NOT NULL,
    statefp character varying(2),
    placefp character varying(5),
    placens character varying(8),
    geoid character varying(7),
    name character varying(100),
    namelsad character varying(100),
    lsad character varying(2),
    classfp character varying(2),
    pcicbsa character varying(1),
    pcinecta character varying(1),
    mtfcc character varying(5),
    funcstat character varying(1),
    aland double precision,
    awater double precision,
    intptlat character varying(11),
    intptlon character varying(12),
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 4326))
);


ALTER TABLE place OWNER TO census;

--
-- Name: puma; Type: TABLE; Schema: tiger2012; Owner: census
--

CREATE TABLE puma (
    gid integer NOT NULL,
    statefp10 character varying(2),
    pumace10 character varying(5),
    geoid10 character varying(7),
    namelsad10 character varying(100),
    mtfcc10 character varying(5),
    funcstat10 character varying(1),
    aland10 double precision,
    awater10 double precision,
    intptlat10 character varying(11),
    intptlon10 character varying(12),
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 4326))
);


ALTER TABLE puma OWNER TO census;

--
-- Name: scsd; Type: TABLE; Schema: tiger2012; Owner: census
--

CREATE TABLE scsd (
    gid integer NOT NULL,
    statefp character varying(2),
    scsdlea character varying(5),
    geoid character varying(7),
    name character varying(100),
    lsad character varying(2),
    lograde character varying(2),
    higrade character varying(2),
    mtfcc character varying(5),
    sdtyp character varying(1),
    funcstat character varying(1),
    aland double precision,
    awater double precision,
    intptlat character varying(11),
    intptlon character varying(12),
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 4326))
);


ALTER TABLE scsd OWNER TO census;

--
-- Name: sldl; Type: TABLE; Schema: tiger2012; Owner: census
--

CREATE TABLE sldl (
    gid integer NOT NULL,
    statefp character varying(2),
    sldlst character varying(3),
    geoid character varying(5),
    namelsad character varying(100),
    lsad character varying(2),
    lsy character varying(4),
    mtfcc character varying(5),
    funcstat character varying(1),
    aland double precision,
    awater double precision,
    intptlat character varying(11),
    intptlon character varying(12),
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 4326))
);


ALTER TABLE sldl OWNER TO census;

--
-- Name: sldu; Type: TABLE; Schema: tiger2012; Owner: census
--

CREATE TABLE sldu (
    gid integer NOT NULL,
    statefp character varying(2),
    sldust character varying(3),
    geoid character varying(5),
    namelsad character varying(100),
    lsad character varying(2),
    lsy character varying(4),
    mtfcc character varying(5),
    funcstat character varying(1),
    aland double precision,
    awater double precision,
    intptlat character varying(11),
    intptlon character varying(12),
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 4326))
);


ALTER TABLE sldu OWNER TO census;

--
-- Name: submcd; Type: TABLE; Schema: tiger2012; Owner: census
--

CREATE TABLE submcd (
    gid integer NOT NULL,
    statefp character varying(2),
    countyfp character varying(3),
    cousubfp character varying(5),
    submcdfp character varying(5),
    submcdns character varying(8),
    geoid character varying(15),
    name character varying(100),
    namelsad character varying(100),
    lsad character varying(2),
    classfp character varying(2),
    mtfcc character varying(5),
    funcstat character varying(1),
    aland double precision,
    awater double precision,
    intptlat character varying(11),
    intptlon character varying(12),
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 4326))
);


ALTER TABLE submcd OWNER TO census;

--
-- Name: tabblock; Type: TABLE; Schema: tiger2012; Owner: census
--

CREATE TABLE tabblock (
    gid integer NOT NULL,
    statefp character varying(2),
    countyfp character varying(3),
    statefp10 character varying(2),
    countyfp10 character varying(3),
    tractce10 character varying(6),
    blockce10 character varying(4),
    suffix1ce character varying(1),
    geoid character varying(16),
    name character varying(11),
    mtfcc character varying(5),
    ur10 character varying(1),
    uace10 character varying(5),
    funcstat character varying(1),
    aland double precision,
    awater double precision,
    intptlat character varying(11),
    intptlon character varying(12),
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 4326))
);


ALTER TABLE tabblock OWNER TO census;

--
-- Name: tbg; Type: TABLE; Schema: tiger2012; Owner: census
--

CREATE TABLE tbg (
    gid integer NOT NULL,
    aiannhce character varying(4),
    ttractce character varying(6),
    tblkgpce character varying(1),
    geoid character varying(11),
    namelsad character varying(20),
    mtfcc character varying(5),
    aland double precision,
    awater double precision,
    intptlat character varying(11),
    intptlon character varying(12),
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 4326))
);


ALTER TABLE tbg OWNER TO census;

--
-- Name: tract; Type: TABLE; Schema: tiger2012; Owner: census
--

CREATE TABLE tract (
    gid integer NOT NULL,
    statefp character varying(2),
    countyfp character varying(3),
    tractce character varying(6),
    geoid character varying(11),
    name character varying(7),
    namelsad character varying(20),
    mtfcc character varying(5),
    funcstat character varying(1),
    aland double precision,
    awater double precision,
    intptlat character varying(11),
    intptlon character varying(12),
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 4326))
);


ALTER TABLE tract OWNER TO census;

--
-- Name: ttract; Type: TABLE; Schema: tiger2012; Owner: census
--

CREATE TABLE ttract (
    gid integer NOT NULL,
    aiannhce character varying(4),
    ttractce character varying(6),
    geoid character varying(10),
    name character varying(7),
    namelsad character varying(27),
    mtfcc character varying(5),
    aland double precision,
    awater double precision,
    intptlat character varying(11),
    intptlon character varying(12),
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 4326))
);


ALTER TABLE ttract OWNER TO census;

--
-- Name: uac; Type: TABLE; Schema: tiger2012; Owner: census
--

CREATE TABLE uac (
    gid integer NOT NULL,
    uace10 character varying(5),
    geoid10 character varying(5),
    name10 character varying(100),
    namelsad10 character varying(100),
    lsad10 character varying(2),
    mtfcc10 character varying(5),
    uatyp10 character varying(1),
    funcstat10 character varying(1),
    aland10 double precision,
    awater10 double precision,
    intptlat10 character varying(11),
    intptlon10 character varying(12),
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 4326))
);


ALTER TABLE uac OWNER TO census;

--
-- Name: unsd; Type: TABLE; Schema: tiger2012; Owner: census
--

CREATE TABLE unsd (
    gid integer NOT NULL,
    statefp character varying(2),
    unsdlea character varying(5),
    geoid character varying(7),
    name character varying(100),
    lsad character varying(2),
    lograde character varying(2),
    higrade character varying(2),
    mtfcc character varying(5),
    sdtyp character varying(1),
    funcstat character varying(1),
    aland double precision,
    awater double precision,
    intptlat character varying(11),
    intptlon character varying(12),
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 4326))
);


ALTER TABLE unsd OWNER TO census;

--
-- Name: zcta5; Type: TABLE; Schema: tiger2012; Owner: census
--

CREATE TABLE zcta5 (
    gid integer NOT NULL,
    zcta5ce10 character varying(5),
    geoid10 character varying(5),
    classfp10 character varying(2),
    mtfcc10 character varying(5),
    funcstat10 character varying(1),
    aland10 double precision,
    awater10 double precision,
    intptlat10 character varying(11),
    intptlon10 character varying(12),
    the_geom public.geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((public.st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((public.geometrytype(the_geom) = 'MULTIPOLYGON'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((public.st_srid(the_geom) = 4326))
);


ALTER TABLE zcta5 OWNER TO census;

--
-- Name: census_names; Type: VIEW; Schema: tiger2012; Owner: census
--

CREATE VIEW census_names AS
 SELECT '040'::text AS sumlevel,
    state.geoid,
    state.name,
    state.aland,
    state.awater,
    state.intptlat,
    state.intptlon,
    state.the_geom
   FROM state
  WHERE ((state.geoid)::text <> ALL (ARRAY[('60'::character varying)::text, ('66'::character varying)::text, ('69'::character varying)::text, ('78'::character varying)::text]))
UNION ALL
 SELECT '050'::text AS sumlevel,
    county.geoid,
    county.name,
    county.aland,
    county.awater,
    county.intptlat,
    county.intptlon,
    county.the_geom
   FROM county
UNION ALL
 SELECT '160'::text AS sumlevel,
    place.geoid,
    place.name,
    place.aland,
    place.awater,
    place.intptlat,
    place.intptlon,
    place.the_geom
   FROM place
UNION ALL
 SELECT '060'::text AS sumlevel,
    cousub.geoid,
    cousub.name,
    cousub.aland,
    cousub.awater,
    cousub.intptlat,
    cousub.intptlon,
    cousub.the_geom
   FROM cousub
UNION ALL
 SELECT '310'::text AS sumlevel,
    cbsa.geoid,
    cbsa.name,
    cbsa.aland,
    cbsa.awater,
    cbsa.intptlat,
    cbsa.intptlon,
    cbsa.the_geom
   FROM cbsa
UNION ALL
 SELECT '500'::text AS sumlevel,
    cd.geoid,
    cd.namelsad AS name,
    cd.aland,
    cd.awater,
    cd.intptlat,
    cd.intptlon,
    cd.the_geom
   FROM cd
UNION ALL
 SELECT '330'::text AS sumlevel,
    csa.geoid,
    csa.name,
    csa.aland,
    csa.awater,
    csa.intptlat,
    csa.intptlon,
    csa.the_geom
   FROM csa
UNION ALL
 SELECT '950'::text AS sumlevel,
    elsd.geoid,
    elsd.name,
    elsd.aland,
    elsd.awater,
    elsd.intptlat,
    elsd.intptlon,
    elsd.the_geom
   FROM elsd
UNION ALL
 SELECT '960'::text AS sumlevel,
    scsd.geoid,
    scsd.name,
    scsd.aland,
    scsd.awater,
    scsd.intptlat,
    scsd.intptlon,
    scsd.the_geom
   FROM scsd
UNION ALL
 SELECT '860'::text AS sumlevel,
    zcta5.geoid10 AS geoid,
    zcta5.zcta5ce10 AS name,
    zcta5.aland10 AS aland,
    zcta5.awater10 AS awater,
    zcta5.intptlat10 AS intptlat,
    zcta5.intptlon10 AS intptlon,
    zcta5.the_geom
   FROM zcta5
UNION ALL
 SELECT '795'::text AS sumlevel,
    puma.geoid10 AS geoid,
    puma.namelsad10 AS name,
    puma.aland10 AS aland,
    puma.awater10 AS awater,
    puma.intptlat10 AS intptlat,
    puma.intptlon10 AS intptlon,
    puma.the_geom
   FROM puma
UNION ALL
 SELECT '620'::text AS sumlevel,
    sldl.geoid,
    sldl.namelsad AS name,
    sldl.aland,
    sldl.awater,
    sldl.intptlat,
    sldl.intptlon,
    sldl.the_geom
   FROM sldl
UNION ALL
 SELECT '610'::text AS sumlevel,
    sldu.geoid,
    sldu.namelsad AS name,
    sldu.aland,
    sldu.awater,
    sldu.intptlat,
    sldu.intptlon,
    sldu.the_geom
   FROM sldu
UNION ALL
 SELECT '250'::text AS sumlevel,
    aiannh.geoid,
    aiannh.namelsad AS name,
    aiannh.aland,
    aiannh.awater,
    aiannh.intptlat,
    aiannh.intptlon,
    aiannh.the_geom
   FROM aiannh
UNION ALL
 SELECT '251'::text AS sumlevel,
    aits.geoid,
    aits.namelsad AS name,
    aits.aland,
    aits.awater,
    aits.intptlat,
    aits.intptlon,
    aits.the_geom
   FROM aits
UNION ALL
 SELECT '230'::text AS sumlevel,
    anrc.geoid,
    anrc.namelsad AS name,
    anrc.aland,
    anrc.awater,
    anrc.intptlat,
    anrc.intptlon,
    anrc.the_geom
   FROM anrc
UNION ALL
 SELECT '150'::text AS sumlevel,
    bg.geoid,
    bg.namelsad AS name,
    bg.aland,
    bg.awater,
    bg.intptlat,
    bg.intptlon,
    bg.the_geom
   FROM bg
UNION ALL
 SELECT '335'::text AS sumlevel,
    cnecta.geoid,
    cnecta.namelsad AS name,
    cnecta.aland,
    cnecta.awater,
    cnecta.intptlat,
    cnecta.intptlon,
    cnecta.the_geom
   FROM cnecta
UNION ALL
 SELECT '170'::text AS sumlevel,
    concity.geoid,
    concity.namelsad AS name,
    concity.aland,
    concity.awater,
    concity.intptlat,
    concity.intptlon,
    concity.the_geom
   FROM concity
UNION ALL
 SELECT '314'::text AS sumlevel,
    metdiv.geoid,
    metdiv.namelsad AS name,
    metdiv.aland,
    metdiv.awater,
    metdiv.intptlat,
    metdiv.intptlon,
    metdiv.the_geom
   FROM metdiv
UNION ALL
 SELECT '350'::text AS sumlevel,
    necta.geoid,
    necta.namelsad AS name,
    necta.aland,
    necta.awater,
    necta.intptlat,
    necta.intptlon,
    necta.the_geom
   FROM necta
UNION ALL
 SELECT '355'::text AS sumlevel,
    nectadiv.geoid,
    nectadiv.namelsad AS name,
    nectadiv.aland,
    nectadiv.awater,
    nectadiv.intptlat,
    nectadiv.intptlon,
    nectadiv.the_geom
   FROM nectadiv
UNION ALL
 SELECT '067'::text AS sumlevel,
    submcd.geoid,
    submcd.namelsad AS name,
    submcd.aland,
    submcd.awater,
    submcd.intptlat,
    submcd.intptlon,
    submcd.the_geom
   FROM submcd
UNION ALL
 SELECT '258'::text AS sumlevel,
    tbg.geoid,
    tbg.namelsad AS name,
    tbg.aland,
    tbg.awater,
    tbg.intptlat,
    tbg.intptlon,
    tbg.the_geom
   FROM tbg
UNION ALL
 SELECT '256'::text AS sumlevel,
    ttract.geoid,
    ttract.namelsad AS name,
    ttract.aland,
    ttract.awater,
    ttract.intptlat,
    ttract.intptlon,
    ttract.the_geom
   FROM ttract
UNION ALL
 SELECT '101'::text AS sumlevel,
    tabblock.geoid,
    tabblock.name,
    tabblock.aland,
    tabblock.awater,
    tabblock.intptlat,
    tabblock.intptlon,
    tabblock.the_geom
   FROM tabblock
UNION ALL
 SELECT '140'::text AS sumlevel,
    tract.geoid,
    tract.namelsad AS name,
    tract.aland,
    tract.awater,
    tract.intptlat,
    tract.intptlon,
    tract.the_geom
   FROM tract
UNION ALL
 SELECT '400'::text AS sumlevel,
    uac.geoid10 AS geoid,
    uac.namelsad10 AS name,
    uac.aland10 AS aland,
    uac.awater10 AS awater,
    uac.intptlat10 AS intptlat,
    uac.intptlon10 AS intptlon,
    uac.the_geom
   FROM uac
UNION ALL
 SELECT '970'::text AS sumlevel,
    unsd.geoid,
    unsd.name,
    unsd.aland,
    unsd.awater,
    unsd.intptlat,
    unsd.intptlon,
    unsd.the_geom
   FROM unsd
UNION ALL
 SELECT '700'::text AS sumlevel,
    vtd.geoid10 AS geoid,
    vtd.namelsad10 AS name,
    vtd.aland10 AS aland,
    vtd.awater10 AS awater,
    vtd.intptlat10 AS intptlat,
    vtd.intptlon10 AS intptlon,
    vtd.the_geom
   FROM vtd
UNION ALL
 SELECT '010'::text AS sumlevel,
    ''::character varying AS geoid,
    'United States'::character varying AS name,
    '9158687485691'::bigint AS aland,
    '698638462086'::bigint AS awater,
    '+40.0'::character varying AS intptlat,
    '-99.8'::character varying AS intptlon,
    NULL::public.geometry AS the_geom;


ALTER TABLE census_names OWNER TO census;

--
-- Name: cnecta_gid_seq; Type: SEQUENCE; Schema: tiger2012; Owner: census
--

CREATE SEQUENCE cnecta_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cnecta_gid_seq OWNER TO census;

--
-- Name: cnecta_gid_seq; Type: SEQUENCE OWNED BY; Schema: tiger2012; Owner: census
--

ALTER SEQUENCE cnecta_gid_seq OWNED BY cnecta.gid;


--
-- Name: concity_gid_seq; Type: SEQUENCE; Schema: tiger2012; Owner: census
--

CREATE SEQUENCE concity_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE concity_gid_seq OWNER TO census;

--
-- Name: concity_gid_seq; Type: SEQUENCE OWNED BY; Schema: tiger2012; Owner: census
--

ALTER SEQUENCE concity_gid_seq OWNED BY concity.gid;


--
-- Name: county_gid_seq; Type: SEQUENCE; Schema: tiger2012; Owner: census
--

CREATE SEQUENCE county_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE county_gid_seq OWNER TO census;

--
-- Name: county_gid_seq; Type: SEQUENCE OWNED BY; Schema: tiger2012; Owner: census
--

ALTER SEQUENCE county_gid_seq OWNED BY county.gid;


--
-- Name: cousub_gid_seq; Type: SEQUENCE; Schema: tiger2012; Owner: census
--

CREATE SEQUENCE cousub_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cousub_gid_seq OWNER TO census;

--
-- Name: cousub_gid_seq; Type: SEQUENCE OWNED BY; Schema: tiger2012; Owner: census
--

ALTER SEQUENCE cousub_gid_seq OWNED BY cousub.gid;


--
-- Name: csa_gid_seq; Type: SEQUENCE; Schema: tiger2012; Owner: census
--

CREATE SEQUENCE csa_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE csa_gid_seq OWNER TO census;

--
-- Name: csa_gid_seq; Type: SEQUENCE OWNED BY; Schema: tiger2012; Owner: census
--

ALTER SEQUENCE csa_gid_seq OWNED BY csa.gid;


--
-- Name: elsd_gid_seq; Type: SEQUENCE; Schema: tiger2012; Owner: census
--

CREATE SEQUENCE elsd_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE elsd_gid_seq OWNER TO census;

--
-- Name: elsd_gid_seq; Type: SEQUENCE OWNED BY; Schema: tiger2012; Owner: census
--

ALTER SEQUENCE elsd_gid_seq OWNED BY elsd.gid;


--
-- Name: metdiv_gid_seq; Type: SEQUENCE; Schema: tiger2012; Owner: census
--

CREATE SEQUENCE metdiv_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE metdiv_gid_seq OWNER TO census;

--
-- Name: metdiv_gid_seq; Type: SEQUENCE OWNED BY; Schema: tiger2012; Owner: census
--

ALTER SEQUENCE metdiv_gid_seq OWNED BY metdiv.gid;


--
-- Name: necta_gid_seq; Type: SEQUENCE; Schema: tiger2012; Owner: census
--

CREATE SEQUENCE necta_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE necta_gid_seq OWNER TO census;

--
-- Name: necta_gid_seq; Type: SEQUENCE OWNED BY; Schema: tiger2012; Owner: census
--

ALTER SEQUENCE necta_gid_seq OWNED BY necta.gid;


--
-- Name: nectadiv_gid_seq; Type: SEQUENCE; Schema: tiger2012; Owner: census
--

CREATE SEQUENCE nectadiv_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE nectadiv_gid_seq OWNER TO census;

--
-- Name: nectadiv_gid_seq; Type: SEQUENCE OWNED BY; Schema: tiger2012; Owner: census
--

ALTER SEQUENCE nectadiv_gid_seq OWNED BY nectadiv.gid;


--
-- Name: place_gid_seq; Type: SEQUENCE; Schema: tiger2012; Owner: census
--

CREATE SEQUENCE place_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE place_gid_seq OWNER TO census;

--
-- Name: place_gid_seq; Type: SEQUENCE OWNED BY; Schema: tiger2012; Owner: census
--

ALTER SEQUENCE place_gid_seq OWNED BY place.gid;


--
-- Name: puma_gid_seq; Type: SEQUENCE; Schema: tiger2012; Owner: census
--

CREATE SEQUENCE puma_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE puma_gid_seq OWNER TO census;

--
-- Name: puma_gid_seq; Type: SEQUENCE OWNED BY; Schema: tiger2012; Owner: census
--

ALTER SEQUENCE puma_gid_seq OWNED BY puma.gid;


--
-- Name: scsd_gid_seq; Type: SEQUENCE; Schema: tiger2012; Owner: census
--

CREATE SEQUENCE scsd_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE scsd_gid_seq OWNER TO census;

--
-- Name: scsd_gid_seq; Type: SEQUENCE OWNED BY; Schema: tiger2012; Owner: census
--

ALTER SEQUENCE scsd_gid_seq OWNED BY scsd.gid;


--
-- Name: sldl_gid_seq; Type: SEQUENCE; Schema: tiger2012; Owner: census
--

CREATE SEQUENCE sldl_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sldl_gid_seq OWNER TO census;

--
-- Name: sldl_gid_seq; Type: SEQUENCE OWNED BY; Schema: tiger2012; Owner: census
--

ALTER SEQUENCE sldl_gid_seq OWNED BY sldl.gid;


--
-- Name: sldu_gid_seq; Type: SEQUENCE; Schema: tiger2012; Owner: census
--

CREATE SEQUENCE sldu_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sldu_gid_seq OWNER TO census;

--
-- Name: sldu_gid_seq; Type: SEQUENCE OWNED BY; Schema: tiger2012; Owner: census
--

ALTER SEQUENCE sldu_gid_seq OWNED BY sldu.gid;


--
-- Name: state_gid_seq; Type: SEQUENCE; Schema: tiger2012; Owner: census
--

CREATE SEQUENCE state_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE state_gid_seq OWNER TO census;

--
-- Name: state_gid_seq; Type: SEQUENCE OWNED BY; Schema: tiger2012; Owner: census
--

ALTER SEQUENCE state_gid_seq OWNED BY state.gid;


--
-- Name: submcd_gid_seq; Type: SEQUENCE; Schema: tiger2012; Owner: census
--

CREATE SEQUENCE submcd_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE submcd_gid_seq OWNER TO census;

--
-- Name: submcd_gid_seq; Type: SEQUENCE OWNED BY; Schema: tiger2012; Owner: census
--

ALTER SEQUENCE submcd_gid_seq OWNED BY submcd.gid;


--
-- Name: tabblock_gid_seq; Type: SEQUENCE; Schema: tiger2012; Owner: census
--

CREATE SEQUENCE tabblock_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tabblock_gid_seq OWNER TO census;

--
-- Name: tabblock_gid_seq; Type: SEQUENCE OWNED BY; Schema: tiger2012; Owner: census
--

ALTER SEQUENCE tabblock_gid_seq OWNED BY tabblock.gid;


--
-- Name: tbg_gid_seq; Type: SEQUENCE; Schema: tiger2012; Owner: census
--

CREATE SEQUENCE tbg_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tbg_gid_seq OWNER TO census;

--
-- Name: tbg_gid_seq; Type: SEQUENCE OWNED BY; Schema: tiger2012; Owner: census
--

ALTER SEQUENCE tbg_gid_seq OWNED BY tbg.gid;


--
-- Name: tract_gid_seq; Type: SEQUENCE; Schema: tiger2012; Owner: census
--

CREATE SEQUENCE tract_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tract_gid_seq OWNER TO census;

--
-- Name: tract_gid_seq; Type: SEQUENCE OWNED BY; Schema: tiger2012; Owner: census
--

ALTER SEQUENCE tract_gid_seq OWNED BY tract.gid;


--
-- Name: ttract_gid_seq; Type: SEQUENCE; Schema: tiger2012; Owner: census
--

CREATE SEQUENCE ttract_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ttract_gid_seq OWNER TO census;

--
-- Name: ttract_gid_seq; Type: SEQUENCE OWNED BY; Schema: tiger2012; Owner: census
--

ALTER SEQUENCE ttract_gid_seq OWNED BY ttract.gid;


--
-- Name: uac_gid_seq; Type: SEQUENCE; Schema: tiger2012; Owner: census
--

CREATE SEQUENCE uac_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE uac_gid_seq OWNER TO census;

--
-- Name: uac_gid_seq; Type: SEQUENCE OWNED BY; Schema: tiger2012; Owner: census
--

ALTER SEQUENCE uac_gid_seq OWNED BY uac.gid;


--
-- Name: unsd_gid_seq; Type: SEQUENCE; Schema: tiger2012; Owner: census
--

CREATE SEQUENCE unsd_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE unsd_gid_seq OWNER TO census;

--
-- Name: unsd_gid_seq; Type: SEQUENCE OWNED BY; Schema: tiger2012; Owner: census
--

ALTER SEQUENCE unsd_gid_seq OWNED BY unsd.gid;


--
-- Name: vtd_gid_seq; Type: SEQUENCE; Schema: tiger2012; Owner: census
--

CREATE SEQUENCE vtd_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vtd_gid_seq OWNER TO census;

--
-- Name: vtd_gid_seq; Type: SEQUENCE OWNED BY; Schema: tiger2012; Owner: census
--

ALTER SEQUENCE vtd_gid_seq OWNED BY vtd.gid;


--
-- Name: zcta5_gid_seq; Type: SEQUENCE; Schema: tiger2012; Owner: census
--

CREATE SEQUENCE zcta5_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zcta5_gid_seq OWNER TO census;

--
-- Name: zcta5_gid_seq; Type: SEQUENCE OWNED BY; Schema: tiger2012; Owner: census
--

ALTER SEQUENCE zcta5_gid_seq OWNED BY zcta5.gid;


--
-- Name: aiannh gid; Type: DEFAULT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY aiannh ALTER COLUMN gid SET DEFAULT nextval('aiannh_gid_seq'::regclass);


--
-- Name: aits gid; Type: DEFAULT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY aits ALTER COLUMN gid SET DEFAULT nextval('aits_gid_seq'::regclass);


--
-- Name: anrc gid; Type: DEFAULT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY anrc ALTER COLUMN gid SET DEFAULT nextval('anrc_gid_seq'::regclass);


--
-- Name: bg gid; Type: DEFAULT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY bg ALTER COLUMN gid SET DEFAULT nextval('bg_gid_seq'::regclass);


--
-- Name: cbsa gid; Type: DEFAULT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY cbsa ALTER COLUMN gid SET DEFAULT nextval('cbsa_gid_seq'::regclass);


--
-- Name: cd gid; Type: DEFAULT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY cd ALTER COLUMN gid SET DEFAULT nextval('cd_gid_seq'::regclass);


--
-- Name: cnecta gid; Type: DEFAULT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY cnecta ALTER COLUMN gid SET DEFAULT nextval('cnecta_gid_seq'::regclass);


--
-- Name: concity gid; Type: DEFAULT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY concity ALTER COLUMN gid SET DEFAULT nextval('concity_gid_seq'::regclass);


--
-- Name: county gid; Type: DEFAULT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY county ALTER COLUMN gid SET DEFAULT nextval('county_gid_seq'::regclass);


--
-- Name: cousub gid; Type: DEFAULT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY cousub ALTER COLUMN gid SET DEFAULT nextval('cousub_gid_seq'::regclass);


--
-- Name: csa gid; Type: DEFAULT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY csa ALTER COLUMN gid SET DEFAULT nextval('csa_gid_seq'::regclass);


--
-- Name: elsd gid; Type: DEFAULT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY elsd ALTER COLUMN gid SET DEFAULT nextval('elsd_gid_seq'::regclass);


--
-- Name: metdiv gid; Type: DEFAULT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY metdiv ALTER COLUMN gid SET DEFAULT nextval('metdiv_gid_seq'::regclass);


--
-- Name: necta gid; Type: DEFAULT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY necta ALTER COLUMN gid SET DEFAULT nextval('necta_gid_seq'::regclass);


--
-- Name: nectadiv gid; Type: DEFAULT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY nectadiv ALTER COLUMN gid SET DEFAULT nextval('nectadiv_gid_seq'::regclass);


--
-- Name: place gid; Type: DEFAULT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY place ALTER COLUMN gid SET DEFAULT nextval('place_gid_seq'::regclass);


--
-- Name: puma gid; Type: DEFAULT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY puma ALTER COLUMN gid SET DEFAULT nextval('puma_gid_seq'::regclass);


--
-- Name: scsd gid; Type: DEFAULT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY scsd ALTER COLUMN gid SET DEFAULT nextval('scsd_gid_seq'::regclass);


--
-- Name: sldl gid; Type: DEFAULT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY sldl ALTER COLUMN gid SET DEFAULT nextval('sldl_gid_seq'::regclass);


--
-- Name: sldu gid; Type: DEFAULT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY sldu ALTER COLUMN gid SET DEFAULT nextval('sldu_gid_seq'::regclass);


--
-- Name: state gid; Type: DEFAULT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY state ALTER COLUMN gid SET DEFAULT nextval('state_gid_seq'::regclass);


--
-- Name: submcd gid; Type: DEFAULT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY submcd ALTER COLUMN gid SET DEFAULT nextval('submcd_gid_seq'::regclass);


--
-- Name: tabblock gid; Type: DEFAULT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY tabblock ALTER COLUMN gid SET DEFAULT nextval('tabblock_gid_seq'::regclass);


--
-- Name: tbg gid; Type: DEFAULT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY tbg ALTER COLUMN gid SET DEFAULT nextval('tbg_gid_seq'::regclass);


--
-- Name: tract gid; Type: DEFAULT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY tract ALTER COLUMN gid SET DEFAULT nextval('tract_gid_seq'::regclass);


--
-- Name: ttract gid; Type: DEFAULT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY ttract ALTER COLUMN gid SET DEFAULT nextval('ttract_gid_seq'::regclass);


--
-- Name: uac gid; Type: DEFAULT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY uac ALTER COLUMN gid SET DEFAULT nextval('uac_gid_seq'::regclass);


--
-- Name: unsd gid; Type: DEFAULT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY unsd ALTER COLUMN gid SET DEFAULT nextval('unsd_gid_seq'::regclass);


--
-- Name: vtd gid; Type: DEFAULT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY vtd ALTER COLUMN gid SET DEFAULT nextval('vtd_gid_seq'::regclass);


--
-- Name: zcta5 gid; Type: DEFAULT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY zcta5 ALTER COLUMN gid SET DEFAULT nextval('zcta5_gid_seq'::regclass);


--
-- Name: aiannh aiannh_pkey; Type: CONSTRAINT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY aiannh
    ADD CONSTRAINT aiannh_pkey PRIMARY KEY (gid);


--
-- Name: aits aits_pkey; Type: CONSTRAINT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY aits
    ADD CONSTRAINT aits_pkey PRIMARY KEY (gid);


--
-- Name: anrc anrc_pkey; Type: CONSTRAINT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY anrc
    ADD CONSTRAINT anrc_pkey PRIMARY KEY (gid);


--
-- Name: bg bg_pkey; Type: CONSTRAINT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY bg
    ADD CONSTRAINT bg_pkey PRIMARY KEY (gid);


--
-- Name: cbsa cbsa_pkey; Type: CONSTRAINT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY cbsa
    ADD CONSTRAINT cbsa_pkey PRIMARY KEY (gid);


--
-- Name: cd cd_pkey; Type: CONSTRAINT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY cd
    ADD CONSTRAINT cd_pkey PRIMARY KEY (gid);


--
-- Name: cnecta cnecta_pkey; Type: CONSTRAINT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY cnecta
    ADD CONSTRAINT cnecta_pkey PRIMARY KEY (gid);


--
-- Name: concity concity_pkey; Type: CONSTRAINT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY concity
    ADD CONSTRAINT concity_pkey PRIMARY KEY (gid);


--
-- Name: county county_pkey; Type: CONSTRAINT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY county
    ADD CONSTRAINT county_pkey PRIMARY KEY (gid);


--
-- Name: cousub cousub_pkey; Type: CONSTRAINT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY cousub
    ADD CONSTRAINT cousub_pkey PRIMARY KEY (gid);


--
-- Name: csa csa_pkey; Type: CONSTRAINT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY csa
    ADD CONSTRAINT csa_pkey PRIMARY KEY (gid);


--
-- Name: elsd elsd_pkey; Type: CONSTRAINT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY elsd
    ADD CONSTRAINT elsd_pkey PRIMARY KEY (gid);


--
-- Name: metdiv metdiv_pkey; Type: CONSTRAINT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY metdiv
    ADD CONSTRAINT metdiv_pkey PRIMARY KEY (gid);


--
-- Name: necta necta_pkey; Type: CONSTRAINT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY necta
    ADD CONSTRAINT necta_pkey PRIMARY KEY (gid);


--
-- Name: nectadiv nectadiv_pkey; Type: CONSTRAINT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY nectadiv
    ADD CONSTRAINT nectadiv_pkey PRIMARY KEY (gid);


--
-- Name: place place_pkey; Type: CONSTRAINT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY place
    ADD CONSTRAINT place_pkey PRIMARY KEY (gid);


--
-- Name: puma puma_pkey; Type: CONSTRAINT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY puma
    ADD CONSTRAINT puma_pkey PRIMARY KEY (gid);


--
-- Name: scsd scsd_pkey; Type: CONSTRAINT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY scsd
    ADD CONSTRAINT scsd_pkey PRIMARY KEY (gid);


--
-- Name: sldl sldl_pkey; Type: CONSTRAINT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY sldl
    ADD CONSTRAINT sldl_pkey PRIMARY KEY (gid);


--
-- Name: sldu sldu_pkey; Type: CONSTRAINT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY sldu
    ADD CONSTRAINT sldu_pkey PRIMARY KEY (gid);


--
-- Name: state state_pkey; Type: CONSTRAINT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY state
    ADD CONSTRAINT state_pkey PRIMARY KEY (gid);


--
-- Name: submcd submcd_pkey; Type: CONSTRAINT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY submcd
    ADD CONSTRAINT submcd_pkey PRIMARY KEY (gid);


--
-- Name: tabblock tabblock_pkey; Type: CONSTRAINT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY tabblock
    ADD CONSTRAINT tabblock_pkey PRIMARY KEY (gid);


--
-- Name: tbg tbg_pkey; Type: CONSTRAINT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY tbg
    ADD CONSTRAINT tbg_pkey PRIMARY KEY (gid);


--
-- Name: tract tract_pkey; Type: CONSTRAINT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY tract
    ADD CONSTRAINT tract_pkey PRIMARY KEY (gid);


--
-- Name: ttract ttract_pkey; Type: CONSTRAINT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY ttract
    ADD CONSTRAINT ttract_pkey PRIMARY KEY (gid);


--
-- Name: uac uac_pkey; Type: CONSTRAINT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY uac
    ADD CONSTRAINT uac_pkey PRIMARY KEY (gid);


--
-- Name: unsd unsd_pkey; Type: CONSTRAINT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY unsd
    ADD CONSTRAINT unsd_pkey PRIMARY KEY (gid);


--
-- Name: vtd vtd_pkey; Type: CONSTRAINT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY vtd
    ADD CONSTRAINT vtd_pkey PRIMARY KEY (gid);


--
-- Name: zcta5 zcta5_pkey; Type: CONSTRAINT; Schema: tiger2012; Owner: census
--

ALTER TABLE ONLY zcta5
    ADD CONSTRAINT zcta5_pkey PRIMARY KEY (gid);


--
-- Name: aiannh_the_geom_gist; Type: INDEX; Schema: tiger2012; Owner: census
--

CREATE INDEX aiannh_the_geom_gist ON aiannh USING gist (the_geom);


--
-- Name: aits_the_geom_gist; Type: INDEX; Schema: tiger2012; Owner: census
--

CREATE INDEX aits_the_geom_gist ON aits USING gist (the_geom);


--
-- Name: anrc_the_geom_gist; Type: INDEX; Schema: tiger2012; Owner: census
--

CREATE INDEX anrc_the_geom_gist ON anrc USING gist (the_geom);


--
-- Name: bg_the_geom_gist; Type: INDEX; Schema: tiger2012; Owner: census
--

CREATE INDEX bg_the_geom_gist ON bg USING gist (the_geom);


--
-- Name: cbsa_the_geom_gist; Type: INDEX; Schema: tiger2012; Owner: census
--

CREATE INDEX cbsa_the_geom_gist ON cbsa USING gist (the_geom);


--
-- Name: cd_the_geom_gist; Type: INDEX; Schema: tiger2012; Owner: census
--

CREATE INDEX cd_the_geom_gist ON cd USING gist (the_geom);


--
-- Name: census_name_lookup_idx_geoid; Type: INDEX; Schema: tiger2012; Owner: census
--

CREATE INDEX census_name_lookup_idx_geoid ON census_name_lookup USING btree (full_geoid);


--
-- Name: census_name_lookup_idx_geom; Type: INDEX; Schema: tiger2012; Owner: census
--

CREATE INDEX census_name_lookup_idx_geom ON census_name_lookup USING gist (the_geom);


--
-- Name: census_name_lookup_idx_lower; Type: INDEX; Schema: tiger2012; Owner: census
--

CREATE INDEX census_name_lookup_idx_lower ON census_name_lookup USING btree (lower((prefix_match_name)::text) text_pattern_ops);


--
-- Name: cnecta_the_geom_gist; Type: INDEX; Schema: tiger2012; Owner: census
--

CREATE INDEX cnecta_the_geom_gist ON cnecta USING gist (the_geom);


--
-- Name: concity_the_geom_gist; Type: INDEX; Schema: tiger2012; Owner: census
--

CREATE INDEX concity_the_geom_gist ON concity USING gist (the_geom);


--
-- Name: county_the_geom_gist; Type: INDEX; Schema: tiger2012; Owner: census
--

CREATE INDEX county_the_geom_gist ON county USING gist (the_geom);


--
-- Name: cousub_the_geom_gist; Type: INDEX; Schema: tiger2012; Owner: census
--

CREATE INDEX cousub_the_geom_gist ON cousub USING gist (the_geom);


--
-- Name: csa_the_geom_gist; Type: INDEX; Schema: tiger2012; Owner: census
--

CREATE INDEX csa_the_geom_gist ON csa USING gist (the_geom);


--
-- Name: elsd_the_geom_gist; Type: INDEX; Schema: tiger2012; Owner: census
--

CREATE INDEX elsd_the_geom_gist ON elsd USING gist (the_geom);


--
-- Name: metdiv_the_geom_gist; Type: INDEX; Schema: tiger2012; Owner: census
--

CREATE INDEX metdiv_the_geom_gist ON metdiv USING gist (the_geom);


--
-- Name: necta_the_geom_gist; Type: INDEX; Schema: tiger2012; Owner: census
--

CREATE INDEX necta_the_geom_gist ON necta USING gist (the_geom);


--
-- Name: nectadiv_the_geom_gist; Type: INDEX; Schema: tiger2012; Owner: census
--

CREATE INDEX nectadiv_the_geom_gist ON nectadiv USING gist (the_geom);


--
-- Name: place_the_geom_gist; Type: INDEX; Schema: tiger2012; Owner: census
--

CREATE INDEX place_the_geom_gist ON place USING gist (the_geom);


--
-- Name: puma_the_geom_gist; Type: INDEX; Schema: tiger2012; Owner: census
--

CREATE INDEX puma_the_geom_gist ON puma USING gist (the_geom);


--
-- Name: scsd_the_geom_gist; Type: INDEX; Schema: tiger2012; Owner: census
--

CREATE INDEX scsd_the_geom_gist ON scsd USING gist (the_geom);


--
-- Name: sldl_the_geom_gist; Type: INDEX; Schema: tiger2012; Owner: census
--

CREATE INDEX sldl_the_geom_gist ON sldl USING gist (the_geom);


--
-- Name: sldu_the_geom_gist; Type: INDEX; Schema: tiger2012; Owner: census
--

CREATE INDEX sldu_the_geom_gist ON sldu USING gist (the_geom);


--
-- Name: state_the_geom_gist; Type: INDEX; Schema: tiger2012; Owner: census
--

CREATE INDEX state_the_geom_gist ON state USING gist (the_geom);


--
-- Name: submcd_the_geom_gist; Type: INDEX; Schema: tiger2012; Owner: census
--

CREATE INDEX submcd_the_geom_gist ON submcd USING gist (the_geom);


--
-- Name: tabblock_the_geom_gist; Type: INDEX; Schema: tiger2012; Owner: census
--

CREATE INDEX tabblock_the_geom_gist ON tabblock USING gist (the_geom);


--
-- Name: tbg_the_geom_gist; Type: INDEX; Schema: tiger2012; Owner: census
--

CREATE INDEX tbg_the_geom_gist ON tbg USING gist (the_geom);


--
-- Name: tract_the_geom_gist; Type: INDEX; Schema: tiger2012; Owner: census
--

CREATE INDEX tract_the_geom_gist ON tract USING gist (the_geom);


--
-- Name: ttract_the_geom_gist; Type: INDEX; Schema: tiger2012; Owner: census
--

CREATE INDEX ttract_the_geom_gist ON ttract USING gist (the_geom);


--
-- Name: uac_the_geom_gist; Type: INDEX; Schema: tiger2012; Owner: census
--

CREATE INDEX uac_the_geom_gist ON uac USING gist (the_geom);


--
-- Name: unsd_the_geom_gist; Type: INDEX; Schema: tiger2012; Owner: census
--

CREATE INDEX unsd_the_geom_gist ON unsd USING gist (the_geom);


--
-- Name: vtd_the_geom_gist; Type: INDEX; Schema: tiger2012; Owner: census
--

CREATE INDEX vtd_the_geom_gist ON vtd USING gist (the_geom);


--
-- Name: zcta5_the_geom_gist; Type: INDEX; Schema: tiger2012; Owner: census
--

CREATE INDEX zcta5_the_geom_gist ON zcta5 USING gist (the_geom);


--
-- PostgreSQL database dump complete
--
