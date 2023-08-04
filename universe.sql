--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    area_million_km_square integer,
    volume_billion_cubic_kms integer,
    age numeric,
    material text,
    has_life boolean,
    has_water boolean,
    galaxy_types character varying(20)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    area_million_km_square integer,
    volume_billion_cubic_kms integer,
    age numeric,
    material text,
    has_life boolean,
    has_water boolean,
    gravity numeric(4,2)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_info (
    more_info_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text
);


ALTER TABLE public.more_info OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.more_info_more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.more_info_more_info_id_seq OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.more_info_more_info_id_seq OWNED BY public.more_info.more_info_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    area_million_km_square integer,
    volume_billion_cubic_kms integer,
    age_in_billion_years numeric,
    material text,
    has_life boolean,
    has_water boolean,
    is_spherical boolean,
    dist_from_earth_in_million_kms integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    area_million_km_square integer,
    volume_billion_cubic_kms integer,
    age numeric,
    material text,
    has_life boolean,
    has_water boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: more_info more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info ALTER COLUMN more_info_id SET DEFAULT nextval('public.more_info_more_info_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 152, 200, 10, 'a ring of old, red stars', false, false, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Sombrero', 50, 800, 13.25, 'a central bulge of older stars', false, false, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Cartwheel', 144, 48, 0.3, 'hydrocarbons and silicate dust', false, false, 'Lenticular ring');
INSERT INTO public.galaxy VALUES (4, 'Tadpole', 280, 43, 0.1, 'stars, gas, and dust', false, false, 'Spiral');
INSERT INTO public.galaxy VALUES (5, 'Comet', 600, 38, 0.4, 'hot glowing gasses', false, false, 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 30000, 160, 0.4, 'hydrogen gas', false, false, 'Spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (7, 12, 'm1', 500, 750, 15.75, 'gas', false, true, 5.40);
INSERT INTO public.moon VALUES (8, 7, 'm2', 500, 600, 3.90, 'hydrogen', false, false, 4.80);
INSERT INTO public.moon VALUES (9, 3, 'm3', 30, 298, 34.80, 'gas', false, false, 2.70);
INSERT INTO public.moon VALUES (10, 8, 'm4', 192, 402, 40.50, 'ice', false, true, 3.00);
INSERT INTO public.moon VALUES (11, 11, 'm5', 300, 13, 99.2, 'tin', false, false, 1.70);
INSERT INTO public.moon VALUES (12, 4, 'm6', 750, 70, 150.75, 'gas', false, false, 7.80);
INSERT INTO public.moon VALUES (13, 2, 'm7', 500, 750, 15.75, 'gas', false, true, 5.40);
INSERT INTO public.moon VALUES (14, 7, 'm8', 500, 600, 3.90, 'hydrogen', false, false, 4.80);
INSERT INTO public.moon VALUES (15, 9, 'm9', 30, 298, 34.80, 'gas', false, false, 2.70);
INSERT INTO public.moon VALUES (16, 10, 'm10', 192, 402, 40.50, 'ice', false, true, 3.00);
INSERT INTO public.moon VALUES (17, 9, 'm11', 300, 13, 99.2, 'tin', false, false, 1.70);
INSERT INTO public.moon VALUES (18, 4, 'm12', 750, 70, 150.75, 'gas', false, false, 7.80);
INSERT INTO public.moon VALUES (19, 2, 'm13', 500, 750, 15.75, 'gas', false, true, 5.40);
INSERT INTO public.moon VALUES (20, 12, 'm14', 500, 600, 3.90, 'hydrogen', false, false, 4.80);
INSERT INTO public.moon VALUES (21, 9, 'm15', 30, 298, 34.80, 'gas', false, false, 2.70);
INSERT INTO public.moon VALUES (22, 10, 'm16', 192, 402, 40.50, 'ice', false, true, 3.00);
INSERT INTO public.moon VALUES (23, 9, 'm17', 300, 13, 99.2, 'tin', false, false, 1.70);
INSERT INTO public.moon VALUES (24, 5, 'm18', 750, 70, 150.75, 'gas', false, false, 7.80);
INSERT INTO public.moon VALUES (25, 10, 'm19', 500, 750, 15.75, 'gas', false, true, 5.40);
INSERT INTO public.moon VALUES (26, 1, 'm20', 500, 600, 3.90, 'hydrogen', false, false, 4.80);


--
-- Data for Name: more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_info VALUES (1, 'p1', 'Planet 1');
INSERT INTO public.more_info VALUES (2, 'm4', 'info');
INSERT INTO public.more_info VALUES (3, 'p6', 'lorem');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 6, 20, 'p1', 500, 750, 15.75, 'gas', false, true, true, 54);
INSERT INTO public.planet VALUES (2, 2, 3, 'p2', 500, 600, 3.90, 'hydrogen', false, false, true, 458);
INSERT INTO public.planet VALUES (3, 3, 3, 'p3', 30, 298, 34.80, 'gas', false, false, true, 2057);
INSERT INTO public.planet VALUES (4, 5, 6, 'p4', 192, 402, 40.50, 'ice', false, true, true, 300);
INSERT INTO public.planet VALUES (5, 4, 18, 'p5', 300, 13, 99.2, 'iron', false, false, true, 17);
INSERT INTO public.planet VALUES (6, 1, 12, 'p6', 750, 750, 1500.75, 'gas', false, false, true, 78);
INSERT INTO public.planet VALUES (7, 5, 2, 'p7', 500, 750, 15.75, 'gas', false, true, true, 54);
INSERT INTO public.planet VALUES (8, 4, 4, 'p8', 500, 60, 3.90, 'hydrogen', false, false, true, 45);
INSERT INTO public.planet VALUES (9, 3, 15, 'p9', 30, 98, 34.00, 'gas', true, false, true, 25);
INSERT INTO public.planet VALUES (10, 4, 19, 'p10', 19, 42, 30.3, 'water', true, true, true, 30);
INSERT INTO public.planet VALUES (11, 1, 5, 'p11', 300, 13, 99.2, 'graphite', false, false, true, 407);
INSERT INTO public.planet VALUES (12, 2, 14, 'p12', 750, 750, 1500.75, 'gas', false, false, true, 78);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 3, 11, 'star1', 500, 750, 15.75, 'gas', false, true);
INSERT INTO public.star VALUES (2, 6, 2, 'star2', 500, 600, 3.90, 'hydrogen', false, false);
INSERT INTO public.star VALUES (3, 6, 3, 'star3', 30, 298, 34.80, 'gas', false, false);
INSERT INTO public.star VALUES (4, 1, 8, 'star4', 192, 402, 40.50, 'gas', false, false);
INSERT INTO public.star VALUES (5, 4, 4, 'star5', 300, 13, 99.2, 'gas', false, false);
INSERT INTO public.star VALUES (6, 5, 1, 'star6', 750, 750, 1500.75, 'gas', false, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 26, true);


--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.more_info_more_info_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: more_info more_info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_name_key UNIQUE (name);


--
-- Name: more_info more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_pkey PRIMARY KEY (more_info_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

