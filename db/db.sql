--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: rails-mister-cocktail_development; Type: DATABASE; Schema: -; Owner: Tanas
--

CREATE DATABASE "rails-mister-cocktail_development" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE "rails-mister-cocktail_development" OWNER TO "Tanas";

\connect "rails-mister-cocktail_development"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: Tanas
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO "Tanas";

--
-- Name: cocktails; Type: TABLE; Schema: public; Owner: Tanas
--

CREATE TABLE cocktails (
    id integer NOT NULL,
    name character varying,
    photo character varying,
    description character varying
);


ALTER TABLE cocktails OWNER TO "Tanas";

--
-- Name: cocktails_id_seq; Type: SEQUENCE; Schema: public; Owner: Tanas
--

CREATE SEQUENCE cocktails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cocktails_id_seq OWNER TO "Tanas";

--
-- Name: cocktails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Tanas
--

ALTER SEQUENCE cocktails_id_seq OWNED BY cocktails.id;


--
-- Name: doses; Type: TABLE; Schema: public; Owner: Tanas
--

CREATE TABLE doses (
    id integer NOT NULL,
    description character varying,
    cocktail_id integer,
    ingredient_id integer
);


ALTER TABLE doses OWNER TO "Tanas";

--
-- Name: doses_id_seq; Type: SEQUENCE; Schema: public; Owner: Tanas
--

CREATE SEQUENCE doses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE doses_id_seq OWNER TO "Tanas";

--
-- Name: doses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Tanas
--

ALTER SEQUENCE doses_id_seq OWNED BY doses.id;


--
-- Name: ingredients; Type: TABLE; Schema: public; Owner: Tanas
--

CREATE TABLE ingredients (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE ingredients OWNER TO "Tanas";

--
-- Name: ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: Tanas
--

CREATE SEQUENCE ingredients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ingredients_id_seq OWNER TO "Tanas";

--
-- Name: ingredients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Tanas
--

ALTER SEQUENCE ingredients_id_seq OWNED BY ingredients.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: Tanas
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO "Tanas";

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Tanas
--

ALTER TABLE ONLY cocktails ALTER COLUMN id SET DEFAULT nextval('cocktails_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Tanas
--

ALTER TABLE ONLY doses ALTER COLUMN id SET DEFAULT nextval('doses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Tanas
--

ALTER TABLE ONLY ingredients ALTER COLUMN id SET DEFAULT nextval('ingredients_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: Tanas
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2016-08-13 23:03:13.10412	2016-08-13 23:03:13.10412
\.


--
-- Data for Name: cocktails; Type: TABLE DATA; Schema: public; Owner: Tanas
--

COPY cocktails (id, name, photo, description) FROM stdin;
1	Old Fashioned	\N	The Old Fashioned cocktail is old-school but never out of fashion.
2	Daiquiri	\N	It’s easy to see why the dark rum-based Daiquiri is a classic. The perfectly balanced combination of sweet, sour and spirit is refreshing and tangy, but also quite simple to make at home. Try making the recipe below and add this fool-proof drink to your bartending arsenal.
3	Margarita	\N	While the Margarita is one of the most popular cocktails in North America, its origins are shrouded in mystery. There are almost as many stories about who invented the margarita as there are margarita recipes. Some like them blended, others with a sweetener, but many argue the best margarita recipe is this classic one. Memorize it and you’ll never fail to impress.
4	Sidecar	\N	This is one ride you’ll gladly give up the wheel for.
5	French 75	\N	Possibly named for a World War I field gun, this classic drink packs a wallop.
6	Bloody Mary	\N	While the origin of this popular brunch cocktail is debatable, the Bloody Mary’s staying power leaves no question. The Bloody Mary is a vodka-soaked nutritional breakfast and hangover cure all in one. What else can you want?
7	Irish Coffee	\N	The secrets to making a great Irish Coffee are really so simple that they are often overlooked. This hot, creamy, classic Irish Coffee recipe from legendary bartender Dale DeGroff has all the right ingredients and will warm you to the bone.
8	Jack Rose	\N	The Jack Rose is smooth and sweetish - and deeply deceptive. Sipping it, you can't tell it contains liquor of any kind, let alone applejack. Ironic, that. The one classic cocktail to use New Jersey's indigenous firewater, and you can't even taste it.
9	Negroni	\N	The Negroni Cocktail is a classic Italian drink. Order a Negroni and you’ll be sure to Impress your bartender.
10	Boulevardier	\N	Swap out the gin in a Negroni for rye whiskey and you get the delicious Boulevardier. It’s equally complex as its gin-based predecessor, but the whiskey adds warmth, making it perfect for autumn and winter drinking.
11	Sazerac	\N	Forget the Hurricane. The Sazerac is what you should drink in New Orleans. One of America’s earliest cocktails, the Sazerac is a homegrown New Orleans specialty. Peychaud’s Bitters are a key element and were created by Antoine Peychaud, a French Quarter pharmacist, who invented the cocktail in the 1830s. The Sazerac was originally made with cognac, but an insect epidemic destroyed many French vineyards and resulted in the lasting switch to rye whiskey.
12	Vieux Carré	\N	The cognac-and-rye classic Vieux Carré cocktail was invented at New Orleans’ famed Carousel Bar.
13	Ramos Gin Fizz	\N	Love the Tom Collins? Try its frothy, bubbly cousin, the Gin Fizz. The secret to creating the perfect creaminess and froth is to shake, shake, shake—and then shake some more.
14	Mint Julep	\N	Celebrate Derby Day year-round with the Mint Julep, a classic bourbon refresher.
15	Whiskey Sour	\N	The Whiskey Sour is one classic cocktail that won’t make you sour.
16	Mai Tai	\N	The Mai Tai is an original tiki classic that is neither neon-colored nor overly sweet. In Tahitian, “Mai Tai” means “The best—out of this world,” as exclaimed by the first person to taste Trader Vic’s original version. The iconic tiki drink was created to showcase the flavor of good quality rum, and should never be neon-colored or overly sweet. A proper Mai Tai is a deep amber hue and allows the rum to shine through.
17	Planter's Punch	\N	The Planter’s Punch is a classic but highly variable refresher that’ll have your mouth watering in seconds.
18	Pisco Sour	\N	Both Chile and Peru claim the classic Pisco Sour as their own.
19	Cosmopolitan	\N	The original Cosmopolitan was created by a South Beach bartender named Cheryl Cook. Eager to invent a new cocktail for the Martini glass, Cheryl riffed on the classic Kamikaze using a newly introduced citrus-flavored vodka plus a splash of cranberry juice. The rest is rose-hued history.
20	Tom Collins	\N	The Tom Collins is essentially a sparkling lemonade spiked with a healthy dose of the juniper spirit. While there is a debate which side of the pond this drink was born, this cocktail lives up to his classic status with every sip.
21	Last Word	\N	This complex, herbal cocktail will win any argument.
22	aaaaa	image/upload/v1471129579/askjmoocu10z3bmqnola.jpg	aaaaa
\.


--
-- Name: cocktails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tanas
--

SELECT pg_catalog.setval('cocktails_id_seq', 22, true);


--
-- Data for Name: doses; Type: TABLE DATA; Schema: public; Owner: Tanas
--

COPY doses (id, description, cocktail_id, ingredient_id) FROM stdin;
1	4 drops of 	16	58
2	2 teaspoons of 	20	58
3	2 barrels of 	3	42
4	3 molecules of 	20	2
5	3 dashes of 	11	30
6	2 teaspoons of 	11	42
7	2 drops of 	14	5
8	4 bottles of 	18	42
9	4 dashes of 	21	11
10	2 teaspoons of 	5	10
11	3 molecules of 	10	41
12	3 bottles of 	8	19
13	3 drops of 	6	53
14	4 drops of 	3	26
15	2 molecules of 	9	44
16	3 dashes of 	16	52
17	3 dashes of 	10	45
18	2 drops of 	15	57
19	4 drops of 	13	26
20	2 molecules of 	16	51
21	2 drops of 	1	25
22	4 molecules of 	13	41
23	4 bottles of 	9	25
24	3 teaspoons of 	4	41
25	2 teaspoons of 	11	49
26	4 drops of 	6	19
27	2 dashes of 	20	44
28	4 teaspoons of 	13	45
29	2 molecules of 	9	15
30	2 bottles of 	10	21
31	2 dashes of 	15	16
32	2 teaspoons of 	12	37
33	2 bottles of 	5	34
34	3 barrels of 	10	34
35	4 barrels of 	14	15
36	4 teaspoons of 	2	6
37	4 hints of 	15	35
38	2 hints of 	7	36
39	4 hints of 	1	27
40	3 barrels of 	20	55
41	3 crates of 	16	22
42	4 molecules of 	17	20
43	4 crates of 	3	43
44	4 hints of 	13	4
45	4 bottles of 	1	33
46	3 bottles of 	21	19
47	4 teaspoons of 	17	5
48	4 cc of 	13	53
49	2 drops of 	19	25
50	3 hints of 	8	41
51	2 barrels of 	4	56
52	3 drops of 	2	54
53	2 bottles of 	17	9
54	3 teaspoons of 	14	51
55	4 molecules of 	21	40
56	4 cc of 	9	8
57	4 barrels of 	8	10
58	3 cc of 	4	47
59	3 barrels of 	7	57
60	2 dashes of 	14	52
61	4 dashes of 	11	21
62	2 teaspoons of 	8	15
63	3 teaspoons of 	21	35
64	2 barrels of 	10	32
65	4 drops of 	14	54
66	2 barrels of 	20	37
67	3 drops of 	12	58
68	2 cc of 	15	18
69	4 teaspoons of 	1	40
70	2 cc of 	21	38
71	3 molecules of 	6	50
72	3 crates of 	9	51
73	3 hints of 	19	13
74	3 cc of 	16	10
75	3 crates of 	8	1
76	2 crates of 	8	25
77	2 drops of 	12	34
78	4 dashes of 	12	4
79	2 hints of 	11	40
80	4 teaspoons of 	8	20
81	2 dashes of 	6	40
82	2 barrels of 	12	8
83	3 crates of 	12	27
84	3 drops of 	14	28
85	4 barrels of 	11	9
86	2 dashes of 	4	6
87	4 teaspoons of 	4	30
88	4 teaspoons of 	13	12
89	3 molecules of 	7	24
90	2 teaspoons of 	14	30
91	3 crates of 	19	35
92	3 bottles of 	6	33
93	4 teaspoons of 	6	32
94	3 barrels of 	18	57
95	1 tasse	22	1
\.


--
-- Name: doses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tanas
--

SELECT pg_catalog.setval('doses_id_seq', 95, true);


--
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: Tanas
--

COPY ingredients (id, name) FROM stdin;
1	Angostura Bitter
2	Bacardi Superior Rum
3	Banana
4	Beer
5	Bitter Lemon
6	Blackcurrant Cordial
7	Blackcurrant Juice
8	Brandy
9	Brown Sugar
10	Butter
11	Champagne
12	Chocolate
13	Cider
14	Cinnamon
15	Cocoa Powder
16	Coffee
17	Cointreau
18	Coke
19	Cranberry Juice
20	Cream
21	Dark Rum
22	Diet Coke
23	Double Cream
24	Egg white
25	Gin
26	Ginger Ale
27	Grenadine
28	Honey
29	Hot Chocolate
30	Lemon
31	Lemon Juice
32	Lemonade
33	Lime
34	Lime Juice
35	Marmalade
36	Milk
37	Nutmeg
38	Orange Juice
39	Pepper
40	Red Wine
41	Rum
42	Salt
43	Sherry Sweet
44	Soda Water
45	Sparkling Water
46	Sugar
47	Sugar Syrup
48	Sweet Vermouth
49	Tabasco Sauce
50	Tequila
51	Tonic Water
52	Triple Sec
53	Vermouth
54	Vodka
55	Whisky
56	White Rum
57	White Wine
58	Worcestershire Sauce
\.


--
-- Name: ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tanas
--

SELECT pg_catalog.setval('ingredients_id_seq', 58, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: Tanas
--

COPY schema_migrations (version) FROM stdin;
20160811102912
20160811102933
20160811103016
20160811114901
20160812100633
20160813191604
\.


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: Tanas
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: cocktails_pkey; Type: CONSTRAINT; Schema: public; Owner: Tanas
--

ALTER TABLE ONLY cocktails
    ADD CONSTRAINT cocktails_pkey PRIMARY KEY (id);


--
-- Name: doses_pkey; Type: CONSTRAINT; Schema: public; Owner: Tanas
--

ALTER TABLE ONLY doses
    ADD CONSTRAINT doses_pkey PRIMARY KEY (id);


--
-- Name: ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: Tanas
--

ALTER TABLE ONLY ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: Tanas
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: index_doses_on_cocktail_id; Type: INDEX; Schema: public; Owner: Tanas
--

CREATE INDEX index_doses_on_cocktail_id ON doses USING btree (cocktail_id);


--
-- Name: index_doses_on_cocktail_id_and_ingredient_id; Type: INDEX; Schema: public; Owner: Tanas
--

CREATE UNIQUE INDEX index_doses_on_cocktail_id_and_ingredient_id ON doses USING btree (cocktail_id, ingredient_id);


--
-- Name: index_doses_on_ingredient_id; Type: INDEX; Schema: public; Owner: Tanas
--

CREATE INDEX index_doses_on_ingredient_id ON doses USING btree (ingredient_id);


--
-- Name: fk_rails_48b6f209c2; Type: FK CONSTRAINT; Schema: public; Owner: Tanas
--

ALTER TABLE ONLY doses
    ADD CONSTRAINT fk_rails_48b6f209c2 FOREIGN KEY (cocktail_id) REFERENCES cocktails(id);


--
-- Name: fk_rails_961afcf26a; Type: FK CONSTRAINT; Schema: public; Owner: Tanas
--

ALTER TABLE ONLY doses
    ADD CONSTRAINT fk_rails_961afcf26a FOREIGN KEY (ingredient_id) REFERENCES ingredients(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: Tanas
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM "Tanas";
GRANT ALL ON SCHEMA public TO "Tanas";
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

