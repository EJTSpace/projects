--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    name character varying(50) NOT NULL,
    asteroid_id integer NOT NULL,
    has_orbit boolean NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_billions_of_years integer,
    diameter_in_kiloparsecs numeric(8,2),
    has_life boolean NOT NULL,
    is_spherical boolean,
    description text
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
    name character varying(50) NOT NULL,
    year_of_discovery integer,
    diameter_in_miles numeric(8,2),
    has_atmosphere boolean NOT NULL,
    is_larger_than_earth boolean,
    planet_id integer,
    description text
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    order_from_sun integer,
    diameter_in_miles numeric(8,2),
    has_life boolean,
    has_rings boolean NOT NULL,
    star_id integer,
    description text
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
    name character varying(50) NOT NULL,
    year_of_discovery integer,
    diameter_in_miles numeric(8,2),
    is_red_dwarf boolean,
    has_satellite boolean NOT NULL,
    galaxy_id integer,
    description text
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES ('Asteroid1', 1, false);
INSERT INTO public.asteroid VALUES ('Asteroid2', 2, true);
INSERT INTO public.asteroid VALUES ('Asteroid3', 3, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'MilkyWay', 14, 26.80, true, false, 'The Milky Way is a barred spiral galaxy that contains our Solar System');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10, 46.00, false, false, 'Andromeda is the closest major galaxy to the Milky Way');
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 12, 18.00, false, false, 'The Triangulum Galaxy is a small spiral galaxy');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 13, 15.00, false, false, 'The Sombrero Galaxy is a lenticular galaxy famous for its striking appearance');
INSERT INTO public.galaxy VALUES (5, 'NGC 2865', 1, 25.00, false, true, 'NGC 2865 is an elliptical galaxy believed to be the result of a past galactic merger.');
INSERT INTO public.galaxy VALUES (6, 'Magellanic Cloud', 13, 14.20, false, false, 'The LMC is a satellite galaxy of the Milky Way');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 1, 3474.00, false, false, 1, 'Earth’s only natural satellite');
INSERT INTO public.moon VALUES (2, 'Phobos', 1877, 22.00, false, false, 2, 'Small, irregular Mars moon');
INSERT INTO public.moon VALUES (4, 'Deimos', 1877, 12.00, false, false, 3, 'Mars moon likely a captured asteroid.');
INSERT INTO public.moon VALUES (5, 'Ganymede', 1610, 5268.00, true, false, 4, 'Largest moon in the Solar System.');
INSERT INTO public.moon VALUES (6, 'Titan', 1655, 5150.00, true, false, 5, 'Saturn’s largest moon');
INSERT INTO public.moon VALUES (7, 'Enceladus', 1789, 504.00, true, false, 6, 'key target in search for subsurface oceans.');
INSERT INTO public.moon VALUES (8, 'Triton', 1846, 2706.00, true, false, 7, 'Neptune’s largest moon');
INSERT INTO public.moon VALUES (9, 'Charon', 1978, 1212.00, false, false, 8, 'Pluto’s largest moon');
INSERT INTO public.moon VALUES (10, 'Styx', 2012, 16.00, false, false, 9, 'Tiny irregular moon of Pluto');
INSERT INTO public.moon VALUES (11, 'Nix', 2005, 49.00, false, false, 10, 'Small Pluto moon with irregular shape');
INSERT INTO public.moon VALUES (12, 'Kerberos', 2011, 19.00, false, false, 11, 'Small, irregular Pluto moon');
INSERT INTO public.moon VALUES (13, 'Hydra', 2005, 51.00, false, false, 12, 'Outer moon of Pluto');
INSERT INTO public.moon VALUES (14, 'Titania', 1787, 1578.00, false, false, 1, 'Largest moon of Uranus');
INSERT INTO public.moon VALUES (15, 'Oberon', 1787, 1523.00, false, false, 2, 'Second‑largest Uranian moon');
INSERT INTO public.moon VALUES (16, 'Cordelia', 1986, 40.00, false, false, 3, 'Inner Uranian moon');
INSERT INTO public.moon VALUES (17, 'Puck', 1985, 162.00, false, false, 4, 'Dark inner moon of Uranus');
INSERT INTO public.moon VALUES (18, 'Juliet', 1986, 94.00, false, false, 5, 'Inner Uranian moon ');
INSERT INTO public.moon VALUES (19, 'Desdemona', 1986, 64.00, false, false, 6, 'Small inner Uranian moon');
INSERT INTO public.moon VALUES (20, 'Mab', 2003, 24.00, false, false, 7, 'Tiny Uranian moon orbiting near Puck');
INSERT INTO public.moon VALUES (21, 'Rosalind', 1986, 72.00, false, false, 8, 'Inner Uranian moon');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 3032.10, false, false, 1, 'Smallest planet, extremely hot and cold.');
INSERT INTO public.planet VALUES (2, 'Venus', 2, 7521.20, false, false, 2, 'Thick toxic atmosphere, the hottest planet.');
INSERT INTO public.planet VALUES (3, 'Earth', 3, 7918.30, true, false, 3, 'Our home world.');
INSERT INTO public.planet VALUES (4, 'Mars', 4, 4212.40, false, false, 4, 'Cold desert world with ice caps.');
INSERT INTO public.planet VALUES (5, 'Jupiter', 5, 86881.00, false, true, 5, 'Largest planet, gas giant.');
INSERT INTO public.planet VALUES (6, 'Saturn', 6, 72367.00, false, true, 6, 'Famous for its complex ring system.');
INSERT INTO public.planet VALUES (7, 'Uranus', 7, 31518.00, false, true, 1, 'Ice giant tilted on its side.');
INSERT INTO public.planet VALUES (8, 'Neptune', 8, 30599.00, false, true, 2, 'Windy ice giant.');
INSERT INTO public.planet VALUES (9, 'Pluto', 9, 1476.00, false, false, 3, 'Small icy planet with a heart‑shaped glacier.');
INSERT INTO public.planet VALUES (10, 'J1407b Super‑Saturn', 1, 180000.00, false, true, 4, 'Giant planet with the largest ring system.');
INSERT INTO public.planet VALUES (11, 'Marshmallow Planet ', 1, 34000.00, false, false, 5, 'Ultra‑low‑density exoplanet ');
INSERT INTO public.planet VALUES (12, 'Hellstorm Planet', 1, 55000.00, false, false, 6, 'Extremely hot exoplanet.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'UY Scuti', 1860, 1.70, false, false, 6, 'One of the largest known stars');
INSERT INTO public.star VALUES (2, 'Stephenson', 1988, 3000.10, false, false, 5, 'Red supergiants or hypergiant');
INSERT INTO public.star VALUES (3, 'The Sun', 1, 1.40, false, true, 1, 'At the centre of our solar system');
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 1.18, false, true, 4, 'Red supergiant in Orion');
INSERT INTO public.star VALUES (5, 'Tabbys Star', 2016, 2.20, false, true, 3, 'Has a mysterious irregular dimming');
INSERT INTO public.star VALUES (6, 'Methuselah', 1912, 3.00, false, false, 2, 'One of the oldest known stars');


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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

