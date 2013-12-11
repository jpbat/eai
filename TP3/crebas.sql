--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.10
-- Dumped by pg_dump version 9.1.10
-- Started on 2013-12-11 23:45:37 WET

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 175 (class 3079 OID 11681)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 1958 (class 0 OID 0)
-- Dependencies: 175
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 161 (class 1259 OID 24720)
-- Dependencies: 5
-- Name: actor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE actor (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.actor OWNER TO postgres;

--
-- TOC entry 162 (class 1259 OID 24723)
-- Dependencies: 161 5
-- Name: actor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE actor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.actor_id_seq OWNER TO postgres;

--
-- TOC entry 1959 (class 0 OID 0)
-- Dependencies: 162
-- Name: actor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE actor_id_seq OWNED BY actor.id;


--
-- TOC entry 163 (class 1259 OID 24725)
-- Dependencies: 5
-- Name: director; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE director (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.director OWNER TO postgres;

--
-- TOC entry 164 (class 1259 OID 24728)
-- Dependencies: 163 5
-- Name: director_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE director_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.director_id_seq OWNER TO postgres;

--
-- TOC entry 1960 (class 0 OID 0)
-- Dependencies: 164
-- Name: director_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE director_id_seq OWNED BY director.id;


--
-- TOC entry 165 (class 1259 OID 24730)
-- Dependencies: 5
-- Name: genre; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE genre (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.genre OWNER TO postgres;

--
-- TOC entry 166 (class 1259 OID 24733)
-- Dependencies: 165 5
-- Name: genre_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genre_id_seq OWNER TO postgres;

--
-- TOC entry 1961 (class 0 OID 0)
-- Dependencies: 166
-- Name: genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE genre_id_seq OWNED BY genre.id;


--
-- TOC entry 167 (class 1259 OID 24735)
-- Dependencies: 5
-- Name: movie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE movie (
    id bigint NOT NULL,
    description character varying(2048),
    duration character varying(255),
    image character varying(255),
    launchdate character varying(255),
    metascore double precision NOT NULL,
    title character varying(255),
    rate character varying(255)
);


ALTER TABLE public.movie OWNER TO postgres;

--
-- TOC entry 168 (class 1259 OID 24741)
-- Dependencies: 5
-- Name: movie_actor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE movie_actor (
    movies_id bigint NOT NULL,
    actors_id bigint NOT NULL
);


ALTER TABLE public.movie_actor OWNER TO postgres;

--
-- TOC entry 169 (class 1259 OID 24744)
-- Dependencies: 5
-- Name: movie_director; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE movie_director (
    movies_id bigint NOT NULL,
    directors_id bigint NOT NULL
);


ALTER TABLE public.movie_director OWNER TO postgres;

--
-- TOC entry 170 (class 1259 OID 24747)
-- Dependencies: 5
-- Name: movie_genre; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE movie_genre (
    movies_id bigint NOT NULL,
    genres_id bigint NOT NULL
);


ALTER TABLE public.movie_genre OWNER TO postgres;

--
-- TOC entry 171 (class 1259 OID 24750)
-- Dependencies: 5 167
-- Name: movie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE movie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movie_id_seq OWNER TO postgres;

--
-- TOC entry 1962 (class 0 OID 0)
-- Dependencies: 171
-- Name: movie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE movie_id_seq OWNED BY movie.id;


--
-- TOC entry 173 (class 1259 OID 24759)
-- Dependencies: 5
-- Name: subscription; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE subscription (
    id integer NOT NULL,
    type character varying(1024) NOT NULL,
    email character varying(1024) NOT NULL
);


ALTER TABLE public.subscription OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 24775)
-- Dependencies: 5
-- Name: subscription_details; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE subscription_details (
    subscriptionid integer NOT NULL,
    genre integer NOT NULL
);


ALTER TABLE public.subscription_details OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 24757)
-- Dependencies: 173 5
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscription_id_seq OWNER TO postgres;

--
-- TOC entry 1963 (class 0 OID 0)
-- Dependencies: 172
-- Name: subscription_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE subscription_id_seq OWNED BY subscription.id;


--
-- TOC entry 1829 (class 2604 OID 24753)
-- Dependencies: 162 161
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY actor ALTER COLUMN id SET DEFAULT nextval('actor_id_seq'::regclass);


--
-- TOC entry 1830 (class 2604 OID 24754)
-- Dependencies: 164 163
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY director ALTER COLUMN id SET DEFAULT nextval('director_id_seq'::regclass);


--
-- TOC entry 1831 (class 2604 OID 24755)
-- Dependencies: 166 165
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY genre ALTER COLUMN id SET DEFAULT nextval('genre_id_seq'::regclass);


--
-- TOC entry 1832 (class 2604 OID 24756)
-- Dependencies: 171 167
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movie ALTER COLUMN id SET DEFAULT nextval('movie_id_seq'::regclass);


--
-- TOC entry 1833 (class 2604 OID 24762)
-- Dependencies: 173 172 173
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY subscription ALTER COLUMN id SET DEFAULT nextval('subscription_id_seq'::regclass);


REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
