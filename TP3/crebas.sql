--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.10
-- Dumped by pg_dump version 9.1.10
-- Started on 2013-12-10 21:27:59 WET

SET statement_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 1989 (class 1262 OID 11955)
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

SET statement_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 1990 (class 1262 OID 11955)
-- Dependencies: 1989
-- Name: postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- TOC entry 175 (class 3079 OID 11681)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 1993 (class 0 OID 0)
-- Dependencies: 175
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 162 (class 1259 OID 16386)
-- Dependencies: 5
-- Name: account; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE account (
    id bigint NOT NULL,
    email character varying(255),
    name character varying(255),
    password character varying(255),
    picture character varying(255),
    username character varying(255),
    subscription character varying(3)
);


ALTER TABLE public.account OWNER TO postgres;

--
-- TOC entry 163 (class 1259 OID 16399)
-- Dependencies: 5
-- Name: account_genre; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE account_genre (
    users_id bigint NOT NULL,
    favorites_id bigint NOT NULL
);


ALTER TABLE public.account_genre OWNER TO postgres;

--
-- TOC entry 161 (class 1259 OID 16384)
-- Dependencies: 162 5
-- Name: account_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_id_seq OWNER TO postgres;

--
-- TOC entry 1994 (class 0 OID 0)
-- Dependencies: 161
-- Name: account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE account_id_seq OWNED BY account.id;


--
-- TOC entry 165 (class 1259 OID 16404)
-- Dependencies: 5
-- Name: actor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE actor (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.actor OWNER TO postgres;

--
-- TOC entry 164 (class 1259 OID 16402)
-- Dependencies: 5 165
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
-- TOC entry 1995 (class 0 OID 0)
-- Dependencies: 164
-- Name: actor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE actor_id_seq OWNED BY actor.id;


--
-- TOC entry 167 (class 1259 OID 16414)
-- Dependencies: 5
-- Name: director; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE director (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.director OWNER TO postgres;

--
-- TOC entry 166 (class 1259 OID 16412)
-- Dependencies: 167 5
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
-- TOC entry 1996 (class 0 OID 0)
-- Dependencies: 166
-- Name: director_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE director_id_seq OWNED BY director.id;


--
-- TOC entry 169 (class 1259 OID 16424)
-- Dependencies: 5
-- Name: genre; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE genre (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.genre OWNER TO postgres;

--
-- TOC entry 168 (class 1259 OID 16422)
-- Dependencies: 5 169
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
-- TOC entry 1997 (class 0 OID 0)
-- Dependencies: 168
-- Name: genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE genre_id_seq OWNED BY genre.id;


--
-- TOC entry 171 (class 1259 OID 16434)
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
-- TOC entry 172 (class 1259 OID 16445)
-- Dependencies: 5
-- Name: movie_actor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE movie_actor (
    movies_id bigint NOT NULL,
    actors_id bigint NOT NULL
);


ALTER TABLE public.movie_actor OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 16450)
-- Dependencies: 5
-- Name: movie_director; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE movie_director (
    movies_id bigint NOT NULL,
    directors_id bigint NOT NULL
);


ALTER TABLE public.movie_director OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 16455)
-- Dependencies: 5
-- Name: movie_genre; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE movie_genre (
    movies_id bigint NOT NULL,
    genres_id bigint NOT NULL
);


ALTER TABLE public.movie_genre OWNER TO postgres;

--
-- TOC entry 170 (class 1259 OID 16432)
-- Dependencies: 171 5
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
-- TOC entry 1998 (class 0 OID 0)
-- Dependencies: 170
-- Name: movie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE movie_id_seq OWNED BY movie.id;


--
-- TOC entry 1829 (class 2604 OID 16389)
-- Dependencies: 161 162 162
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY account ALTER COLUMN id SET DEFAULT nextval('account_id_seq'::regclass);


--
-- TOC entry 1830 (class 2604 OID 16407)
-- Dependencies: 165 164 165
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY actor ALTER COLUMN id SET DEFAULT nextval('actor_id_seq'::regclass);


--
-- TOC entry 1831 (class 2604 OID 16417)
-- Dependencies: 166 167 167
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY director ALTER COLUMN id SET DEFAULT nextval('director_id_seq'::regclass);


--
-- TOC entry 1832 (class 2604 OID 16427)
-- Dependencies: 169 168 169
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY genre ALTER COLUMN id SET DEFAULT nextval('genre_id_seq'::regclass);


--
-- TOC entry 1833 (class 2604 OID 16437)
-- Dependencies: 170 171 171
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movie ALTER COLUMN id SET DEFAULT nextval('movie_id_seq'::regclass);


--
-- TOC entry 1972 (class 0 OID 16386)
-- Dependencies: 162 1985
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY account (id, email, name, password, picture, username, subscription) FROM stdin;
1	jooaooferreira@gmail.com	João Ferreira	202cb962ac59075b964b07152d234b70	http://gravatar.com/avatar/ee7077cdde4599d263e7d6d8f2aec8ab?s=32	jpbat	\N
2	zeto@telmadas.neves	toze	bfb326d90c8d12aec7f675ec014f03f3	http://gravatar.com/avatar/f33482a76a7e29c8c8f25013d6e4ebce?s=32	telma	\N
3	jfms7s@gmail.com	João Silva	202cb962ac59075b964b07152d234b70	http://gravatar.com/avatar/55c3a1a5c8b873dbc8aac8b48d47440b?s=32	jfs	\N
\.


--
-- TOC entry 1973 (class 0 OID 16399)
-- Dependencies: 163 1985
-- Data for Name: account_genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY account_genre (users_id, favorites_id) FROM stdin;
1	3
1	5
\.


--
-- TOC entry 1999 (class 0 OID 0)
-- Dependencies: 161
-- Name: account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('account_id_seq', 3, true);


--
-- TOC entry 1975 (class 0 OID 16404)
-- Dependencies: 165 1985
-- Data for Name: actor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY actor (id, name) FROM stdin;
1	Alexandra Daddario
2	Tania Raymonde
3	Scott Eastwood
4	Andy Garcia
5	Kim Coates
6	Deborah Kara Unger
7	Sean Penn
8	Ryan Gosling
9	Emma Stone
10	Marlon Wayans
11	Essence Atkins
12	Marlene Forte
13	Maggie Smith
14	Michael Gambon
15	Billy Connolly
16	Chris Colfer
17	Rebel Wilson
18	Christina Hendricks
19	Chris Messina
20	Rich Sommer
21	Tom O'Brien
22	Billy Bob Thornton
23	Eva Longoria
24	Thomas Brodie-Sangster
25	(not applicable)
26	Pankaj Kapur
27	Imran Khan
28	Anushka Sharma
29	Sang-kyung Kim
30	Ye-jin Son
31	Kyung-gu Sol
32	Noel Clarke
33	Colin O'Donoghue
34	Antonia Campbell-Hughes
35	Jessica Chastain
36	Joel Edgerton
37	Chris Pratt
38	Nikolaj Coster-Waldau
39	Megan Charpentier
40	Arnold Schwarzenegger
41	Forest Whitaker
42	Johnny Knoxville
43	Mark Wahlberg
44	Russell Crowe
45	Catherine Zeta-Jones
46	Common
47	Michael Rainey Jr.
48	Dennis Haysbert
49	David Dewaele
50	Alexandra Lemâtre
51	Christophe Bon
52	Jeremy Renner
53	Gemma Arterton
54	Peter Stormare
55	Jason Statham
56	Jennifer Lopez
57	Michael Chiklis
58	Stephen Merchant
59	Richard Gere
60	Saif Ali Khan
61	Anil Kapoor
62	John Abraham
63	Chase Williamson
64	Rob Mayes
65	Paul Giamatti
66	Ohad Knoller
67	Shlomo Sadan
68	Oz Zehavi
69	Werner Herzog
70	Rob Lowe
71	Jamie Chung
72	Julie Bowen
73	Blake Freeman
74	Mindy Sterling
75	Jason Mewes
76	Nicholas Hoult
77	Teresa Palmer
78	John Malkovich
79	Sylvester Stallone
80	Jason Momoa
81	Christian Slater
82	Al Pacino
83	Alan Arkin
84	Christopher Walken
85	Abigail Spencer
86	Chad Michael Murray
87	Katee Sackhoff
88	Trent Reznor
89	Tom Petty
90	Mick Fleetwood
91	Jason Bateman
92	Melissa McCarthy
93	John Cho
94	Rooney Mara
95	Channing Tatum
96	Jude Law
97	Saskia Rosendahl
98	Kai-Peter Malina
99	Nele Trebs
100	Tom Cruise
101	Tim Robbins
102	Kelly McGillis
103	Bruce Willis
104	Jai Courtney
105	Sebastian Koch
106	Alice Englert
107	Viola Davis
108	Emma Thompson
109	Julianne Hough
110	Josh Duhamel
111	Cobie Smulders
112	Gael García Bernal
113	Alfredo Castro
114	Antonia Zegers
115	Charlie Sheen
116	Jason Schwartzman
117	Bill Murray
118	Brendan Fraser
119	Sarah Jessica Parker
120	Jessica Alba
121	Rin Takanashi
122	Tadashi Okuno
123	Ryô Kase
124	Juvenile
125	Dwayne Johnson
126	Susan Sarandon
127	Jon Bernthal
128	Keri Russell
129	Jake Brennan
130	Josh Hamilton
131	Alexander Siddig
132	Joshua Jackson
133	Marisa Tomei
134	Luke Ganalon
135	Joseph A. Garcia
136	Miriam Colon
137	Amit Sadh
138	Sushant Singh Rajput
139	Raj Kumar Yadav
140	Stanley Tucci
141	Ewan McGregor
142	Miles Teller
143	Justin Chon
144	Jonathan Keltz
145	Ashley Bell
146	Julia Garner
147	Spencer Treat Clark
148	Mia Wasikowska
149	Nicole Kidman
150	Matthew Goode
151	Ed Harris
152	Julian Adams
153	David Duchovny
154	Mark Webber
155	Alia Shawkat
156	Shannyn Sossamon
157	Harry Belafonte
158	Regina Spektor
159	Glen Campbell
160	Chitrangda Singh
161	Prachi Desai
162	Emily Mortimer
163	Kazuko Yoshiyuki
164	Shidô Nakamura
165	Billy Unger
166	John Marengo
167	Sammi Hanratty
168	James Franco
169	Michelle Williams
170	Rachel Weisz
171	Colin Farrell
172	Noomi Rapace
173	Dominic Cooper
174	Cosmina Stratan
175	Cristina Flutur
176	Valeriu Andriuta
177	Ingrid Bolsø Berdal
178	Iván González
179	Kyra Zagorsky
180	Matthew Fox
181	Colin Moy
182	Tommy Lee Jones
183	Ulrich Thomsen
184	Claudia Michelsen
185	Wotan Wilke Möhring
186	Steve Carell
187	Luke Vanek
188	Steve Buscemi
189	Halle Berry
190	Evie Thompson
191	Abigail Breslin
192	Elle Fanning
193	Annette Bening
194	Sarah Bolger
195	Chris Noth
196	Anton Yelchin
197	Jim Sturgess
198	Kirsten Dunst
199	Timothy Spall
200	Aniello Arena
201	Paola Minaccioni
202	Loredana Simioli
203	Vanessa Hudgens
204	Selena Gomez
205	Ashley Benson
206	Laura Prepon
207	Jillian Clare
208	Bryan Greenberg
209	Goran Visnjic
210	Kate del Castillo
211	D.B. Sweeney
212	Gerard Butler
213	Aaron Eckhart
214	Morgan Freeman
215	Nicolas Cage
216	Ryan Reynolds
217	Tina Fey
218	Paul Rudd
219	Nat Wolff
220	Chris O'Dowd
221	Deborah Mailman
222	Jessica Mauboy
223	Patrick Huard
224	Julie LeBreton
225	Antoine Bertrand
226	Ty Hickson
227	Tashiana Washington
228	Joshua Rivera
229	Liam Hemsworth
230	Aimee Teegarden
231	Chris Nicola
232	Fruzsina Pelikán
233	Saul Stermer
234	James Floyd
235	Elarica Gallacher
236	Fady Elsayed
237	Minnie Driver
238	Kristian Gwilliam
239	Adam Byard
240	Ebon Moss-Bachrach
241	Vinessa Shaw
242	Daniel Giménez Cacho
243	Adrien Brody
244	Lindsay Lohan
245	Michelle Rodriguez
246	John McElhone
247	Michael P. Murphy
248	Maureen Murphy
249	Paul Gordon
250	Jonny Mars
251	Chris Doubek
252	Adrianne Palicki
253	Saoirse Ronan
254	Max Irons
255	Jake Abel
256	Jurnee Smollett-Bell
257	Vanessa Williams
258	Brandy Norwood
259	Bradley Cooper
260	Eva Mendes
261	James McAvoy
262	Mark Strong
263	Andrea Riseborough
264	Jack Plotnick
265	Todd Giebenhain
266	Eric Judor
267	Ajay Devgn
268	Tamannaah Bhatia
269	Mahesh Manjrekar
270	Toni Collette
271	Anthony LaPaglia
272	Liev Schreiber
273	Maribel Verdú
274	Emilio Gavira
275	Jane Levy
276	Shiloh Fernandez
277	Jessica Lucas
278	Sam Neill
279	Laura Dern
280	Jeff Goldblum
281	Rosario Dawson
282	Vincent Cassel
283	Robert Redford
284	Brit Marling
285	Brady Corbet
286	Mati Diop
287	Lila Salet
288	Amy Seimetz
289	Frank Mosley
290	Shane Carruth
291	Juno Temple
292	Michael Angarano
293	Alexis Bledel
294	Thure Lindhardt
295	Georgina Reilly
296	Dylan Smith
297	Julianne Moore
298	Jonathan Rhys Meyers
299	Jeffrey DeMunn
300	Chadwick Boseman
301	T.R. Knight
302	Harrison Ford
303	Simon Rex
304	Ashley Tisdale
305	Ben Affleck
306	Olga Kurylenko
307	Javier Bardem
308	Caleb Landry Jones
309	Lisa Berry
310	Sarah Gadon
311	Rachel Boston
312	Laura Adkin
313	Kevin M. Brennan
314	Paul Brannigan
315	John Henshaw
316	Roger Allam
317	Jonah Bobo
318	Haley Ramm
319	Florian Lukas
320	David Kross
321	Lachlan Nieboer
322	Cody Longo
323	Walid Amini
324	John Schneider
325	Sheri Moon Zombie
326	Meg Foster
327	Bruce Davison
328	Gina Rodriguez
329	Jenni Rivera
330	Lou Diamond Phillips
331	Fabrice Luchini
332	Vincent Schmitt
333	Ernst Umhauer
334	Anthony Mackie
335	Robert De Niro
336	Diane Keaton
337	Katherine Heigl
338	Matthew McConaughey
339	Tye Sheridan
340	Jacob Lofland
341	Pål Sverre Hagen
342	Anders Baasmo Christiansen
343	Gustaf Skarsgård
344	Colin Firth
345	Emily Blunt
346	Anne Heche
347	Dennis Quaid
348	Zac Efron
349	Kim Dickens
350	Riz Ahmed
351	Kiefer Sutherland
352	Arnold Reyes
353	Menggie Cobarrubias
354	Dido De La Paz
355	Robert Downey Jr.
356	Guy Pearce
357	Gwyneth Paltrow
358	Pierce Brosnan
359	Trine Dyrholm
360	Molly Blixt Egelind
361	Rachel Zoe
362	Candice Bergen
363	Ashley Olsen
364	Michael Shannon
365	Chris Evans
366	Clément Métayer
367	André Marcon
368	Lola Créton
369	Alexander Skarsgård
370	Steve Coogan
371	Joséphine de La Baume
372	Milo Ventimiglia
373	Roxane Mesquida
374	Penn Badgley
375	Imogen Poots
376	Norbert Leo Butz
377	Keanu Reeves
378	Bojana Novakovic
379	Adelaide Clemens
380	Barlow Jacobs
381	Clare Bowen
382	David Call
383	Richard E. Grant
384	Sarah Brightman
385	Mía Maestro
386	Christian Vasquez
387	Angélica Aragón
388	Liz Gallardo
389	Leonardo DiCaprio
390	Carey Mulligan
391	Craig Robinson
392	Kerry Washington
393	David Alan Grier
394	Alice Lowe
395	Kenneth Hadley
396	Steve Oram
397	Eli Roth
398	Ariel Levy
399	Nicolás Martínez
400	Luke Evans
401	Gary Grubbs
402	Kellan Lutz
403	Verdi Solaiman
404	Mickey Rourke
405	Chris Pine
406	Zachary Quinto
407	Zoe Saldana
408	Greta Gerwig
409	Mickey Sumner
410	Adam Driver
411	Michael Polley
412	John Buchan
413	Mark Polley
414	Nick Alachiotis
415	Liana Liberato
416	Greg Kinnear
417	Vincent Lindon
418	Stéphan Wojtowicz
419	Soko
420	Katie Aselton
421	Lake Bell
422	Kate Bosworth
423	Salam Fayyad
424	Mahmoud Abbas
425	Tzipi Livni
426	Vin Diesel
427	Paul Walker
428	Zach Galifianakis
429	Ed Helms
430	Amanda Seyfried
431	Josh Hutcherson
432	Beyoncé Knowles
433	Ethan Hawke
434	Julie Delpy
435	Seamus Davey-Fitzpatrick
436	Hadas Yaron
437	Yiftach Klein
438	Irit Sheleg
439	Julian Assange
440	Adrian Lamo
441	Chelsea Manning
442	Jaden Smith
443	David Denman
444	Will Smith
445	Jesse Eisenberg
446	Mark Ruffalo
447	Nick Robinson
448	Gabriel Basso
449	Moises Arias
450	Ellen Page
451	Clive Owen
452	Gillian Anderson
453	Barbara Sukowa
454	Axel Milberg
455	Janet McTeer
456	Nils d'Aulaire
457	Jay Klaitz
458	Julie Ann Emery
459	Vince Vaughn
460	Owen Wilson
461	Rose Byrne
462	Lena Headey
463	Max Burkholder
464	Alexis Denisof
465	Amy Acker
466	Fran Kranz
467	James Gandolfini
468	Jeremy Scahill
469	Nasser Al Aulaqi
470	Saleha Al Aulaqi
471	Felicity Price
472	Amber Heard
473	Morton Downey Jr.
474	Glenn Beck
475	Victoria Jackson
476	Henry Cavill
477	Amy Adams
478	Jonah Hill
479	Seth Rogen
480	Pulkit Samrat
481	Manjot Singh
482	Ali Fazal
483	Toby Jones
484	Antonio Mancino
485	Guido Adorni
486	Brad Pitt
487	Mireille Enos
488	Daniella Kertesz
489	Billy Crystal
490	John Goodman
491	Terence Stamp
492	Christopher Eccleston
493	Elijah Wood
494	Nora Arnezeder
495	America Olivo
496	Pilou Asbæk
497	Søren Malling
498	Dar Salim
499	Mike D
500	Henry Rollins
501	Noel Gallagher
502	Katie Chang
503	Israel Broussard
504	Emma Watson
505	Jamie Foxx
506	Maggie Gyllenhaal
507	Sandra Bullock
508	Michael McDonald
509	Javier Cámara
510	Pepa Charro
511	Cecilia Roth
512	Sam Riley
513	Agata Buzek
514	Vicky McClure
515	Melvil Poupaud
516	Emmanuel Schwartz
517	Suzanne Clément
518	Adam Brody
519	Kristen Bell
520	Zoe Kazan
521	Freeway Ricky Ross
522	David Simon
523	Johnny Depp
524	Armie Hammer
525	William Fichtner
526	Kristen Wiig
527	Benjamin Bratt
528	Allison Janney
529	Matt Lucas
530	Anna Friel
531	Charlie Bewley
532	Alexandra Dowling
533	Clive Standen
534	Sienna Miller
535	Golshifteh Farahani
536	Bahar Soomekh
537	Idris Elba
538	Charlie Hunnam
539	Rinko Kikuchi
540	Adam Sandler
541	Kevin James
542	Chris Rock
543	Michael B. Jordan
544	Melonie Diaz
545	Octavia Spencer
546	Mads Mikkelsen
547	Thomas Bo Larsen
548	Annika Wedderkopp
549	Lawrence Michael Levine
550	Kelsy Abbott
551	Adam Wingard
552	Michael Cera
553	Gaby Hoffmann
554	Juan Andrés Silva
555	Jeff Garlin
556	Steve Agee
557	Gina Gershon
558	Farhan Akhtar
559	Sonam Kapoor
560	Pavan Malhotra
561	James Cromwell
562	Ronan Rees
563	Geneviève Bujold
564	Ólafur Darri Ólafsson
565	Stefán Hallur Stefánsson
566	Jóhann G. Jóhannsson
567	Brooke Shields
568	Wanda Sykes
569	Daryl Hannah
570	María Villar
571	Alessio Rigo de Righi
572	Agustina Muñoz
573	John Travolta
574	Norman Reedus
575	Helen Mirren
576	Jeff Bridges
577	Mary-Louise Parker
578	Maya Rudolph
579	Patrick Wilson
580	Vera Farmiga
581	Ron Livingston
582	Matt Dillon
583	Kristin Scott Thomas
584	Vithaya Pansringarm
585	Tilikum
586	Dave Duffus
587	Samantha Berg
588	Irrfan Khan
589	Rishi Kapoor
590	Arjun Rampal
591	Dorian Missick
592	Suzy Jane Hunt
593	Gbenga Akinnagbe
594	Hugh Jackman
595	Will Yun Lee
596	Tao Okamoto
597	Aubrey Plaza
598	Johnny Simmons
599	Bill Hader
600	Cate Blanchett
601	Alec Baldwin
602	Peter Sarsgaard
603	Frank Langella
604	Wes Bentley
605	Sarah Paulson
606	Mi Yang
607	Amber Kuo
608	Zhendong Ke
609	Louis Koo
610	Honglei Sun
611	Yi Huang
612	Agnes Bruckner
613	Madeline Zima
614	Shawn Ashmore
615	Denzel Washington
616	Paula Patton
617	Neil Patrick Harris
618	Jayma Mays
619	Katy Perry
620	Shailene Woodley
621	Kyle Chandler
622	James Deen
623	Nolan Gerard Funk
624	Sharlto Copley
625	Michael Nyqvist
626	Christian Camargo
627	Myles Pollard
628	Xavier Samuel
629	Sam Worthington
630	Matt Damon
631	Jodie Foster
632	Logan Lerman
633	Brandon T. Jackson
634	Jason Sudeikis
635	Jennifer Aniston
636	Emma Roberts
637	Carlos Alazraqui
638	Dane Cook
639	Stacy Keach
640	Emile Hirsch
641	Lance LeGault
642	Deepika Padukone
643	Shah Rukh Khan
644	Satyaraj
645	Fred Melamed
646	Rafe Spall
647	Alex Macqueen
648	Aaron Taylor-Johnson
649	Chloë Grace Moretz
650	Christopher Mintz-Plasse
651	Oprah Winfrey
652	John Cusack
653	Gary Oldman
654	Ashton Kutcher
655	Dermot Mulroney
656	Josh Gad
657	Casey Affleck
658	Ben Foster
659	JJ Feild
660	Jennifer Coolidge
661	Lily Collins
662	Jamie Campbell Bower
663	Robert Sheehan
664	Simon Pegg
665	Nick Frost
666	Martin Freeman
667	Sharni Vinson
668	Joe Swanberg
669	AJ Bowen
670	Tony Leung Chiu Wai
671	Ziyi Zhang
672	Jin Zhang
673	Olivia Wilde
674	Jake Johnson
675	Anna Kendrick
676	Brie Larson
677	Frantz Turner
678	John Gallagher Jr.
679	Dan Fogler
680	Miracle Laurie
681	Jon Voight
682	Eric Bana
683	Rebecca Hall
684	Jim Broadbent
685	Rachel McAdams
686	Karoline Herfurth
687	Eugenio Derbez
688	Karla Souza
689	Jessica Lindsey
690	Mamie Gummer
691	Martin Starr
692	Siam Yu
693	Kolton Stewart
694	Gage Munroe
695	Karl Urban
696	Parineeti Chopra
697	Logan Bartholomew
698	Peter Fonda
699	Ali Hillis
700	Rosemarie DeWitt
701	Josh Pais
702	Romain Duris
703	Féodor Atkine
704	Déborah François
705	Freda Kelly
706	Paul McCartney
707	John Lennon
708	Barbara Hershey
709	Michelle Pfeiffer
710	Dianna Agron
711	Ritesh Deshmukh
712	Vivek Oberoi
713	Aftab Shivdasani
714	Waad Mohammed
715	Reem Abdullah
716	Abdullrahman Al Gohani
717	Isaiah Washington
718	Tequan Richmond
719	Tim Blake Nelson
720	Brandon Darby
721	Scott Crow
722	Lisa Fithian
723	Tippi Hedren
724	Kevin Bacon
725	Ray Stevenson
726	Jake Gyllenhaal
727	Josh Holloway
728	Laz Alonso
729	Josh Peck
730	Julia Louis-Dreyfus
731	Catherine Keener
732	Jonathan Groff
733	Denis O'Hare
734	Corey Stoll
735	Sam Rockwell
736	Jeffrey Wright
737	Kelly Reilly
738	Judy Garland
739	Frank Morgan
740	Ray Bolger
741	Daniel Brühl
742	Chris Hemsworth
743	Anna Faris
744	Will Forte
745	Taye Diggs
746	Jill Scott
747	Joseph Gordon-Levitt
748	Scarlett Johansson
749	Bill Sage
750	Ambyr Childers
751	George Clooney
752	Justin Timberlake
753	Laura Ramsey
754	Jaime Camil
755	Omar Chaparro
756	Ranbir Kapoor
757	Pallavi Sharda
758	AJ Michalka
759	Kelly Thiebaud
760	James Denton
761	Adam Scott
762	Richard Jenkins
763	Catherine O'Hara
764	Robin Weigert
765	Maggie Siff
766	Johnathan Tchaikovsky
767	Tom Welling
768	Jeremy Lin
769	Daniel Dae Kim
770	Ming Yao
771	Sally Hawkins
772	Christine Barnes
773	Hoselito Bite
774	Marco Confortola
775	Ken Marino
776	Gillian Jacobs
777	Patrick Warburton
778	Tom Hanks
779	Barkhad Abdi
780	Barkhad Abdirahman
781	Danny Trejo
782	Alexa Vega
783	Mel Gibson
784	Hailee Steinfeld
785	Douglas Booth
786	Damian Lewis
787	Roy Abramsohn
788	Elena Schuber
789	Katelynn Rodriguez
790	Skylan Brooks
791	Ethan Dizon
792	Jordin Sparks
793	Anson Mount
794	Whitney Able
795	Alan Rickman
796	Malin Akerman
797	Justin Bartha
798	January Jones
799	Jason Isaacs
800	Kelen Coleman
801	Avis-Marie Barnes
802	Kevin Alejandro
803	Gabriella Wilde
804	Benedict Cumberbatch
805	Carice van Houten
806	Chiwetel Ejiofor
807	Michael K. Williams
808	Michael Fassbender
809	50 Cent
810	Daniel Radcliffe
811	Dane DeHaan
812	Michael C. Hall
813	Penélope Cruz
814	Cameron Diaz
815	Jackson Nicoll
816	Greg Harris
817	Léa Seydoux
818	Adèle Exarchopoulos
819	Salim Kechiouche
820	Gad Elmaleh
821	Gabriel Byrne
822	Liya Kebede
823	Grant Achatz
824	Cindy Breitbach
825	Mike Breitbach
826	Chiara Mastroianni
827	Julie Bataille
828	Asa Butterfield
829	Michael Douglas
830	Woody Harrelson
831	Domhnall Gleeson
832	Bill Nighy
833	Jennifer Garner
834	Jared Leto
835	Naomi Watts
836	Naveen Andrews
837	Douglas Hodge
838	Sarah Polley
839	Diane Kruger
840	Veerle Baetens
841	Johan Heldenbergh
842	Nell Cattrysse
843	Jean-Marc Barr
844	Josh Lucas
845	Natalie Portman
846	Tom Hiddleston
847	Sophie Nélisse
848	Geoffrey Rush
849	Emily Watson
850	Lance Armstrong
851	Reed Albergotti
852	Betsy Andreu
853	Tom Holland
854	George MacKay
855	Maiara Walsh
856	Brant Daugherty
857	Cody Christian
858	LisaGay Hamilton
859	Yolonda Ross
860	Edward James Olmos
861	Justin Long
862	Jess Weixler
863	Tyler Labine
864	Bruce Dern
865	June Squibb
866	Monica Calhoun
867	Morris Chestnut
868	Melissa De Sousa
869	Shia LaBeouf
870	Evan Rachel Wood
871	Johannes Zeiler
872	Anton Adasinsky
873	Isolda Dychauk
874	Alicia Witt
875	Cheryl Hines
876	Sonya Walger
877	Jennifer Lawrence
878	Idina Menzel
879	Josh Brolin
880	Elizabeth Olsen
881	Samuel L. Jackson
882	Angela Bassett
883	Jennifer Hudson
884	Naomie Harris
885	Terry Pheto
886	Glória Pires
887	Miranda Otto
888	Tracy Middendorf
889	Christian Bale
890	Oscar Isaac
891	Ian McKellen
892	Richard Armitage
893	Tyler Perry
894	Tika Sumpter
895	Will Ferrell
896	Christina Applegate
897	John Leguizamo
898	Tiya Sircar
899	Joaquin Phoenix
900	Ben Stiller
901	P.J. Byrne
902	Jon Favreau
903	Meryl Streep
904	Julia Roberts
905	Hiroyuki Sanada
906	Kô Shibasaki
907	Kim Basinger
908	Fernanda Andrade
909	Simon Quarterman
910	Evan Helmuth
911	Ron Eldard
912	Bobby Cannavale
913	Jill Hennessy
914	Tony Oller
915	Muhammet Uzuner
916	Yilmaz Erdogan
917	Taner Birsel
918	Ken'ichi Matsuyama
919	Kiko Mizuhara
920	Giovanni Ribisi
921	Kate Beckinsale
922	Queen Latifah
923	Dolly Parton
924	Keke Palmer
925	Paige O'Hara
926	Robby Benson
927	Richard White
928	Felicity Jones
929	Jessica Brown Findlay
930	Lauren German
931	Michael Biehn
932	Peter Facinelli
933	Jaimie Alexander
934	Michael Madsen
935	Tilda Swinton
936	John C. Reilly
937	Ezra Miller
938	Bo Boddie
939	Eric Bogosian
940	Gwynn Galitzer
941	Michael Ealy
942	India Eisley
943	Gina Carano
944	Ralph Fiennes
945	Brian Cox
946	Cuba Gooding Jr.
947	Gerald McRaney
948	David Oyelowo
949	Ni Ni
950	Xinyi Zhang
951	Stephanie Sigman
952	Irene Azuela
953	Jose Yenque
954	Ha-kyun Shin
955	Soo Go
956	Seung-su Ryu
957	Carol Channing
958	Loni Anderson
959	Mary Jo Catlett
960	Liam Neeson
961	Frank Grillo
962	Jason O'Mara
963	Daniel Sunjata
964	Glenn Close
965	Elizabeth Banks
966	Jamie Bell
967	Valérie Donzelli
968	Jérémie Elkaïm
969	César Desseix
970	Brittania Nicol
971	Henry Garrett
972	Graham McTavish
977	Sigourney Weaver
981	Isla Fisher
983	Lizzy Caplan
988	Melanie Lynskey
991	Christopher Abbott
993	Blythe Danner
995	James Buckley
997	Blake Harrison
1000	Joe Thomas
1004	Zachary Booth
1007	Julianne Nicholson
1012	Leticia Dolera
1013	Diego Martín
1014	Ismael Martínez
1018	Paul Dano
1020	Margarita Levieva
1021	Jon Heder
1023	Ed Stoppard
1024	Leelee Sobieski
1025	Jeffrey Tambor
1029	Wayne White
1030	Mimi Pond
1032	Paul Reubens
1036	Joan Cusack
1037	Cary Elwes
1041	Philip Seymour Hoffman
1067	Milla Jovovich
1068	Sienna Guillory
1069	Albert Brooks
1070	Ellen DeGeneres
1071	Alexander Gould
1072	Josh Radnor
1073	Jürgen Rißmann
1074	Thomas Wodianka
1075	Reiner Schöne
1076	Olivia Thirlby
1077	Michael Peña
1078	Elisabeth Shue
1079	Max Thieriot
1080	Clint Eastwood
1081	Peter Staley
1082	Larry Kramer
1083	Iris Long
1084	Diana Vreeland
1085	Richard Avedon
1086	David Bailey
1087	Ashley Hinshaw
1088	Heather Graham
1089	Louise Grinberg
1090	Juliette Darche
1091	Roxane Duran
1092	Ryan O'Nan
1093	Michael Weston
1094	Arielle Kebbel
1095	Sarah Megan Thomas
1096	James Van Der Beek
1097	Glenn Morshower
1098	Lynn Collins
1099	Bruce McGill
1100	Andy Samberg
1101	Holly Hunter
1102	Brittany Snow
1103	Sarunas Marciulionis
1104	Arvydas Sabonis
1105	Rimas Kurtinaitis
1106	James Purefoy
1107	Max von Sydow
1108	Rachel Hurd-Wood
1109	Nopachai Chaiyanam
1110	Sirin Horwang
1111	Chanokporn Sayoungkul
1112	Bill Pullman
1113	Marcia Cross
1114	Ciarán Hinds
1115	Alex Russell
1116	Drew Barrymore
1117	John Krasinski
1118	John Pingayak
1119	Sara Paxton
1120	Pat Healy
1121	Neil Maskell
1122	MyAnna Buring
1123	Harry Simpson
1124	Abbie Cornish
1125	James D'Arcy
1126	Robert Patrick
1127	Michael Caine
1128	Robert Wieckiewicz
1129	Benno Fürmann
1130	Agnieszka Grochowska
1131	Eva Green
1132	Lauren Tempany
1133	János Derzsi
1134	Erika Bók
1135	Mihály Kormos
1136	Eman Xor Oña
1137	Limara Meneses
1138	Mario Guerra
1139	Linda Cardellini
1140	John Slattery
1141	Reese Witherspoon
1142	Tom Hardy
1143	Bridgit Mendler
1144	Amy Poehler
1145	Will Arnett
1146	Billy Crudup
1147	Josiah Patkotak
1148	Frank Qutuq Irelan
1149	John Miller
1150	Matthias Schoenaerts
1151	Jeroen Perceval
1152	Jeanne Dandoy
1153	Michael Fuith
1154	David Rauchenberger
1155	Christine Kain
1156	Predrag Manojlovic
1157	Mira Furlan
1158	Boris Ler
1159	Gabrielle Union
1160	Thandie Newton
1161	Jennifer Carpenter
1162	Alex Veadov
1163	Roselyn Sanchez
1164	Nestor Serrano
1165	Tristan Halilaj
1166	Sindi Lacej
1167	Refet Abazi
1168	Dominique Abel
1169	Fiona Gordon
1170	Bruno Romy
1171	Caitlin Stasey
1172	Lincoln Lewis
1173	Jack McBrayer
1174	Jane Lynch
1175	Cung Le
1176	Lucy Liu
1177	Nadine Velazquez
1178	Don Cheadle
1179	Frances McDormand
1180	Judd Hirsch
1181	Tobey Maguire
1182	Laura Linney
1183	Riley Keough
1184	Kylie Minogue
1185	Alicia Silverstone
1186	Krysten Ritter
1187	Larry Wilmore
1188	Steve Baskis
1189	Dan Sidles
1190	Katherine Ragazzino
1191	Daniel Craig
1192	Daniel Day-Lewis
1193	Sally Field
1194	David Strathairn
1195	Tim Heidecker
1196	Eric Wareheim
1197	James Murphy
1198	Cecilia Cheung
1199	Dong-gun Jang
1200	Alicia Vikander
1201	Mikkel Boe Følsgaard
1202	Patton Oswalt
1203	Rob Riggle
1204	Selma Blair
1205	Joshua Close
1206	Dree Hemingway
1207	Besedka Johnson
1208	Boonee
1209	Kristen Stewart
1210	Robert Pattinson
1211	Taylor Lautner
1212	Keira Knightley
1213	Katrina Kaif
1214	Parker Posey
1215	Eric Mabius
1216	Annie Parisse
1217	Aneurin Barnard
1218	James Cosmo
1219	Wunmi Mosaku
1220	Suraj Sharma
1221	Adil Hussain
1222	Isabel Lucas
1223	Anthony Hopkins
1224	Marion Cotillard
1225	Armand Verdure
1226	Antron McCray
1227	Kevin Richardson
1228	Kharey Wise
1229	Ray Liotta
1230	Josh Stewart
1231	Emma Fitzpatrick
1232	Christopher McDonald
1233	Jean-Claude Van Damme
1234	Dolph Lundgren
1235	Scott Adkins
1236	Aamir Khan
1237	Kareena Kapoor
1238	Rani Mukerji
1239	Donnie Yen
1240	Takeshi Kaneshiro
1241	Wei Tang
1242	Robert Carlyle
1243	Alexia Rasmussen
1244	Kathleen Wilhoite
1245	Ginger Baker
1246	Femi Kuti
1247	Eric Clapton
1248	Guoli Zhang
1249	Daoming Chen
1250	Xuejian Li
1251	Anna Nicole Smith
1252	David Giancola
1253	John James
\.


--
-- TOC entry 2000 (class 0 OID 0)
-- Dependencies: 164
-- Name: actor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('actor_id_seq', 1253, true);


--
-- TOC entry 1977 (class 0 OID 16414)
-- Dependencies: 167 1985
-- Data for Name: director; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY director (id, name) FROM stdin;
1	John Luessenhop
2	Damian Lee
3	Ruben Fleischer
4	Michael Tiddes
5	Dustin Hoffman
6	Brian Dannelly
7	Tom O'Brien
8	Barry Battles
9	Kevin Mazur
10	Vishal Bhardwaj
11	Ji-hoon Kim
12	Johannes Roberts
13	Kathryn Bigelow
14	Andrés Muschietti
15	Kim Jee-Woon
16	Allen Hughes
17	Sheldon Candis
18	Bruno Dumont
19	Tommy Wirkola
20	Taylor Hackford
21	Elizabeth Banks Steven Brill
22	Abbas Alibhai Burmawalla Mastan Alibhai Burmawalla
23	Don Coscarelli
24	Eytan Fox
25	Dmitry Vasyukov Werner Herzog
26	Bill Guttentag
27	Blake Freeman
28	Jonathan Levine
29	Walter Hill
30	Fisher Stevens
31	Dror Moreh
32	Tom Elkins
33	David Grohl
34	Neil Barsky
35	Seth Gordon
36	Steven Soderbergh
37	Cate Shortland
38	Tony Scott
39	John Moore
40	Richard LaGravenese
41	Lasse Hallström
42	Pablo Larraín
43	Roman Coppola
44	Cal Brunker
45	Abbas Kiarostami
46	Leone Marucci
47	Ric Roman Waugh
48	Scott Stewart
49	Ruba Nadda
50	Carl Franklin
51	Abhishek Kapoor
52	Bryan Singer
53	Jon Lucas Scott Moore
54	Ed Gass-Donnelly
55	Chan-wook Park
56	Todd Robinson
57	Kristi Jacobson Lori Silverbush
58	Mark Webber
59	Roberta Grossman
60	Kapil Sharma
61	Hisako Matsui
62	Bill Muir
63	Sam Raimi
64	Niels Arden Oplev
65	Cristian Mungiu
66	Kaare Andrews Angela Bettis
67	Ramona S. Diaz
68	Peter Webber
69	Baran bo Odar
70	Don Scardino
71	Brad Anderson
72	Sally Potter
73	Goro Miyazaki
74	Juan Solanas
75	Matteo Garrone
76	Harmony Korine
77	Ishai Setton
78	Andy Capper
79	Jules Stewart
80	Steven Goldfried
81	Antoine Fuqua
82	Kirk De Micco Chris Sanders
83	Paul Weitz
84	Wayne Blair
85	Ken Scott
86	Adam Leon
87	Danny Mooney
88	Janet Tobias
89	Sally El Hosaini
90	Marc Evans
91	Makinov
92	Vince Offer
93	Scott Mactavish
94	Paul Gordon
95	Jon M. Chu
96	Andrew Niccol
97	Tyler Perry
98	Derek Cianfrance
99	Rodney Ascher
100	Eran Creevy
101	Quentin Dupieux
102	Sajid Khan
103	P.J. Hogan
104	Pablo Berger
105	Fede Alvarez
106	Steven Spielberg
107	Danny Boyle
108	Robert Redford
109	Antonio Campos
110	Shane Carruth
111	Shola Lynch
112	Ramaa Mosley
113	Boris Rodriguez
114	Måns Mårlind Björn Stein
115	Brian Helgeland
116	Malcolm D. Lee
117	Terrence Malick
118	Brandon Cronenberg
119	Todd Berger
120	Ken Loach
121	Henry Alex Rubin
122	Petter Næss
123	Jon Van Dyke
124	Joseph Kosinski
125	Rob Zombie
126	Youssef Delara Michael D. Olmos
127	François Ozon
128	Michael Bay
129	Justin Zackham
130	Jeff Nichols
131	Joachim Rønning Espen Sandberg
132	Dante Ariola
133	Ramin Bahrani
134	Mira Nair
135	Ron Morales
136	Shane Black
137	Susanne Bier
138	Matthew Miele
139	Ariel Vromen
140	Olivier Assayas
141	Scott McGehee David Siegel
142	Xan Cassavetes
143	Daniel Algrant
144	Mark Mann
145	Jared Moshe
146	Christopher Menaul
147	Rafa Lara
148	Baz Luhrmann
149	Tina Gordon Chism
150	Ben Wheatley
151	Maiken Baird Michelle Major
152	Nicolás López
153	Ryûhei Kitamura
154	Jeremy Frindel
155	Conor Allyn
156	J.J. Abrams
157	Noah Baumbach
158	Sarah Polley
159	Philipp Stölzl
160	Craig Zisk
161	Alice Winocour
162	Katie Aselton
163	Dan Setton
164	Justin Lin
165	Todd Phillips
166	Chris Wedge
167	Richard Linklater
168	Rama Burshtein
169	Alex Gibney
170	M. Night Shyamalan
171	Louis Leterrier
172	Jordan Vogt-Roberts
173	Zal Batmanglij
174	James Marsh
175	Margarethe von Trotta
176	John Mitchell Jeremy Kipp Walker
177	Shawn Levy
178	James DeMonaco
179	Joss Whedon
180	Geoffrey Fletcher
181	Rick Rowley
182	Kieran Darcy-Smith
183	Aram Rappaport
184	Seth Kramer Daniel A. Miller
185	Zack Snyder
186	Evan Goldberg Seth Rogen
187	Mrigdeep Singh Lamba
188	Morgan Neville
189	Peter Strickland
190	Marc Forster
191	Dan Scanlon
192	Paul Andrew Williams
193	Franck Khalfoun
194	Tobias Lindholm
195	Alex Winter
196	Sofia Coppola
197	Roland Emmerich
198	Paul Feig
199	Pedro Almodóvar
200	Neil Jordan
201	Steven Knight
202	Xavier Dolan
203	Daisy von Scherler Mayer
204	Mark Christopher Covino Jeff Howlett
205	Matthew Cooke
206	Gore Verbinski
207	Pierre Coffin Chris Renaud
208	Leslie Small Tim Story
209	Nat Faxon Jim Rash
210	Michael Winterbottom
211	Drew DeNicola Olivia Mori
212	Farren Blackburn
213	Rachid Bouchareb
214	Guillermo del Toro
215	Dennis Dugan
216	Ryan Coogler
217	Thomas Vinterberg
218	Simon Barrett Jason Eisener
219	Sebastián Silva
220	Jeff Garlin
221	Rakeysh Omprakash Mehra
222	Michael McGowan
223	Baltasar Kormákur
224	Cullen Hoback
225	Susan Seidelman
226	Matías Piñeiro
227	Mark Steven Johnson
228	Wayne Kramer
229	Dean Parisot
230	Robert Schwentke
231	David Soren
232	James Wan
233	Shari Springer Berman Robert Pulcini
234	Nicolas Winding Refn
235	Gabriela Cowperthwaite
236	Joshua Oppenheimer Anonymous
237	Nikhil Advani
238	Neil Drumming
239	James Mangold
240	Maggie Carey
241	Woody Allen
242	Nenad Cicin-Sain
243	Jinming Guo
244	Johnnie To
245	Jamie Babbit
246	Raja Gosnell
247	James Ponsoldt
248	Paul Schrader
249	Sebastián Cordero
250	Ben Nott Morgan O'Neill
251	Neill Blomkamp
252	Thor Freudenthal
253	Rawson Marshall Thurber
254	Klay Hall
255	David Gordon Green
256	Rohit Shetty
257	Rob Epstein Jeffrey Friedman
258	Lake Bell
259	Dan Mazer
260	Donal Mosher Michael Palmieri
261	Jeff Wadlow
262	Lee Daniels
263	Robert Luketic
264	Joshua Michael Stern
265	David Lowery
266	Jerusha Hess
267	Zachary Heinzerling
268	Harald Zwart
269	Edgar Wright
270	Adam Wingard
271	Kar Wai Wong
272	Joe Swanberg
273	Destin Cretton
274	Kevin Goetz Michael Goetz
275	Morgan Spurlock
276	Courtney Solomon
277	John Crowley
278	Brian De Palma
279	Eugenio Derbez
280	Liz W. Garcia
281	Jason Lapeyre Robert Wilson
282	David Twohy
283	Shane Salerno
284	Maneesh Sharma
285	Michael Landon Jr.
286	Lynn Shelton
287	Régis Roinsard
288	Ryan White
289	Luc Besson
290	Indra Kumar
291	Haifaa Al-Mansour
292	Alexandre Moors
293	Megumi Sasaki
294	Jamie Meltzer
295	Fabien Constant
296	Billy Bob Thornton
297	Denis Villeneuve
298	Benson Lee
299	Nicole Holofcener
300	Stuart Blumberg
301	Kyle Patrick Alvarez
302	David M. Rosenthal
303	Victor Fleming George Cukor
304	Ron Howard
305	Cody Cameron Kris Pearn
306	David E. Talbert
307	Joseph Gordon-Levitt
308	Greg 'Freddy' Camalier
309	Jim Mickle
310	Jacob Kornbluth
311	Alfonso Cuarón
312	Brad Furman
313	Pedro Pablo Ibarra
314	Abhinav Kashyap
315	Brad J. Silverman
316	Stu Zicherman
317	Stacie Passon
318	Peter Landesman
319	Evan Leong
320	Phil Morrison
321	Jason Osder
322	Nick Ryan
323	Jacob Vaughan
324	Paul Greengrass
325	Robert Rodriguez
326	Carlo Carlei
327	Randy Moore
328	George Tillman Jr.
329	Randall Miller
330	Logan Miller
331	Anthony DiBlasi
332	Kimberly Peirce
333	Bill Condon
334	Steve McQueen
335	Mikael Håfström
336	J.C. Chandor
337	John Krokidas
338	Ridley Scott
339	Jeff Tremaine
340	Abdellatif Kechiche
341	Costa-Gavras
342	Joseph Levy
343	Claire Denis
344	Gavin Hood
345	Jon Turteltaub
346	Jimmy Hayward
347	Richard Curtis
348	Jean-Marc Vallée
349	Oliver Hirschbiegel
350	Jaco Van Dormael
351	Felix Van Groeningen
352	Michael Polish
353	Alan Taylor
354	Brian Percival
355	Kevin Macdonald
356	Jason Friedberg Aaron Seltzer
357	John Sayles
358	Ted Koland
359	Alexander Payne
360	Fredrik Bond
361	Joel Allen Schroeder
362	Aleksandr Sokurov
363	Amir Bar-Lev
364	Will Slocombe
365	Francis Lawrence
366	Chris Buck Jennifer Lee
367	Spike Lee
368	Kasi Lemmons
369	Justin Chadwick
370	Bruno Barreto
371	Scott Cooper
372	Ethan Coen Joel Coen
373	Peter Jackson
374	Adam McKay
375	David O. Russell
376	John Lee Hancock
377	Barry Cook Neil Nightingale
378	Spike Jonze
379	Ben Stiller
380	Peter Berg
381	Martin Scorsese
382	John Wells
383	Carl Rinsch
384	Peter Segal
385	William Brent Bell
386	Michael Cuesta
387	Martin Guigui
388	Nuri Bilge Ceylan
389	Tran Anh Hung
390	Todd Graff
391	Phyllida Lloyd
392	Gary Trousdale Kirk Wise
393	Niall MacCormick
394	Xavier Gens
395	Michael Corrente
396	Lynne Ramsay
397	Vincent D'Onofrio
398	Ralph Fiennes
399	Anthony Hemingway
400	Yimou Zhang
401	Gerardo Naranjo
402	Frederick Wiseman
403	Hun Jang
404	Dori Berinstein
405	Whitney Smith
406	Joe Carnahan
407	Julie Anne Robinson
408	Rodrigo García
409	Asger Leth
410	Valérie Donzelli
411	Robin Hardy
414	Brian Klugman Lee Sternthal
415	Mabrouk El Mechri
418	Leslye Headland
421	Todd Louiso
425	Ben Palmer
427	Ira Sachs
431	Paco Plaza
435	So Yong Kim
438	Jamie Bradshaw Aleksandr Dulerayn
439	Neil Berkeley
441	David Redmon Ashley Sabin
444	Jirí Barta Vivian Schilling
447	Paul Thomas Anderson
459	Paul W.S. Anderson
460	Andrew Stanton Lee Unkrich
461	Josh Radnor
462	Nicholas Jarecki
463	Jamie Linden
464	Simon West
465	Tomasz Thomson
466	Pete Travis
467	David Ayer
468	Mark Tonderai
469	Robert Lorenz
470	Stephen Chbosky
471	David France
472	Lisa Immordino Vreeland Bent-Jorgen Perlmutt
473	Stephen Elliott
474	Delphine Coulin Muriel Coulin
475	Ryan O'Nan
476	Ben Hickernell
477	Brent McCorkle
478	Rian Johnson
479	Genndy Tartakovsky
480	Daniel Barnz
481	Jason Moore
482	Marius A. Markevicius
483	Michael J. Bassett
484	Pen-Ek Ratanaruang
485	Peter Nicks
486	Famke Janssen
487	James Watkins
488	Josh Trank
489	Ken Kwapis
490	Ti West
491	Madonna
492	Laura Israel
493	Daniel Espinosa
494	Brad Peyton
495	Michael Sucsy
496	George Lucas
497	Oren Moverman
498	Agnieszka Holland
499	David Mackenzie
500	Béla Tarr Ágnes Hranitzky
501	Tono Errando Javier Mariscal
502	Liza Johnson
503	Mark Neveldine Brian Taylor
504	McG
505	Daniel Lindsay T.J. Martin
506	Hiromasa Yonebayashi
507	Jill Sprecher
508	Andrew Okpeaha MacLean
509	Michaël R. Roskam
510	Markus Schleinzer
511	Danis Tanovic
512	David Wain
513	Heitor Dhalia
514	Mike McCoy Scott Waugh
515	Joshua Marston
516	Dominique Abel Fiona Gordon
517	Stuart Beattie
518	Rich Moore
519	RZA
520	Robert Zemeckis
521	Paolo Sorrentino
522	Yaron Zilberman
523	Jacob Aaron Estes
524	Bradley Rust Gray
525	Amy Heckerling
526	Michael Brown
527	Sam Mendes
528	Rick Alverson
529	Jin-ho Hur
530	Nikolaj Arcel
531	Todd Rohal
532	Jeremy Power Regimbal
533	Sean Baker
534	Joe Wright
535	Yash Chopra
536	Michael Walker
537	Ciaran Foy
538	Ang Lee
539	Dan Bradley
540	Peter Ramsey
541	Sacha Gervasi
542	Jacques Audiard
543	Ken Burns Sarah Burns
544	Andrew Dominik
545	Marcus Dunstan
546	John Hyams
547	Reema Kagti
548	Peter Chan
549	Marshall Lewy
550	Duncan Bridgeman
551	Jay Bulger
552	Xiaogang Feng
553	David Giancola
\.


--
-- TOC entry 2001 (class 0 OID 0)
-- Dependencies: 166
-- Name: director_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('director_id_seq', 553, true);


--
-- TOC entry 1979 (class 0 OID 16424)
-- Dependencies: 169 1985
-- Data for Name: genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY genre (id, name) FROM stdin;
1	Horror
2	Thriller
3	Action
4	Crime
5	Drama
6	Comedy
7	Documentary
8	Sci-Fi
9	History
10	Fantasy
11	Romance
12	Music
13	Biography
14	War
15	Mystery
16	Animation
17	Adventure
18	Family
19	Sport
20	Western
21	Musical
22	News
\.


--
-- TOC entry 2002 (class 0 OID 0)
-- Dependencies: 168
-- Name: genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('genre_id_seq', 22, true);


--
-- TOC entry 1981 (class 0 OID 16434)
-- Dependencies: 171 1985
-- Data for Name: movie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY movie (id, description, duration, image, launchdate, metascore, title, rate) FROM stdin;
1	After the first massacre in 1974, the townspeople suspected that the Sawyer family were responsible. A vigilante mob of enraged locals surrounded the Sawyer house, burning it to the ground and killing every last member of the family. Decades later a young woman named Heather learns that she has inherited a Texas estate from her grandmother. she decides to bring her friends along on the road trip to invesitgate her inheritance. On arrival she uncovers she has inherited a mansion but is yet to uncover the terrors that lurk in the basement below it. Written by Tom Thomas	92 min	http://ia.media-imdb.com/images/M/MV5BMTQzMzAyNTE2N15BMl5BanBnXkFtZTcwNzM1NDg2OA@@._V1_SX214_.jpg	4 January 2013 (USA)	4.79999999999999982	Texas Chainsaw 3D	\N
2	A former CIA operative turned political talk show host is hired by a corporate whistle blower to expose her company's cover-up of a massacre in a South American village.	106 min	http://ia.media-imdb.com/images/M/MV5BMTYxOTQ0NTUzOV5BMl5BanBnXkFtZTcwMjc5MDA2OA@@._V1_SY317_CR1,0,214,317_.jpg	6 September 2013 (Spain)	5.40000000000000036	A Dark Truth	\N
3	It's 1949 Los Angeles, and gangster Mickey Cohen has moved in, with the intention of controlling all criminal activity in the city. He has bought local judges and police, and no one is willing to cross him or testify against him. Everyone except Seargant John O'Mara, a former World War II soldier, whose goal is to settle with his family in a peaceful Los Angeles. Police Chief William Parker decides to form a special unit whose mission is to take down Cohen, and chooses O'Mara to lead the unit. O'Mara chooses 4 cops and asks another cop and vet, Jerry Wooters to join him but Wooters is not interested. But when he witnesses the murder of a young boy by Cohen's people, he joins them, and they decide to take apart Cohen's organization. Cohen wonders if a rival is going after him, but eventually he realizes it's the cops. Written by rcs0411@yahoo.com	113 min	http://ia.media-imdb.com/images/M/MV5BMTcwMjAyMTUzMl5BMl5BanBnXkFtZTcwODgxNzk1OA@@._V1_SY317_CR0,0,214,317_.jpg	11 January 2013 (USA)	6.70000000000000018	Gangster Squad	\N
4	Malcolm and Kisha move into their dream home, but soon learn a demon also resides there. When Kisha becomes possessed, Malcolm - determined to keep his sex life on track - turns to a priest, a psychic, and a team of ghost-busters for help.	86 min	http://ia.media-imdb.com/images/M/MV5BMTM1ODgyOTI0NF5BMl5BanBnXkFtZTcwODgyMDY3OA@@._V1_SX214_.jpg	11 January 2013 (USA)	4.79999999999999982	A Haunted House	\N
5	Cecily, Reggie, and Wilfred are in a home for retired musicians. Every year, on October 10, there is a concert to celebrate Verdi's birthday and they take part. Jean, who used to be married to Reggie, arrives at the home and disrupts their equilibrium. She still acts like a diva, but she refuses to sing. Still, the show must go on... and it does. Written by BrianoftheNorth	98 min	http://ia.media-imdb.com/images/M/MV5BMTc2MTI0MzI5Ml5BMl5BanBnXkFtZTcwNzkzNjQ4OA@@._V1_SY317_CR4,0,214,317_.jpg	1 March 2013 (USA)	6.70000000000000018	Quartet	\N
6	A high school boy desperate to escape the idiocy of the people in his hometown trys to create a way in which he can move to New York, attend the college of his dreams and do something other than live in the foot steps of his drunken, divorced mother. Along the way he blackmails his fellow students into contributing to his literary magazine and discovers what its like to feel accomplished. Does he get accepted into the college of his dreams? Is he going to make a difference and follow his life goal? Written by Jo J.	90 min	http://ia.media-imdb.com/images/M/MV5BMTEyMDk3MzA2MTheQTJeQWpwZ15BbWU3MDIxODc3Nzg@._V1_SY317_CR0,0,214,317_.jpg	11 January 2013 (USA)	6.20000000000000018	Struck by Lightning	\N
7	A former high school football star and one time college athlete, Jon has landed back in the place of his youth -- Fairhaven -- a small fishing village on the Massachusetts coast. Now in his early thirties, and with the promise of younger days seemingly washed ashore, Jon's vague feelings of dissatisfaction are crystallized by a television interview with his football hero Tom Brady, who proclaims that, even after three super bowl wins, "There's got to be something more than this." Jon recounts his epiphany to Sam, old friend and schoolmate who married early, fathered early, divorced early and never left town. Sam made his own peace with small town life years ago, and is happy enough just to provide a stable home for his loving daughter, Cara, while secretly still pining for his beautiful ex-wife Kate. Together, Jon and Sam anticipate the return of Dave, the third member of their once-indomitable trio. Having left town seven years ago and never looked back, Dave is finally returning to ... Written by Production	81 min	http://ia.media-imdb.com/images/M/MV5BMTkyODExMTEzOV5BMl5BanBnXkFtZTcwMTg5NDA5OA@@._V1_SY317_CR5,0,214,317_.jpg	11 January 2013 (USA)	4.90000000000000036	Fairhaven	\N
8	After her ex-husband Carlos shoots Celeste three times in the gut, it's time to play dirty. In the fight for her godson, Rob, she hires three outlawed and redneck brothers to bring him back to her. But nothing can be that simple in the South. What begins as a small rescue mission rises to a southern battle royal. This odd team must shoot their way through gorgeous female assassins, Native American hunters, Federal agents, and a whole lot of metal coming after them, while protecting Celeste's innocent child. Written by LLeju Productions and Films	98 min	http://ia.media-imdb.com/images/M/MV5BMTM5NzE0ODIwMV5BMl5BanBnXkFtZTcwMzY5Mjg3OA@@._V1_SY317_CR0,0,214,317_.jpg	15 June 2013 (Japan)	6.09999999999999964	The Baytown Outlaws	\N
9	Celebrity photographer Kevin Mazur gives an all access pass to life behind the velvet rope and in front of the camera.	89 min	http://ia.media-imdb.com/images/M/MV5BMjgwNzc5NTExNl5BMl5BanBnXkFtZTcwMTIxMjA4OA@@._V1_SX214_.jpg	11 January 2013 (USA)	4.59999999999999964	$ellebrity	\N
10	Harry is an industrialist who loves his daughter Bijlee, and the bond they share with Harry's man friday, Matru. Bijlee's plan to wed the son of a politician, however, brings twists and turns in the lives of Matru, Bijlee and Mandola.	151 min	http://ia.media-imdb.com/images/M/MV5BMTQyMzkxNjI5M15BMl5BanBnXkFtZTcwNDAzODY4OA@@._V1_SY317_CR2,0,214,317_.jpg	11 January 2013 (India)	5.90000000000000036	Matru ki Bijlee ka Mandola	\N
11	On Christmas Eve at Tower Sky, an ultra-luxurious building complex, a White Christmas party is held to dazzle its equally high-end tenants and VIP guests. Dae-ho, the manager of the building and single father, is forced to cancel plans with his daughter Hana to work the event. His Christmas is saved when Yoon-hee, the food mall manager with a secret crush on Dae-ho, offers to babysit Hana during the party. Meanwhile, Young-ki the legendary fire chief of Yoido Station has finally promised his first holiday date night to his long suffering wife. The party is in full swing with the spectacular sight of two helicopters flying overhead just to spray snow on the partygoers and make everything perfect. When unthinkable disaster strikes, Dae-ho and Young-ki must summon all their strength and courage to save the lives of thousands but at what cost to themselves and their loved ones? Written by CJ Entertainment	121 min	http://ia.media-imdb.com/images/M/MV5BMTU2NzIyNTY4Ml5BMl5BanBnXkFtZTcwNjM0MTA3OQ@@._V1_SY317_CR5,0,214,317_.jpg	11 January 2013 (USA)	6.20000000000000018	The Tower	\N
487	A singer-songwriter hits the road with a self-appointed music revolutionary.	98 min	http://ia.media-imdb.com/images/M/MV5BMjEwNjU4Mjc3M15BMl5BanBnXkFtZTcwNTQ0MzAyOA@@._V1_SY317_CR2,0,214,317_.jpg	20 July 2012 (UK)	5.70000000000000018	Brooklyn Brothers Beat the Best	\N
12	In London, a military plane crashes leaving its highly classified contents strewn across the city. Completely unaware that the city is in lockdown, a group of people become trapped inside a storage facility with a highly unwelcome guest.	87 min	http://ia.media-imdb.com/images/M/MV5BMTY4MjY3Njk4N15BMl5BanBnXkFtZTcwNDc3NjU3OA@@._V1_SX214_.jpg	29 June 2012 (UK)	4.29999999999999982	Storage 24	\N
13	Maya is a CIA operative whose first experience is in the interrogation of prisoners following the Al Qaeda attacks against the U.S. on the 11th September 2001. She is a reluctant participant in extreme duress applied to the detainees, but believes that the truth may only be obtained through such tactics. For several years, she is single-minded in her pursuit of leads to uncover the whereabouts of Al Qaeda's leader, Osama Bin Laden. Finally, in 2011, it appears that her work will pay off, and a U.S. Navy SEAL team is sent to kill or capture Bin Laden. But only Maya is confident Bin Laden is where she says he is. Written by Jim Beaver <jumblejim@prodigy.net>	157 min	http://ia.media-imdb.com/images/M/MV5BMTQ4OTUyNzcwN15BMl5BanBnXkFtZTcwMTQ1NDE3OA@@._V1_SX214_.jpg	11 January 2013 (USA)	7.40000000000000036	Zero Dark Thirty	\N
14	The senior partner of an investment brokerage Jeffrey has a breakdown and kills his two associates and his wife. Then he takes his three-year old daughter Victoria and the one-year old daughter Lilly and drives his car through a winding snowing road. He has a car accident and fall off a cliff, but he brings his daughters to an abandoned and isolated cabin to kill them, but the children are saved by a creepy ghostly creature. Five years later, Jeffrey's brother Lucas finds the children that were raised without social relationship and claim that they have been raised by Mama. Lucas disputes the custody with the children's grandmother but Dr. Dreyfuss, who is studying the girls, selects Lucas to take care of the children. Lucas lives with his girlfriend Annabel, who plays in a rock'n'roll band, and Victoria and Lilly moves to their house. Soon Lucas and Annabel find that the girls were not delusional and they are not alone in the house. Written by Claudio Carvalho, Rio de Janeiro, Brazil	100 min	http://ia.media-imdb.com/images/M/MV5BMTM5MjIwNDAwMl5BMl5BanBnXkFtZTcwNzQyOTY0OA@@._V1_SX214_.jpg	18 January 2013 (USA)	6.20000000000000018	Mamã	\N
15	Sheriff Owens is a man who has resigned himself to a life of fighting what little crime takes place in sleepy border town Sommerton Junction after leaving his LAPD post following a bungled operation that left him wracked with failure and defeat after his partner was crippled. After a spectacular escape from an FBI prisoner convoy, the most notorious, wanted drug kingpin in the hemisphere is hurtling toward the border at 200 mph in a specially outfitted car with a hostage and a fierce army of gang members. He is headed, it turns out, straight for Summerton Junction, where the whole of U.S. law enforcement will have their last opportunity to make a stand and intercept him before he slips across the border forever. At first reluctant to become involved, and then counted out because of the perceived ineptitude of his small town force, Owens ultimately accepts responsibility for the face off. Written by Production	107 min	http://ia.media-imdb.com/images/M/MV5BODc4NjI0OTYwNl5BMl5BanBnXkFtZTcwOTYwODQ3OA@@._V1_SX214_.jpg	18 January 2013 (USA)	6.40000000000000036	The Last Stand	\N
16	In New York City, detective Billy Taggart goes to court for the murder of the rapist Mikey Tavarez, but the Mayor Nicholas Hostetler and the Chief of Police Carl Fairbanks vanish with an important evidence and Billy is declared non-guilty by the judge but he leaves the police department. Seven years later, Billy is a private detective that lives his girlfriend Natalie Barrow, who is an aspirant actress and the sister of Mikey's victim. His secretary Katy Bradshaw (Alona Tal) is trying to collect part of the debts to save their business. In the week of the elections, Hostetler summons Billy and offers US$ 50,000 to investigate his wife Cathleen Hostetler that he believes is having a love affair. Billy discovers that Cathleen is meeting Paul Andrews, who is the coordinator of the campaign of Jack Valliant, the opponent of Hostetler and favorite in the election. When Paul is found dead on the street, Billy finds that he had been double-crossed by Hostetler and he decides to investigate ... Written by Claudio Carvalho, Rio de Janeiro, Brazil	109 min	http://ia.media-imdb.com/images/M/MV5BMTY4OTIwODg4Ml5BMl5BanBnXkFtZTcwNjg0MDY1OA@@._V1_SX214_.jpg	18 January 2013 (USA)	6.09999999999999964	Broken City	\N
17	An 11-year-old boy gets a crash course in what it means to be a man when he spends a day with the ex-convict uncle he idolizes.	94 min	http://ia.media-imdb.com/images/M/MV5BMTY2MjEzNDIzNV5BMl5BanBnXkFtZTcwMzkyMTQ0OA@@._V1_SY317_CR0,0,214,317_.jpg	18 January 2013 (USA)	5.29999999999999982	LUV	\N
18	In a village on the French Opal Coast, a drifter engages in a perplexing relationship with a young woman who has suffered abuse.	110 min	http://ia.media-imdb.com/images/M/MV5BOTIwNTQ4MzEyNl5BMl5BanBnXkFtZTcwNDcxODg3OA@@._V1_SY317_CR2,0,214,317_.jpg	18 January 2013 (USA)	6.20000000000000018	Fora, Satanás	\N
19	The siblings Hansel and Gretel are left alone in the woods by their father and captured by a dark witch in a candy house. However they kill the witch and escape from the spot. Years later, the orphans have become famous witch hunters. When eleven children go missing in a small village, the Mayor summons Hansel and Gretel to rescue them, and they save the red haired Mina from the local sheriff that wants to burn her accusing Mina of witchcraft. Soon they discover that the Blood Moon will approach in three days and the powerful dark witch Muriel is the responsible for the abduction of children. She intends to use the children together with a secret ingredient in a Sabbath to make the coven of witches protected against the fire. Meanwhile Hansel and Gretel disclose secrets about their parents. Written by Claudio Carvalho, Rio de Janeiro, Brazil	88 min	http://ia.media-imdb.com/images/M/MV5BMjA4MDQwODg2NV5BMl5BanBnXkFtZTcwNTc5ODc2OA@@._V1_SX214_.jpg	25 January 2013 (USA)	6.09999999999999964	Hansel & Gretel: Caçadores de Bruxas	\N
20	Parker is a thief who has an unusual code. He doesn't steal from the poor and hurt innocent people. He is asked to join 4 other guys one of whom is related to a known mobster. They pull off the job flawlessly and Parker wants to part ways with them. But because he refused to join them for another job they try to kill him. They dispose of his body but someone finds him and he is still alive and takes him to the hospital. After recovering he sets out to get back at the ones who tried to kill him, another one of his codes. He learns where they are and poses as a wealthy Texan looking to buy a house. So he hires a real estate agent, Leslie Rogers to show him around. He is actually trying to find out where they're holed up. And when he finds it, he sets out on his plan to get them. But when they learn he is alive, they contact the mobster to take care of him. So he sends a killer to take care of him. Written by rcs0411@yahoo.com	118 min	http://ia.media-imdb.com/images/M/MV5BMTk4MzM2NTQ1Nl5BMl5BanBnXkFtZTcwODIyODY1OA@@._V1_SX214_.jpg	25 January 2013 (USA)	6.09999999999999964	Parker	\N
43	A graphic designer's enviable life slides into despair when his girlfriend breaks up with him.	86 min	http://ia.media-imdb.com/images/M/MV5BMTM5MjQ4NTkwNl5BMl5BanBnXkFtZTcwNjkxOTc5OA@@._V1_SX214_.jpg	21 November 2013 (Portugal)	4.79999999999999982	A Glimpse Inside the Mind of Charles Swan III	\N
21	Ineffectual, 'has-been' film-maker (Dennis Quaid) swindles his way into an interview with a film executive (Greg Kinnear) in order to pitch an outrageous and controversial comedy manuscript. After pitching the first of his thirteen offbeat fables, the dejected artist forces the rest of his disjointed allegory on the executive at gunpoint. He tells stories of a woman on a blind date with a man who has testicles growing from his neck, in another a smitten woman offers her neck to her boyfriend to 'poop' on -as a sign of commitment and love. In yet another two parents take home-schooling to a whole new level of indecency, striving to give their isolated teenage son all the 'regular' torment and humiliation of puberty by bullying, peer-pressuring and even seducing him themselves. An off-beat, elephant-in-the-room type film. Written by kwedgwood@hotmail.com	94 min	http://ia.media-imdb.com/images/M/MV5BMTg4NzQ3NDM1Nl5BMl5BanBnXkFtZTcwNjEzMjM3OA@@._V1_SX214_.jpg	25 January 2013 (USA)	4.40000000000000036	Movie 43	\N
22	Ranvir treads through the world of the Indian mafia in Turkey as he looks to avenge the death of his lover and partner in crime.	150 min	http://ia.media-imdb.com/images/M/MV5BMjA4NzEzODQ3NV5BMl5BanBnXkFtZTcwMDMzMjg3OA@@._V1_SY317_CR2,0,214,317_.jpg	25 January 2013 (USA)	5.09999999999999964	Race 2	\N
23	It's a drug that promises an out-of-body experience with each hit. On the street they call it Soy Sauce, and users drift across time and dimensions. But some who come back are no longer human. Suddenly a silent otherworldly invasion is underway, and mankind needs a hero. What it gets instead is John and David, a pair of college dropouts who can barely hold down jobs. Can these two stop the oncoming horror in time to save humanity? No. No, they can't. Written by David Wong	99 min	http://ia.media-imdb.com/images/M/MV5BMTUyNzIyNzc0MV5BMl5BanBnXkFtZTcwOTM5ODg1OA@@._V1_SY317_CR0,0,214,317_.jpg	25 January 2013 (USA)	6.40000000000000036	John Dies at the End	\N
24	The sequel to Yossi & Jagger finds Dr. Yossi Gutmann reminiscing about his love ten years after his death. However, as he encounters a group of young soldiers, one of them, Tom, reignites his romantic feelings.	84 min	http://ia.media-imdb.com/images/M/MV5BMTQ4NzgwOTI3N15BMl5BanBnXkFtZTcwNjM3NjQ5OA@@._V1_SX214_.jpg	17 May 2012 (Israel)	6.70000000000000018	Yossi	\N
25	In the center of the story is the life of the indigenous people of the village Bakhtia at the river Yenisei in the Siberian Taiga. The camera follows the protagonists in the village over a period of a year. The natives, whose daily routines have barely changed over the last centuries, keep living their lives according to their own cultural traditions. The expressive pictures are accompanied by original sound bites quoting the villagers. Written by Eike Wolf / Head of Corporate Communications, Studio Babelsberg	90 min	http://ia.media-imdb.com/images/M/MV5BMTM3ODM0NTQ1MF5BMl5BanBnXkFtZTcwMzAxMTM5OA@@._V1_SY317_CR4,0,214,317_.jpg	15 November 2012 (Germany)	7.59999999999999964	Happy People: A Year in the Taiga	\N
26	If a political candidate is personally flawed, but stands to make a positive difference in millions of lives, would you help him win? That question looms over the life of "true believer" Paul Turner (Rob Lowe), a savvy strategist sharply maneuvering politicians out of scandal and into public office. With the help of a bright young assistant (Jamie Chung) and a seedy operative (Richard Schiff), Turner spins every news cycle and a shrewd reporter (Julie Bowen) on behalf of his clients: a philandering Kentucky governor (Eric McCormick), a blackmailed California senator (David Harbour), and an idealistic doctor turned gubernatorial candidate (Carrie-Anne Moss). When the ugly side of Turner's work begins to haunt him, he learns that even in the bloodiest of battles, sometimes you have to fight clean. Written by IFC Films	100 min	http://ia.media-imdb.com/images/M/MV5BMTQ2MDU4NjM1MV5BMl5BanBnXkFtZTcwNjQ3MzY5OA@@._V1_SY317_CR0,0,214,317_.jpg	28 January 2013 (USA)	4.59999999999999964	Knife Fight	\N
27	Four friends hit the road to LA to compete in the Cyberbowl Video Game Championship, but will they be able to compete with the worst hangovers of their lives?	97 min	http://ia.media-imdb.com/images/M/MV5BMTM5OTczNjU4MV5BMl5BanBnXkFtZTcwMjE0OTM3OA@@._V1_SX214_.jpg	25 January 2013 (USA)	4.59999999999999964	Noobz	\N
28	With much of the world's population now an undead horde, R is a young and oddly introspective zombie. While fighting with and feeding on a human scavenger party, R meets Julie and feels an urge to protect her. What happens next is the beginning of a strangely warm relationship that allows R to begin regaining his humanity. As this change spreads through the local undead population like a virus, Julie and R eventually have to face a larger issue when the very nature of their friendship is challenged. Caught between the paranoid human forces and the ferocious "Bonies", zombies who are a mutual threat, R and Julie must find a way to bridge the differences of each side to fight for a better world no one thought possible. Written by Kenneth Chisholm (kchishol@rogers.com)	98 min	http://ia.media-imdb.com/images/M/MV5BMTQ4MjY2MjMzOV5BMl5BanBnXkFtZTcwMDUxNzIwOQ@@._V1._CR43,43.16667175292969,1298,1960.9999542236328_SX214_.jpg	1 February 2013 (USA)	6.90000000000000036	Warm Bodies	\N
29	After watching their respective partners die, a New Orleans hitman and a Washington D.C. detective form an alliance in order to bring down their common enemy.	92 min	http://ia.media-imdb.com/images/M/MV5BMTM4NzUyMjk2NV5BMl5BanBnXkFtZTcwOTUxNDc5OA@@._V1_SY317_CR2,0,214,317_.jpg	1 February 2013 (USA)	5.70000000000000018	Bullet to the Head	\N
30	After 28 years, Val gets out of prison, and his friend Doc picks him up. The local mob boss, Claphands, wants Val dead (Claphands' son died in a robbery and he blames Val) and Doc has until morning to kill him. It's a long night: Val wants to party - they visit a cat house, Val needs Viagra, they break into a pharmacy. After midnight, they pick up Hirsch, their old wheelman, drive the city in a stolen car. They visit the cat house, help a woman in distress, bury a body, and eat at Doc's hangout, a café where the waitress, Alex, is cheerful. The sun rises, Claphands wants Val dead, and Val, who has figured out his fate, is resigned. Is there anything left to take care of? Written by <jhailey@hotmail.com>	95 min	http://ia.media-imdb.com/images/M/MV5BMTgwNjgyOTExMV5BMl5BanBnXkFtZTcwNTIzODA1OA@@._V1_SX214_.jpg	1 February 2013 (USA)	6.5	Stand Up Guys	\N
31	A documentary featuring interviews with all surviving former heads of Shin Bet, the Israeli security agency whose activities and membership are closely held state secrets.	101 min	http://ia.media-imdb.com/images/M/MV5BMTYyMDg3NjYyMl5BMl5BanBnXkFtZTcwOTcyNDY4OA@@._V1_SX214_.jpg	19 June 2013 (Belgium)	7.40000000000000036	The Gatekeepers	\N
32	Building on the terror of The Haunting in Connecticut, this tale traces a young family's nightmarish descent into a centuries-old Southern hell. When Andy Wyrick moves his wife Lisa and daughter Heidi to a historic home in Georgia, they quickly discover they are not the house's only inhabitants. Joined by Lisa's free-spirited sister, Joyce, the family soon comes face-to-face with a mystery born of a deranged desire ... a haunting secret rising from underground and threatening to bring down anyone in its path. Written by Lionsgate	100 min	http://ia.media-imdb.com/images/M/MV5BMTk0MTA0NDAwOF5BMl5BanBnXkFtZTcwMDQ0NzQ4OA@@._V1_SX214_.jpg	14 March 2013 (Singapore)	4.90000000000000036	The Haunting in Connecticut 2: Ghosts of Georgia	\N
33	The history of Sound City and their huge recording device; exploring how digital change has allowed 'people that have no place' in music to become stars. It follows former Nirvana drummer and Foo Fighter David Grohl as he attempts to resurrect the studio back to former glories. Written by Joe	108 min	http://ia.media-imdb.com/images/M/MV5BMTc4MjkyODg4MF5BMl5BanBnXkFtZTcwNTk1NjM4OA@@._V1_SX214_.jpg	18 January 2013 (USA)	7.70000000000000018	Sound City	\N
34	Three-time New York City Mayor (1978-1989) Ed Koch was combative, funny, and blunt. He was also intensely private. 'Koch' gives us a contemporary history of the world's greatest city, and an intimate portrait of the 86-year old former mayor, as he confronts his own mortality and legacy. The film examines issues still relevant today - race, homelessness, AIDS, and gay rights - and gives us a window into the trials and tribulations of the nation's most famous mayor in the world's most wondrous city. Written by Anonymous	100 min	http://ia.media-imdb.com/images/M/MV5BMTU2MDM1OTY2M15BMl5BanBnXkFtZTcwMTcyODM4OA@@._V1_SX214_.jpg	8 October 2012 (USA)	5.09999999999999964	Koch	\N
35	Sandy Patterson (Jason Bateman) gets a nice call confirming his name and other identifying information. The next thing he knows, a spa in Florida is reminding him of his appointment and his credit cards are maxed out. With his identity stolen, Sandy leaves his wife, kids and job to literally bring the thief to justice in Colorado. Keeping tabs on the other Sandy (Melissa McCarthy) and run-ins with bounty hunters is harder than he was expecting, and ultimately the cross-country trip is going to find both Sandys learning life tips from one another. Written by napierslogs	111 min	http://ia.media-imdb.com/images/M/MV5BMTY3NzM5MTk2Nl5BMl5BanBnXkFtZTcwMDQ4MjQ3OA@@._V1_SX214_.jpg	8 February 2013 (USA)	5.59999999999999964	Identity Thief	\N
36	Emily Taylor, despite being reunited with her husband from prison, becomes severely depressed with emotional episodes and suicide attempts. Her psychiatrist, Jonathan Banks, after conferring with her previous doctor, eventually prescribes an experimental new medication called Ablixa. The plot thickens when the side effects of the drug lead to Emily killing her husband in a "sleepwalking" state. With Emily plea-bargained into mental hospital confinement and Dr. Banks' practice crumbling around him, the case seems closed. However, Dr. Banks cannot accept full responsibility and investigates to clear his name. What follows is a dark quest that threatens to tear what's left of his life apart even as he discovers the diabolical truth of this tragedy. Written by Kenneth Chisholm (kchishol@rogers.com)	106 min	http://ia.media-imdb.com/images/M/MV5BMTc2MzY0NDAwOF5BMl5BanBnXkFtZTcwMTE1Mzc4OA@@._V1_SY317_CR0,0,214,317_.jpg	8 February 2013 (USA)	7.09999999999999964	Side Effects	\N
37	As the Allies sweep across Germany, Lore leads her siblings on a journey that exposes them to the truth of their parents' beliefs. An encounter with a mysterious refugee forces Lore to rely on a person she has always been taught to hate.	109 min	http://ia.media-imdb.com/images/M/MV5BMjMxMDA5MDUwNl5BMl5BanBnXkFtZTcwNTM1NjM5OA@@._V1_SY317_CR1,0,214,317_.jpg	20 June 2013 (Portugal)	7.09999999999999964	Lore	\N
38	Maverick is a hot pilot. When he encounters a pair of MiGs over the Persian Gulf, his wingman is clearly outflown and freaks. On almost no fuel, Maverick is able to talk him back down to the Carrier. When his wingman turns in his wings, Maverick is moved up in the standings and sent to the Top Gun Naval Flying School. There he fights the attitudes of the other pilots and an old story of his father's death in combat that killed others due to his father's error. Maverick struggles to be the best pilot, stepping on the toes of his other students and in a different way to Charlie, a civilian instructor to whom he is strongly attracted. Written by John Vogel <jlvogel@comcast.net>	110 min	http://ia.media-imdb.com/images/M/MV5BMTY3ODg4OTU3Nl5BMl5BanBnXkFtZTYwMjI1Nzg4._V1_SY317_CR3,0,214,317_.jpg	16 May 1986 (USA)	6.70000000000000018	Top Gun	\N
39	Iconoclastic, take-no-prisoners cop John McClane, for the first time, finds himself on foreign soil after traveling to Moscow to help his wayward son Jack - unaware that Jack is really a highly-trained CIA operative out to stop a nuclear weapons heist. With the Russian underworld in pursuit, and battling a countdown to war, the two McClanes discover that their opposing methods make them unstoppable heroes. Written by Guy from Estonia	98 min	http://ia.media-imdb.com/images/M/MV5BMTcwNzgyNzUzOV5BMl5BanBnXkFtZTcwMzAwOTA5OA@@._V1_SX214_.jpg	14 February 2013 (USA)	5.29999999999999982	A Good Day to Die Hard	\N
40	Teenager Ethan Wate is obsessed with his urge to finish high school and go on to college in order to leave behind the small town of Gatlin, South Carolina behind, until a mysterious girl begins to inhabit his dreams. When he meets Lena Duchannes, a newcomer who has just enrolled in his school, Ethan knows she is the girl in his dreams. Lena is rejected by the rest of her classmates for being the granddaughter of Macon Ravenwood, whom the town's superstitious residents consider to be a devil-worshiper. But Ethan gives her a ride anyway and they fall in love. Lena reveals to her new boyfriend that she is a witch, and that on her sixteenth birthday she will be claimed by either the forces of light or of darkness. She will remain in the light, but only if she does not remain in love with Ethan. To make matters worse, her evil mother, Sarafine, is casting spells to push Lena to the dark side. Ethan joins her in a search to find a magic spell to save their doomed love. Will the lovers ... Written by Claudio Carvalho, Rio de Janeiro, Brazil	124 min	http://ia.media-imdb.com/images/M/MV5BMTQyMjYwODMwMl5BMl5BanBnXkFtZTcwODUwNzY5OA@@._V1_SY317_CR0,0,214,317_.jpg	14 February 2013 (USA)	6	Beautiful Creatures	\N
41	When a mysterious young woman named Katie appears in the small North Carolina town of Southport, her sudden arrival raises questions about her past. Beautiful yet self-effacing, Katie seems determined to avoid forming personal ties until a series of events draws her into two reluctant relationships: one with Alex, a widowed store owner with a kind heart and two young children; and another with her plainspoken single neighbor, Jo. Despite her reservations, Katie slowly begins to let down her guard, putting down roots in the close-knit community and becoming increasingly attached to Alex and his family. But even as Katie begins to fall in love, she struggles with the dark secret that still haunts and terrifies her . . . a past that set her on a fearful, shattering journey across the country, to the sheltered oasis of Southport. With Jo's empathic and stubborn support, Katie eventually realizes that she must choose between a life of transient safety and one of riskier rewards . . . and ... Written by Nicholas Sparks	115 min	http://ia.media-imdb.com/images/M/MV5BMTg4MzcxODA3OV5BMl5BanBnXkFtZTcwMTYzNDkwOQ@@._V1_SX214_.jpg	14 February 2013 (USA)	6.5	Safe Haven	\N
42	Military dictator Augusto Pinochet calls for a referendum to decide his permanence in power in 1988, the leaders of the opposition persuade a young daring advertising executive - René Saavedra - to head their campaign. With limited resources and under the constant scrutiny of the despot's watchmen, Saavedra and his team conceive of a bold plan to win the election and free their country from oppression. Written by FICV	118 min	http://ia.media-imdb.com/images/M/MV5BMTM3ODAzNjcwMV5BMl5BanBnXkFtZTcwMTUzMjc4OA@@._V1_SY317_CR0,0,214,317_.jpg	21 February 2013 (Portugal)	7.40000000000000036	Não	\N
44	The story takes place on planet Baab where admired astronaut Scorch Supernova (Brendan Fraser) is a national hero to the blue alien population. A master of daring rescues, Scorch pulls off astonishing feats with the quiet aid of his nerdy brother, Gary (Rob Corddry), head of mission control at BASA. Written by Websurfer	89 min	http://ia.media-imdb.com/images/M/MV5BMTQyMTk4NjkyMl5BMl5BanBnXkFtZTcwMzA2OTY4OA@@._V1_SX214_.jpg	15 February 2013 (USA)	5.70000000000000018	Escape from Planet Earth	\N
45	In Tokyo, a young prostitute develops an unexpected connection with a widower over a period of two days.	109 min	http://ia.media-imdb.com/images/M/MV5BODAyMjQ4NzE1OF5BMl5BanBnXkFtZTcwMTQzMDYwOQ@@._V1_SX214_.jpg	26 September 2013 (Portugal)	6.79999999999999982	Like Someone in Love	\N
46	Spies, cops, holy fools and well-armed children cross paths on a day of danger, mystery and possible transformation. 'The Power of Few' unfolds over twenty minutes on one New Orleans afternoon, experienced through the lives of five unusual characters who unknowingly are connected to an extraordinary smuggling operation as religious conspiracy collides with urban crime. Written by Anonymous	96 min	http://ia.media-imdb.com/images/M/MV5BMjIzMzI0MjYxM15BMl5BanBnXkFtZTcwNjU0NTY5OA@@._V1_SX214_.jpg	15 February 2013 (USA)	4.90000000000000036	The Power of Few	\N
47	Construction company owner John Matthews learns that his estranged son, Jason, has been arrested for drug trafficking. Facing an unjust prison sentence for a first time offender courtesy of mandatory minimum sentence laws, Jason has nothing to offer for leniency in good conscience. Desperately, John convinces the DEA and the opportunistic DA Joanne Keeghan to let him go undercover to help make arrests big enough to free his son in return. With the unwitting help of an ex-con employee, John enters the narcotics underworld where every move could be his last in an operation that will demand all his resources, wits and courage to survive. Written by Kenneth Chisholm (kchishol@rogers.com)	112 min	http://ia.media-imdb.com/images/M/MV5BNTM4MTYzNjA3Nl5BMl5BanBnXkFtZTcwMzcyNDA5OA@@._V1_SX214_.jpg	22 February 2013 (USA)	6.5	Snitch	\N
48	As the Barret family's peaceful suburban life is rocked by an escalating series of disturbing events, they come to learn that a terrifying and deadly force is after them.	97 min	http://ia.media-imdb.com/images/M/MV5BMTcxNDE1OTgyOF5BMl5BanBnXkFtZTcwMTEyMzMxOQ@@._V1_SX214_.jpg	22 February 2013 (USA)	6.20000000000000018	Dark Skies	\N
49	One afternoon, on a typical day at work, Adib is confronted with devastating news: His eldest daughter, Muna, has gone missing in Damascus. Now Adib, who has not been back in over 20 years, must return to Syria and deal with his secret past in order to find her. Inescapable is a thriller about a father's desperate search for his daughter and the chaos of the Middle East he left behind. Written by Ruba Nadda	93 min	http://ia.media-imdb.com/images/M/MV5BMTczMjIzOTA1NF5BMl5BanBnXkFtZTcwMDEwMDcwOQ@@._V1_SX214_.jpg	22 February 2013 (USA)	4.79999999999999982	Inescapable	\N
50	A drama set in New Mexico during WWII, centered on the relationship between a young man and an elderly medicine woman who helps him contend with the battle between good and evil that rages in his village.	106 min	http://ia.media-imdb.com/images/M/MV5BMTc4MzM0NDkxNl5BMl5BanBnXkFtZTcwNDUwMzk0OA@@._V1_SX214_.jpg	22 February 2013 (USA)	5.90000000000000036	Bless Me, Ultima	\N
51	Three friends growing up in India at the turn of the millennium set out to open a training academy to produce the country's next cricket stars.	120 min	http://ia.media-imdb.com/images/M/MV5BMTgwNTAwMjEzMF5BMl5BanBnXkFtZTcwNzMzODY4OA@@._V1._CR10,12.166671752929688,793,1053.000015258789_SY317_CR12,0,214,317_.jpg	22 February 2013 (India)	7.70000000000000018	Kai po che!	\N
52	Sent to the market by his uncle to sell their horse and buy thatch for their roof, Jack meets the beautiful Princess Isabelle whom he rescues her from ruffians. He returns home only with a handful of beans given to him by a monk who claimed they were sacred but that does little to impress his uncle who tosses them away. In the night the Princess arrives having run off to keep from marrying Roderick who is clearly only interested in becoming king. Soon the beans take root with a giant stalk carrying away the princess and Jack's house. He soon sets off on an adventure with the king's guards to rescue the princess only to find that a mythical land filled with giants really exists. Written by garykmcd	114 min	http://ia.media-imdb.com/images/M/MV5BMjE1NDMxMjI0OV5BMl5BanBnXkFtZTcwMjQyMDExOQ@@._V1_SX214_.jpg	1 March 2013 (USA)	6.29999999999999982	Jack the Giant Slayer	\N
53	When Straight-A college student Jeff Chang's two best friends take him out for his 21st birthday on the night before an important medical school interview, what was supposed to be a quick beer becomes a night of humiliation, over indulgence and utter debauchery. Written by Relativity	93 min	http://ia.media-imdb.com/images/M/MV5BMjI0NTExOTI0N15BMl5BanBnXkFtZTcwMDA0ODE3OA@@._V1_SX214_.jpg	1 March 2013 (USA)	5.70000000000000018	21 & Over	\N
54	Seventeen year-old Nell Margaret Sweetzer is found completely insane when trying to explain her possession by the demon called Abalam. After medical and psychological treatment, she is sent to the Deveraux transition house in New Orleans managed by Frank Merle, who helps her to start a new life. She finds a job as a hotel housekeeper, befriends her new roommates, and develops a crush on her coworker, Chris. Soon, Nell comes to realize that she is haunted by people from her cult... and by the same evil force that once possessed her. When Nell meets Miss Cecile, she tells Nell that she has been following her since the hospital. Further, she discloses that she belongs to the sect Order of The Right Hand, and that they can protect her from the evil in an attempt to divert the prophecy of an apocalypse. Will Nell accept help, and be protected from the extremely powerful, evil force Abalam -- Or will she come to accept... herself? Written by Claudio Carvalho, Rio de Janeiro, Brazil	88 min	http://ia.media-imdb.com/images/M/MV5BMTk5MjkxMjUxMF5BMl5BanBnXkFtZTcwODk5ODUwOQ@@._V1_SY317_CR0,0,214,317_.jpg	1 March 2013 (USA)	3.89999999999999991	The Last Exorcism Part II	\N
55	India Stoker (Mia Wasikowska) was not prepared to lose her father and best friend Richard (Dermot Mulroney) in a tragic auto accident. The solitude of her woodsy family estate, the peace of her tranquil town, and the unspoken somberness of her home life are suddenly upended by not only this mysterious accident, but by the sudden arrival of her Uncle Charlie (Matthew Goode), whom she never knew existed. When Charlie moves in with her and her emotionally unstable mother Evie (Nicole Kidman), India thinks the void left by her father's death is finally being filled by his closest bloodline. Soon after his arrival, India comes to suspect that this mysterious, charming man has ulterior motives. Yet instead of feeling outrage or horror, this friendless young woman becomes increasingly infatuated with him. Written by Fox Searchlight Pictures	99 min	http://ia.media-imdb.com/images/M/MV5BMjI3MTM5ODI5MV5BMl5BanBnXkFtZTcwMjE1Mzc4OA@@._V1_SX214_.jpg	1 March 2013 (UK)	6.90000000000000036	Stoker	\N
302	A romantic comedy that brings together three disparate characters who are learning to face a challenging and often confusing world as they struggle together against a common demon: sex addiction.	112 min	http://ia.media-imdb.com/images/M/MV5BMjA5MzI3ODcxMF5BMl5BanBnXkFtZTcwODY5MTc4OQ@@._V1_SX214_.jpg	17 October 2013 (Portugal)	6.40000000000000036	Thanks for Sharing	\N
56	'Ed Harris' plays the captain of a Cold War Soviet missile submarine who has secretly been suffering from seizures that alter his perception of reality. Forced to leave his wife and daughter, he is rushed into a classified mission, where he is haunted by his past and challenged by a rogue KGB group (led by David Duchovny) bent on seizing control of the ship's nuclear missile. With the fate of humanity in his hands, Harris discovers he's been chosen for this mission in the belief he would fail. 'Phantom' is a suspense submarine thriller about extraordinary men facing impossible choices. Written by RCR Media Group	98 min	http://ia.media-imdb.com/images/M/MV5BMTQ0OTA5MDgzM15BMl5BanBnXkFtZTcwMDM3NTU3OQ@@._V1_SY317_CR5,0,214,317_.jpg	1 March 2013 (USA)	5.70000000000000018	Phantom	\N
57	A documentary that investigates incidents of hunger experienced by millions of Americans, and proposed solutions to the problem.	84 min	http://ia.media-imdb.com/images/M/MV5BOTg1NTk5MDU0N15BMl5BanBnXkFtZTcwNzA0ODE4OA@@._V1_SX214_.jpg	1 March 2013 (USA)	6.40000000000000036	A Place at the Table	\N
58	When the mother of his infant son unexpectedly passes away, struggling actor Mark grapples with fatherhood and his inability to grow up. And when he sparks with a single mother, he learns how his choices have real-life consequences.	89 min	http://ia.media-imdb.com/images/M/MV5BOTc3MjIyNzI1OV5BMl5BanBnXkFtZTcwMTA5MDY1OA@@._V1_SX214_.jpg	21 January 2012 (USA)	5.29999999999999982	The End of Love	\N
59	It's to music what the bagel is to food - a Jewish staple that has transcended its origins and become a worldwide hit. Bob Dylan sang it. Elvis, too. And that's only the beginning when it comes to Hava Nagila. Follow the infectious party song on its fascinating journey from the shtetls of Eastern Europe to the cul-de-sacs of America in this hilarious and surprisingly deep film. Featuring interviews with Harry Belafonte, Connie Francis, Glen Campbell, Leonard Nimoy, Regina Spektor and more, HAVA NAGILA (THE MOVIE) takes viewers from Ukraine and Israel to the Catskills, Greenwich Village and Hollywood, using the song as a springboard to explore Jewish history and identity and to spotlight the cross-cultural connections that can only be achieved through music. Written by Anonymous	75 min	http://ia.media-imdb.com/images/M/MV5BMTk2MTc1MTE5N15BMl5BanBnXkFtZTcwNzU4MDg5OA@@._V1_SX214_.jpg	17 October 2013 (Netherlands)	3.70000000000000018	Hava Nagila: The Movie	\N
60	As Ishaan, a music producer who has commitment issues with the women in his life, feels a connection with Gauri, his next-door neighbor, he begins to learn the importance of relationships.		http://ia.media-imdb.com/images/M/MV5BMTkxOTY3NjkxMF5BMl5BanBnXkFtZTcwNzExMzYxOQ@@._V1_SY317_CR2,0,214,317_.jpg	1 March 2013 (India)	4.20000000000000018	I, Me aur Main	\N
61	A film about the life and relationships of the early 20th American educator, editor, and journalist Leonie Gilmour, the mother of the acclaimed artist and architect Isamu Noguchi.	102 min	http://ia.media-imdb.com/images/M/MV5BMjI1NTYxMDEwNl5BMl5BanBnXkFtZTcwODgzMDQwOQ@@._V1_SY317_CR4,0,214,317_.jpg	2012 (USA)	4.29999999999999982	Leonie	\N
62	Archaeologist Dr. Michael Stone looked for the lost medallion his entire life, and now his son Billy has taken up the search. Amazingly, the medallion ends up in Billy's hands and a spontaneous wish in a precarious situation takes Billy and his best friend Allie, back 200 years to what they realize is a very different Aumakua Island. When Billy and his friends are not jumping off waterfalls, avoiding animal traps, crossing the ocean, sneaking through caves or escaping a prison they're facing their nemesis Cobra, who wants nothing more than for them all to disappear. With no other way to get home, and the wellbeing of the entire island resting on his shoulders, Billy must discover the key to reclaiming the medallion and its tremendous power. One way or another, this adventure will change Billy, and life on the island, forever. Written by Anonymous	97 min	http://ia.media-imdb.com/images/M/MV5BNzgyNjQzMjQ5Ml5BMl5BanBnXkFtZTcwODQzNTU3OA@@._V1_SY317_CR12,0,214,317_.jpg	1 March 2013 (USA)	4.29999999999999982	The Lost Medallion: The Adventures of Billy Stone	\N
63	Oscar Diggs (James Franco), a small-time circus magician with dubious ethics, is hurled away from dusty Kansas to the vibrant Land of Oz. At first he thinks he's hit the jackpot-fame and fortune are his for the taking. That all changes, however, when he meets three witches, Theodora (Mila Kunis), Evanora (Rachel Weisz), and Glinda (Michelle Williams), who are not convinced he is the great wizard everyone's been expecting. Reluctantly drawn into the epic problems facing the Land of Oz and its inhabitants, Oscar must find out who is good and who is evil before it is too late. Putting his magical arts to use through illusion, ingenuity-and even a bit of wizardry-Oscar transforms himself not only into the great and powerful Wizard of Oz but into a better man as well. Written by Walt Disney Studios Motion Pictures	130 min	http://ia.media-imdb.com/images/M/MV5BMjMyMzQ1ODM1MF5BMl5BanBnXkFtZTcwMjE2MTQxOQ@@._V1_SY317_CR0,0,214,317_.jpg	8 March 2013 (USA)	6.5	Oz the Great and Powerful	\N
64	Victor, a rising gangland player, has infiltrated the crime empire run by ruthless kingpin Alphonse, with the single purpose of making Alphonse pay for destroying his once happy life. As he meticulously orchestrates his vengeance from his high-rise home, Victor watches and is watched by Beatrice, a mysterious young woman who lives in the apartment across from his. On the surface a fragile woman-child, Beatrice seethes with a rage of her own. When she uncovers Victor's dark secrets, she threatens to expose him unless he helps her carry out her own campaign of retribution. Each fixated on avenging the past, they devise a violent and cathartic plan that could change their worlds forever. Written by FilmDistrict	118 min	http://ia.media-imdb.com/images/M/MV5BMTM2NTU5NTIzMF5BMl5BanBnXkFtZTcwNjQ3MTM5OA@@._V1_SX214_.jpg	8 March 2013 (USA)	6.5	Dead Man Down	\N
65	Alina and Voichita have been friends since their orphanage days. And they have been lovers since they became sexually mature. But despite their oath of mutual fidelity, Alina, who could not bear poverty any more, emigrated to Germany where she became a barmaid. Now she just could not take the estrangement from Voichita and today she is back to Moldavia with a view to taking Voichita along with her to Germany. The only trouble is that in the meantime her girlfriend has betrayed her in falling in love with... God! Voichita indeed now lives in a convent where she plans to make vows. The priest agrees, if somewhat reluctantly, to accommodate Alina before their (hypothetical) departure. He sees all too well that not only is the young woman materialistic but hostile and troublesome as well... Written by Guy Bellinger	150 min	http://ia.media-imdb.com/images/M/MV5BMjIzOTYwNDc4M15BMl5BanBnXkFtZTcwNjU1NzcwOQ@@._V1_SX214_.jpg	30 May 2013 (Portugal)	7.5	Para Lá das Colinas	\N
77	Jennifer's thirtieth birthday party is supposed to be a special day. But what starts out as a day of celebration quickly spirals into a most ill-fated day Jennifer wishes she could forget, in this ensemble comedy set entirely in a kitchen.		http://ia.media-imdb.com/images/M/MV5BMTA4MTg0Nzk3MjZeQTJeQWpwZ15BbWU3MDc4MzA0MDk@._V1_SX214_.jpg	14 August 2012 (USA)	4.79999999999999982	The Kitchen	\N
376	A chronicle of the tragic love affair between American poet Elizabeth Bishop and Brazilian architect Lota de Macedo Soares.	118 min	http://ia.media-imdb.com/images/M/MV5BMzA1Mjk2NDM0MV5BMl5BanBnXkFtZTgwOTQ0OTk1MDE@._V1_SX214_.jpg	16 August 2013 (Brazil)	7.29999999999999982	Reaching for the Moon	\N
66	The ABC's OF DEATH is an ambitious anthology film featuring segments directed by over two dozen of the world's leading talents in contemporary genre film. Inspired by children's educational ABC books, the motion picture is comprised of 26 individual chapters, each helmed by a different director assigned a letter of the alphabet. The directors were then given free reign in choosing a word to create a story involving death. Provocative, shocking, funny and ultimately confrontational; THE ABC's OF DEATH is the definitive snapshot of the diversity of modern horror. Drafthouse Films, Magnet Pictures and Timpson Films are proud to present this alphabetical arsenal of destruction orchestrated by what Fangoria calls "a stunning roll call of some of the most exciting names in horror across the world." Written by Anonymous	123 min	http://ia.media-imdb.com/images/M/MV5BMjIzNTA0OTIxNV5BMl5BanBnXkFtZTcwMzA3MTM2Nw@@._V1_SY317_CR0,0,214,317_.jpg	26 April 2013 (UK)	4.79999999999999982	The ABCs of Death	\N
67	Don't Stop Believin': Everyman's Journey follows the real life rock-n-roll fairy tale story of Filipino Arnel Pineda, who was plucked from You Tube to become the front man for iconic American rock band, Journey, thereby becoming the latest performer to go from the Internet to real life celebrity. Having already overcome a life full of painful obstacles and now saddled with the immense pressures of leading a world renowned band and replacing a legendary singer, the film follows Arnel on this personal journey. Written by Anonymous	113 min	http://ia.media-imdb.com/images/M/MV5BMTc3MDU4NTU0OV5BMl5BanBnXkFtZTcwNjg2NDYxOQ@@._V1_SY317_CR0,0,214,317_.jpg	8 March 2013 (USA)	6.40000000000000036	Don't Stop Believin': Everyman's Journey	\N
68	A story of love and understanding set amidst the tensions and uncertainties of the days immediately following the Japanese surrender at the end of World War II. On the staff of General Douglas MacArthur (Jones), the de facto ruler of Japan as Supreme Commander of the occupying forces, a leading Japanese expert, General Bonner Fellers (Fox) is charged with reaching a decision of historical importance: should Emperor Hirohito be tried and hanged as a war criminal? Interwoven is the story of Fellers' love affair with Aya, a Japanese exchange student he had met years previously in the U.S. Memories of Aya and his quest to find her in the ravaged post-war landscape help Fellers to discover both his wisdom and his humanity and enable him to come to the momentous decision that changed the course of history and the future of two nations. Written by Production	105 min	http://ia.media-imdb.com/images/M/MV5BMjI4OTcwMTY3N15BMl5BanBnXkFtZTcwMTI1MzcxOQ@@._V1_SX214_.jpg	27 June 2013 (Portugal)	6.29999999999999982	Emperor	\N
69	13-year-old Sinikka vanishes on a hot summer night. Her bicycle is found in the exact place where a girl was killed 23 years ago. The dramatic present forces those involved in the original case to face their past.	118 min	http://ia.media-imdb.com/images/M/MV5BMTg4NjUwOTQ1NF5BMl5BanBnXkFtZTcwNTY4MjcxOQ@@._V1_SY317_CR0,0,214,317_.jpg	9 August 2012 (Portugal)	6.79999999999999982	O Silêncio	\N
70	Superstar magicians Burt Wonderstone (Steve Carell) and Anton Marvelton (Steve Buscemi) have ruled the Las Vegas Strip for years, raking in millions with illusions as big as Burt's growing ego. But lately the duo's greatest deception is their public friendship, while secretly they've grown to loathe each other. Facing cutthroat competition from guerrilla street magician Steve Gray (Jim Carrey), whose cult following surges with each outrageous stunt, even their show is starting to look stale. But there's still a chance Burt and Anton can save the act - both onstage and off - if only Burt can get back in touch with what made him love magic in the first place. Written by stefanstojkov	100 min	http://ia.media-imdb.com/images/M/MV5BMTk3MDkxMDAyN15BMl5BanBnXkFtZTcwODY5NzQyOQ@@._V1_SX214_.jpg	15 March 2013 (USA)	5.90000000000000036	The Incredible Burt Wonderstone	\N
71	Jordan Turner (Halle Berry) is an experienced 911 operator but when she makes an error in judgment and a call ends badly, Jordan is rattled and unsure if she can continue. But then teenager Casey Welson (Abigail Breslin) is abducted in the back of a man's car and calls 911. And Jordan is the one called upon to use all of her experience, insights and quick thinking to help Casey escape, and not just to save Casey, but to make sure the man is brought to justice. Written by napierslogs	94 min	http://ia.media-imdb.com/images/M/MV5BMjExNDkzNjAwOV5BMl5BanBnXkFtZTcwMDMzMzQwOQ@@._V1_SX214_.jpg	15 March 2013 (USA)	6.59999999999999964	The Call	\N
72	London, 1962. Two teenage girls - Ginger and Rosa -- are inseparable; they play truant together, discuss religion, politics and hairstyles, and dream of lives bigger than their mothers' frustrated domesticity. But, as the Cold War meets the sexual revolution, and the threat of nuclear holocaust escalates, the lifelong friendship of the two girls is shattered - by the clash of desire and the determination to survive. Written by Adventure Pictures	90 min	http://ia.media-imdb.com/images/M/MV5BMTk4NjcwMzU3OV5BMl5BanBnXkFtZTcwNTUwOTQ3OA@@._V1_SY317_CR10,0,214,317_.jpg	19 October 2012 (UK)	6	Ginger & Rosa	\N
73	A group of Yokohama teens look to save their school's clubhouse from the wrecking ball in preparations for the 1964 Tokyo Olympics.	91 min	http://ia.media-imdb.com/images/M/MV5BMjMzMzM2NTM2NV5BMl5BanBnXkFtZTcwNTk4OTYwOQ@@._V1_SX214_.jpg	16 July 2011 (Japan)	7.20000000000000018	From Up on Poppy Hill	\N
74	Adam is a seemingly ordinary guy in a very extraordinary universe. He lives humbly trying to make ends meet, but his romantic spirit holds on to the memory of a girl he loved once upon a time from another world, an inverted affluent world with its own gravity, directly above but beyond reach... a girl named Eden. Their childhood flirtation becomes an impossible love. But when he catches a glimpse of grownup Eden on television, nothing will get in the way of getting her back... Not even the law or science! Written by Onyx Films	100 min	http://ia.media-imdb.com/images/M/MV5BMTgzNzM4ODMwNV5BMl5BanBnXkFtZTcwNDU1MzEwOQ@@._V1_SX214_.jpg	1 May 2013 (France)	6.29999999999999982	Upside Down	\N
75	Luciano is a Neapolitan fishmonger who supplements his modest income by pulling off little scams together with his wife Maria. A likeable, entertaining guy, Luciano never misses an opportunity to perform for his customers and countless relatives. One day his family urge him to try out for Big Brother. In chasing this dream his perception of reality begins to change. Written by lletaif	116 min	http://ia.media-imdb.com/images/M/MV5BMjA0MTU4OTc2OV5BMl5BanBnXkFtZTcwNDU5NzQwOQ@@._V1_SX214_.jpg	17 January 2013 (Portugal)	6.5	Reality	\N
76	Brit, Candy, Cotty, and Faith have been best friends since grade school. They live together in a boring college dorm and are hungry for adventure. All they have to do is save enough money for spring break to get their shot at having some real fun. A serendipitous encounter with rapper "Alien" promises to provide the girls with all the thrill and excitement they could hope for. With the encouragement of their new friend, it soon becomes unclear how far the girls are willing to go to experience a spring break they will never forget. Written by Muse Productions	94 min	http://ia.media-imdb.com/images/M/MV5BNDE3MDQzMDA5OF5BMl5BanBnXkFtZTcwMTUxNTgxOQ@@._V1_SX214_.jpg	22 March 2013 (USA)	5.40000000000000036	Spring Breakers	\N
78	Hip Hop legend Snoop Dogg teamed up with VICE on a spiritual journey to Jamaica to reflect on his past career, including his failures, loves, regrets and losses. With this journey, Snoop intends to reincarnate himself as a Pop Reggae artist by immersing himself in Rastafari, exploring musical and religious histories deeply rooted in Jamaica His pilgrimage begins with a jaunt to a mountain-side ganja farm run by Rastas, revealing the underbelly of the Jamaican drug market. Snoop then heads down to the troubled areas of Trenchtown and Tivoli Gardens; revealing a neglected ghetto population and rampant police brutality following the exile of drug lord Chris "Coke" Dudus. Snoop also stops by the famous Alpha Boys School for an impromptu jam session. A school which has seen countless Reggae musicians pass through its youth orchestra. Snoop allows unprecedented access to his inner-workings as he makes his new album with Diplo and Angela Hunte, author of the smash hit song Empire State Of ... Written by VICE Staff	96 min	http://ia.media-imdb.com/images/M/MV5BMTUxNDgzNDY2OV5BMl5BanBnXkFtZTcwMzE4MTMyOQ@@._V1_SY317_CR0,0,214,317_.jpg	22 March 2013 (UK)	5.70000000000000018	Reincarnated	\N
79	K-11 follows Raymond Saxx Jr. (Goran Visnjic), a powerful record producer who wakes from a drug-induced blackout to find himself locked up and classified "K-11." Plunged into a nightmarish world ruled by a transsexual diva named Mousey (Kate del Castillo), Raymond is truly a fish out of water. Complicating matters are a troubled young transgender named Butterfly (Portia Doubleday), a predatory child molester (Tommy 'Tiny' Lister) and the ruthless Sheriff's Deputy, Lt. Johnson (D.B. Sweeney). Ray's struggle to contact the outside world and regain his freedom seems impossible, but he must learn to navigate this new power structure if he is ever going survive and be in control of his life again. Written by Libertine Films	88 min	http://ia.media-imdb.com/images/M/MV5BMjE1MjI0NDgwMV5BMl5BanBnXkFtZTcwODc5NDcxOQ@@._V1_SY317_CR2,0,214,317_.jpg	15 March 2013 (USA)	4.20000000000000018	K-11	\N
80	Teen r&b/hip-hop boy band 'Mindless Behavior' has been stirring up a frenzy wherever they go, singing and dancing their way into the hearts of millions as they travel across the US on their first major headlining tour. Coming from humble roots and rising to super stardom, Roc Royal, Ray Ray, Princeton and Prodigy hit the road for the biggest tour of their lives. From their early aspirations of becoming stars to fulfilling their wildest dreams, this concert documentary captures the movement that is 'Mindless Behavior,' which reminds us all that with hard. Written by AwesomenessTV	86 min	http://ia.media-imdb.com/images/M/MV5BMTYwNDU3MDE5N15BMl5BanBnXkFtZTcwMzI0NzcxOQ@@._V1_SY317_CR7,0,214,317_.jpg	15 March 2013 (USA)	4.09999999999999964	Mindless Behavior: All Around the World	\N
81	When the White House (Secret Service Code: "Olympus") is captured by a terrorist mastermind and the President is kidnapped, disgraced former Presidential Secret Service Agent Mike Banning finds himself trapped within the building. As our national security team scrambles to respond, they are forced to rely on Banning's inside knowledge to help retake the White House, save the President and avert an even bigger disaster. Written by FilmDistrict	119 min	http://ia.media-imdb.com/images/M/MV5BMTkxNjIyNjE5OF5BMl5BanBnXkFtZTcwMTI3NzkxOQ@@._V1_SX214_.jpg	22 March 2013 (USA)	6.40000000000000036	Olympus Has Fallen	\N
82	The Croods is a prehistoric comedy adventure that follows the world's first family as they embark on a journey of a lifetime when the cave that has always shielded them from danger is destroyed. Traveling across a spectacular landscape, the Croods discover an incredible new world filled with fantastic creatures -- and their outlook is changed forever. Written by DreamWorks Animation	98 min	http://ia.media-imdb.com/images/M/MV5BMTcyOTc2OTA1Ml5BMl5BanBnXkFtZTcwOTI1MjkzOQ@@._V1_SY317_CR0,0,214,317_.jpg	22 March 2013 (USA)	7.29999999999999982	The Croods	\N
83	Straitlaced Princeton University admissions officer Portia Nathan (Tina Fey) is caught off-guard when she makes a recruiting visit to an alternative high school overseen by her former college classmate, the freewheeling John Pressman (Paul Rudd). Pressman has surmised that Jeremiah (Nat Wolff), his gifted yet very unconventional student, might well be the son that Portia secretly gave up for adoption many years ago. Soon, Portia finds herself bending the rules for Jeremiah, putting at risk the life she thought she always wanted -- but in the process finding her way to a surprising and exhilarating life and romance she never dreamed of having. Written by Focus Features	107 min	http://ia.media-imdb.com/images/M/MV5BOTE2OTkwNzg5Ml5BMl5BanBnXkFtZTcwOTY0NzQ3OA@@._V1_SX214_.jpg	22 March 2013 (USA)	5.59999999999999964	Admission	\N
84	1968 was the year that changed the world. And for four young Aboriginal sisters from a remote mission this is the year that would change their lives forever. Around the globe, there was protest and revolution in the streets. Indigenous Australians finally secured the right to vote. There were drugs and the shock of a brutal assassination. And there was Vietnam. The sisters, Cynthia, Gail, Julie and Kay are discovered by Dave, a talent scout with a kind heart, very little rhythm but a great knowledge of soul music. Billed as Australia's answer to 'The Supremes', Dave secures the sisters their first true gig, and flies them to Vietnam to sing for the American troops. Based on a true story, THE SAPPHIRES is a triumphant celebration of youthful emotion, family and music. Written by Goalpost Pictures	103 min	http://ia.media-imdb.com/images/M/MV5BMTQyNTk5MDk1OF5BMl5BanBnXkFtZTcwNjgyODYxOQ@@._V1_SX214_.jpg	9 August 2012 (Australia)	6.90000000000000036	The Sapphires	\N
85	At 42, David lives the life of an irresponsible adolescent. He coasts through life with minimal effort and maintains a complicated relationship with Valerie, a young policewoman. Just as she tells him she's pregnant, David's past resurfaces. Twenty years earlier, he began providing sperm to a fertility clinic in exchange for money. He discovers he's the father of 533 children, 142 of whom have filed a class action lawsuit to determine the identity of their biological father, known only by the pseudonym Starbuck. Written by Anonymous	109 min	http://ia.media-imdb.com/images/M/MV5BMjMyMDczMzU1OV5BMl5BanBnXkFtZTcwMzMwNzk1OA@@._V1_SX214_.jpg	3 May 2012 (New Zealand)	7.20000000000000018	Starbuck	\N
86	When a rival gang buffs Malcolm and Sofia's latest graffiti masterpiece with a replica of the NY Mets home-run apple, they're determined to get spectacular revenge - by tagging the real Mets' apple. Over the course of a whirlwind two-day heat wave, these tough teens from the Bronx must hustle, scramble, and steal to execute the scheme that will make them the most famous writers in New York. Written by Anonymous	81 min	http://ia.media-imdb.com/images/M/MV5BNTMyNTY1NTQ2OF5BMl5BanBnXkFtZTcwOTU3ODQxOQ@@._V1_SY317_CR0,0,214,317_.jpg	2 January 2013 (France)	6.40000000000000036	Gimme the Loot	\N
87	When a young soldier in Vietnam gets dumped by his hometown girl, he and his best friend decide to go AWOL and return to the States to win her back.	100 min	http://ia.media-imdb.com/images/M/MV5BMTgzOTg1MzI4MV5BMl5BanBnXkFtZTcwOTkwOTcxOQ@@._V1_SY317_CR0,0,214,317_.jpg	22 March 2013 (USA)	5.40000000000000036	Love and Honor	\N
88	While mapping out the largest cave system in Ukraine, explorer and investigator Chris Nicola discovers evidence that five Jewish families spent nearly a year and a half in the pitch-black caves to escape the Nazis. This is the story of the longest uninterrupted underground survival in recorded human history. Written by History Channel	83 min	http://ia.media-imdb.com/images/M/MV5BMjExMzgzNjU4NF5BMl5BanBnXkFtZTcwMzkzMzgxOQ@@._V1_SX214_.jpg	9 May 2013 (Germany)	6.29999999999999982	No Place on Earth	\N
89	Mo is a young boy growing up in a traditional Egyptian household, but beyond the front door of the family's modest London flat is a completely different world - the streets of Hackney. The impressionable Mo idolizes his handsome older brother Rashid and wants to follow is his footsteps. However, Rashid, a charismatic and shrewd member of a local gang, wants a different life for his little brother and deals drugs hoping to put Mo through college. One eventful summer, Rashid's sexual awakening forces Mo to confront his own fears and phobias and threatens to tear the brothers apart. Written by Anonymous	111 min	http://ia.media-imdb.com/images/M/MV5BMTc5MzE0MTI1N15BMl5BanBnXkFtZTcwMjcwMzYyOQ@@._V1_SX214_.jpg	9 November 2012 (UK)	6.20000000000000018	My Brother the Devil	\N
90	In the heat of the summer of 1976, keen drama teacher Vivienne fights sweltering heat and general teenage apathy to put on an end of year music version of Shakespeare's The Tempest. To engage her students, she uses hits of the time, which will be performed by a fresh young cast led by rising star Aneurin Barnard. Written by Websurfer	110 min	http://ia.media-imdb.com/images/M/MV5BMTA0MjQ4MDAzMTdeQTJeQWpwZ15BbWU3MDgzMDkzMTk@._V1_SX214_.jpg	22 March 2013 (USA)	5.40000000000000036	Hunky Dory	\N
91	Beth (Vinessa Shaw) and Francis (Ebon Moss-Bachrach), a young married couple, are on holiday together when they venture to a beautiful, but highly remote, island. Beth is pregnant and the two are hoping to enjoy their last vacation before their baby is born. When they arrive, they notice that while there are plenty of children present, the adults all seem to be missing. Initially attributing this to the after effects of a recent festival, they quickly realize something far more sinister is afoot. The two will face terror and unsettling difficult decisions in their quest to make it off the island alive. Written by Anonymous	87 min	http://ia.media-imdb.com/images/M/MV5BMjEzNjIwMTcwNF5BMl5BanBnXkFtZTcwMTQ1ODIxOQ@@._V1_SX214_.jpg	22 March 2013 (USA)	4.59999999999999964	Come Out and Play	\N
92	In this comedy film, a computer tablet full of the world's most hilariously offensive apps breaks through the borders of political correctness, stirring up cultural anarchy.		http://ia.media-imdb.com/images/M/MV5BMTQ3NzAyMDUyOF5BMl5BanBnXkFtZTcwMDMzMDM5OA@@._V1_SY317_CR0,0,214,317_.jpg	22 March 2013 (USA)	2.89999999999999991	InAPPropriate Comedy	\N
93	A documentary based on the honor, courage and commitment of Navy SEAL LT Michael P. Murphy, who gave his life for his men in 2005 and was posthumously awarded the Medal of Honor in 2007.	79 min	http://ia.media-imdb.com/images/M/MV5BMTkzODAwNTc4MV5BMl5BanBnXkFtZTcwMDM1MTAyOQ@@._V1_SX214_.jpg	22 March 2013 (USA)	3.70000000000000018	Murph: The Protector	\N
94	A poet who starts a health-conscious food stand finds support from his friends, as well as a potential love match with one of his customers. But will unexpected complications jeopardize his dreams of a hot dog-free future?	85 min	http://ia.media-imdb.com/images/M/MV5BMTgwMjg0Njk4NF5BMl5BanBnXkFtZTcwMjk4MDcyOQ@@._V1_SY317_CR3,0,214,317_.jpg	17 September 2010 (USA)	5.59999999999999964	The Happy Poet	\N
95	Framed for crimes against the country, the G.I. Joe team is terminated by the President's order, and the surviving team members face off against Zartan, his accomplices, and the world leaders he has under his influence. Written by Anonymous	110 min	http://ia.media-imdb.com/images/M/MV5BNzk5ODM0OTQ0N15BMl5BanBnXkFtZTcwODg2ODE4OA@@._V1_SX214_.jpg	28 March 2013 (USA)	5.79999999999999982	G.I. Joe: Retaliation	\N
96	A race of aliens who are non corporeal go from planet to planet looking for hosts. They come to Earth and basically take over human bodies. Now it's believed that once they take over a body all memories of the previous inhabitant are gone. And there are some humans who have remain hidden from them and are basically a resistance movement. So an alien charged with locating them known as the Seeker captures one of them a girl named Melanie and puts one of them who is known as Wanderer in her body, in hopes of finding out where the humans are. But Melanie for some reason is still there and she convinces Wanderer not to say anything to Seeker. Wanderer feels empathy for the humans. When Seeker is disappointed at her lack of progress, she informs Wanderer that she'll be removed and placed in a new host and she will be placed in Melanie. Melanie knowing she can't convince her the way she convinced Wanderer convinces Wsnderer to run away and they can meet with the humans. Eventually they find... Written by rcs0411@yahoo.com	125 min	http://ia.media-imdb.com/images/M/MV5BMjMwNDg1MTAzNV5BMl5BanBnXkFtZTcwNTk5ODI3OA@@._V1_SX214_.jpg	29 March 2013 (USA)	5.70000000000000018	The Host	\N
97	An ambitious married woman's temptation by a handsome billionaire leads to betrayal, recklessness, and forever alters the course of her life.	111 min	http://ia.media-imdb.com/images/M/MV5BMTg3MzExNjU1N15BMl5BanBnXkFtZTcwMzk0ODU5OA@@._V1_SX214_.jpg	29 March 2013 (USA)	4.20000000000000018	Temptation: Confessions of a Marriage Counselor	\N
98	A mysterious and mythical motorcycle racer, Luke, (Ryan Gosling) drives out of a traveling carnival globe of death and whizzes through the backstreets of Schenectady, New York, desperately trying to connect with a former lover, Romina, (Eva Mendes) who recently and secretly gave birth to the stunt rider's son. In an attempt to provide for his new family, Luke quits the carnival life and commits a series of bank robberies aided by his superior riding ability. The stakes rise as Luke is put on a collision course with an ambitious police officer, Avery Cross, (Bradley Cooper) looking to quickly move up the ranks in a police department riddled with corruption. The sweeping drama unfolds over fifteen years as the sins of the past haunt the present days lives of two high school boys wrestling with the legacy they've inherited. The only refuge is found in the place beyond the pines. Written by StudioCanal	140 min	http://ia.media-imdb.com/images/M/MV5BMjc1OTEwNjU4N15BMl5BanBnXkFtZTcwNzUzNDIwOQ@@._V1_SX214_.jpg	19 April 2013 (USA)	7.40000000000000036	The Place Beyond the Pines	\N
99	A subjective documentary that explores the numerous theories about the hidden meanings within 'Stanley Kubrick (I)' 's Kubrick' 's film The Shining. The film may be over 30 years old but it continues to inspire debate, speculation, and mystery. Five very different points of view are illuminated through voice over, film clips, animation and dramatic reenactments. Together they'll draw the audience into a new maze, one with endless detours and dead ends, many ways in, but no way out. Written by Anonymous	102 min	http://ia.media-imdb.com/images/M/MV5BMzQyMjgzNzAwNl5BMl5BanBnXkFtZTcwODI0NjIzNw@@._V1_SX214_.jpg	26 October 2012 (UK)	6.40000000000000036	Room 237	\N
303	A cocky young man travels to Oregon to work on an apple farm. Out of his element, he finds his lifestyle and notions being picked apart by everyone who crosses his path.	88 min	http://ia.media-imdb.com/images/M/MV5BMTExODkwNTAzODBeQTJeQWpwZ15BbWU3MDAzNzE4OTk@._V1_SY317_CR2,0,214,317_.jpg	20 January 2013 (USA)	5.09999999999999964	C.O.G.	\N
100	Former criminal Jacob Sternwood is forced to return to London from his Icelandic hideaway when his son is involved in a heist gone wrong. This gives detective Max Lewinsky one last chance to catch the man he has always been after. As they face off, they start to uncover a deeper conspiracy they both need to solve in order to survive. Written by Anonymous	99 min	http://ia.media-imdb.com/images/M/MV5BODkwNjY1MjUzOF5BMl5BanBnXkFtZTcwOTU0NDAyOQ@@._V1_SX214_.jpg	4 April 2013 (Portugal)	6.09999999999999964	Welcome to the Punch	\N
101	Dolph Springer wakes up one morning to realize he has lost the love of his life, his dog, Paul. During his quest to get Paul (and his life) back, Dolph radically changes the lives of others: a pizza-delivering nymphomaniac, a jogging-addict neighbor in search of completeness, an opportunistic French-Mexican gardener, and an off-kilter pet detective. In his journey to find Paul, Dolph may lose something even more vital: his mind. Written by Realitism Films	94 min	http://ia.media-imdb.com/images/M/MV5BODM5NzYyMTIyN15BMl5BanBnXkFtZTcwODM3MDQ5OA@@._V1_SY317_CR2,0,214,317_.jpg	1 February 2013 (USA)	6	Wrong	\N
102	An honest temple priest takes on more than he can handle when he bears witness to a murder and gives evidence in a court of law against a powerful landlord in his village. The landlord bribes his way to freedom and engineers a ploy to ruin the priests reputation and his status among his peers in the village. Ashamed of his tarnished reputation the priest commits suicide,and leaves his wife and young children to face the atrocities of the evil landlord. The son flees the village and travels to Mumbai to make a life, but returns years later to avenge the shame caused to his family. Thi Written by UTV Motion Pictures	150 min	http://ia.media-imdb.com/images/M/MV5BMTM4MTYwNDA0NF5BMl5BanBnXkFtZTcwNjE0MjQyOQ@@._V1_SY317_CR3,0,214,317_.jpg	29 March 2013 (USA)	2.29999999999999982	Himmatwala	\N
103	The Moochmore girls are certain they all suffer from some kind of undiagnosed mental illness - because if they're not crazy then they're just unpopular. Their mother Shirley - unable to cope with her demanding daughters and unsupported by her philandering politician husband, Barry - suffers a nervous breakdown. After Barry commits his wife to a mental hospital (telling his constituents that "she's on holiday") he finds himself alone with 5 teenage girls he barely knows. Desperate, he impulsively picks up a hitchhiker named Shaz and installs her in his home as nanny to his daughters. Written by Caitlin Rose	116 min	http://ia.media-imdb.com/images/M/MV5BMTc1NjQ1OTA1NF5BMl5BanBnXkFtZTcwMTk0NzcwOQ@@._V1_SX214_.jpg	29 March 2013 (USA)	5.79999999999999982	Mental	\N
104	A band of bullfighting dwarfs save the life of a young woman with amnesia. They end up taking her under their wing when they find out that she has seemingly natural skills as a bullfighter, upon which they can capitalize not only for their act but for her own personal gain. As she does not know her name or background, the dwarfs coin her Blancanieves, after the famed fairy tale. What they are all unaware of is that she is really Carmen, the daughter of the once great matador, Antonio Villalta. On the day Carmen was born, her father suffered a career ending accident, and her mother died in childbirth. Her father quickly remarried his nurse, the evil Encarna. Although raised by her grandmother during her early years, Carmen, following the death of her grandmother, went to live with Encarna while an adolescent, Encarna who treated her as a slave. Carmen eventually found her disabled father, who was hidden away and treated poorly by Encarna. In the meantime, Encarna was cavorting with the... Written by Huggo	104 min	http://ia.media-imdb.com/images/M/MV5BMjIyNjY2MTgxMF5BMl5BanBnXkFtZTcwODg2Njk1OA@@._V1_SY317_CR4,0,214,317_.jpg	7 March 2013 (Portugal)	7.40000000000000036	Branca de Neve	\N
105	Five twenty-something friends become holed up in a remote cabin. When they discover a Book of the Dead, they unwittingly summon up dormant demons living in the nearby woods, which possess the youngsters in succession until only one is left intact to fight for survival. Written by Sony Pictures Entertainment	91 min	http://ia.media-imdb.com/images/M/MV5BNTQ3OTkwNTgyN15BMl5BanBnXkFtZTcwNTAzOTAzOQ@@._V1_SX214_.jpg	5 April 2013 (USA)	6.5	Evil Dead	\N
106	Huge advancements in scientific technology have enabled a mogul to create an island full of living dinosaurs. John Hammond has invited four individuals, along with his two grandchildren, to join him at Jurassic Park. But will everything go to plan? Especially when one of the parks' own workers attempts to steal the dinosaur embryos, and has to shut down critical security systems in the process. It's now a race for survival with dangerous creatures roaming all over the island. Written by Film_Fan	127 min	http://ia.media-imdb.com/images/M/MV5BMjQzODQyMzk2Nl5BMl5BanBnXkFtZTcwNTg4MjQ3OA@@._V1_SX214_.jpg	11 June 1993 (USA)	8	Jurassic Park	\N
107	A fine art auctioneer mixed up with a gang joins forces with a hypnotherapist to recover a lost painting. As boundaries between desire, reality and hypnotic suggestion begin to blur the stakes rise faster than anyone could have anticipated. Written by Fox Searchlight	101 min	http://ia.media-imdb.com/images/M/MV5BMjMzNjU1MTg5NF5BMl5BanBnXkFtZTcwMTExMTcwOQ@@._V1_SX214_.jpg	25 April 2013 (Portugal)	6.90000000000000036	Trance	\N
108	After years in hiding, ex-Weather Underground militant, Nick Sloan aka Jim Grant, learns about his old compatriot's arrest for a bank robbery turned deadly in the 1970s, which he is wanted as an accomplice. This puts the ambitious young local reporter, Ben Shepard, on the scent of a story that exposes Nick as well. As such, Nick goes on the run while taking his daughter to safety. With that accomplished, Nick stays one step ahead of the FBI while pursuing a faint hope to clear his name. Meanwhile, Shepard digs deeper into the case himself as he discovers the true complexities of another times' determined ideals even as Nick faces their consequences with another. Written by Kenneth Chisholm (kchishol@rogers.com)	121 min	http://ia.media-imdb.com/images/M/MV5BMTQ0NDQxOTY3M15BMl5BanBnXkFtZTcwNTE0MTExOQ@@._V1_SY317_CR0,0,214,317_.jpg	11 April 2013 (Portugal)	6.29999999999999982	The Company You Keep	\N
109	Recently heartbroken, Simon travels to Paris to clear his head. After several days of wandering aimlessly, Simon finds himself drawn into a sex parlor and has a sexual encounter with an exotic prostitute, Victoria. The chemistry builds between the two until they find themselves in a serious relationship, one that leads to blackmail, betrayal and the ultimate revelation of Simon's true nature. Written by IFC Films	101 min	http://ia.media-imdb.com/images/M/MV5BMTM4MzU2ODMxNV5BMl5BanBnXkFtZTcwNDk1MDE3OA@@._V1_SX214_.jpg	12 April 2013 (USA)	6	Simon Killer	\N
110	A man and woman are drawn together, entangled in the life cycle of an ageless organism. Identity becomes an illusion as they struggle to assemble the loose fragments of wrecked lives.	96 min	http://ia.media-imdb.com/images/M/MV5BMTQzMzQ4MDAyNF5BMl5BanBnXkFtZTcwNzE0MDk3OA@@._V1_SX214_.jpg	30 August 2013 (UK)	6.79999999999999982	Upstream Color	\N
111	A documentary that chronicles the life of young college professor Angela Davis, and how her social activism implicates her in a botched kidnapping attempt that ends with a shootout, four dead, and her name on the FBI's 10 most wanted list.	102 min	http://ia.media-imdb.com/images/M/MV5BMTY1ODk4MDk2M15BMl5BanBnXkFtZTcwMzYyOTUwOQ@@._V1_SY317_CR0,0,214,317_.jpg	5 April 2013 (USA)	5.90000000000000036	Free Angela and All Political Prisoners	\N
112	Based on the comic book series "The Brass Teapot" about mid-twenty year old couple who, in these difficult economic times, finds a mysterious, magical brass teapot which makes them money but at a surprising price. After realizing the teapots powers, John and Alice must decide how far they will go to fulfill their dream. Written by Anonymous	101 min	http://ia.media-imdb.com/images/M/MV5BMTEyNDIxOTE3NDheQTJeQWpwZ15BbWU3MDI0ODE5OTg@._V1_SX214_.jpg	15 April 2013 (USA)	6.20000000000000018	The Brass Teapot	\N
113	Lars Olafssen, once a young celebrity in the art world is slipping away fast into the land of has-beens. His long-time art dealer, Ronny, is now an ungracefully aging hipster who desperately wants his meal ticket back. But Lars refuses to paint. His creativity comes at too high a cost - his inspiration is carnage - blood, guts and limbs. Not surprisingly, this lead to a dreadful breakdown in the past. Nevertheless, an eager Ronny arranges a teaching job for Lars at an art school in Koda Lake, a small Canadian town in the middle of nowhere. It's a "therapeutic" measure for Lars - a means to conquer his need to paint in the "safety" of a country retreat... That is, until Eddie comes into his life. Written by dobbinnian / rodriguez	90 min	http://ia.media-imdb.com/images/M/MV5BMTcwMDA3NTUxM15BMl5BanBnXkFtZTcwNTQ0MDMzOQ@@._V1_SY317_CR1,0,214,317_.jpg	5 April 2013 (USA)	5.5	Eddie	\N
114	After the death of her husband, Dr. Cara Harding's faith in God has been shaken, but not her belief in science. In an attempt to get her more open to accepting unexplainable psychiatric theories, her father introduces her to Adam, a patient with multiple personalities who also takes on some of the physical characteristics of his other personalities. But Cara quickly discovers that his other personalities were murder victims and the more she finds out about Adam and his past, the closer she and her loved ones are to becoming murder victims themselves. Written by napierslogs	112 min	http://ia.media-imdb.com/images/M/MV5BMTM3Njk3ODA2M15BMl5BanBnXkFtZTcwNzUzOTMxOQ@@._V1_SX214_.jpg	1 March 2013 (USA)	6	6 Souls	\N
115	In 1946, Jackie Robinson is a Negro League baseball player who never takes racism lying down. Branch Rickey is a Major League team executive with a bold idea. To that end, Rickey recruits Robinson to break the unspoken color line as the first modern African American Major League player. As both anticipate, this proves a major challenge for Robinson and his family as they endure unrelenting racist hostility on and off the field, from player and fan alike. As Jackie struggles against his nature to endure such abuse without complaint, he finds allies and hope where he least expects it. Written by Kenneth Chisholm (kchishol@rogers.com)	128 min	http://ia.media-imdb.com/images/M/MV5BMTQwMDU4MDI3MV5BMl5BanBnXkFtZTcwMjU1NDgyOQ@@._V1_SX214_.jpg	12 April 2013 (USA)	7.5	42	\N
116	Happily-married couple Dan and Jody begin to notice some bizarre activity once they bring their lost nieces and nephew home. But when the chaos expands into Jody's job as a ballet dancer and Dan's career as an Ape researcher, they realize their family is being stalked by a nefarious demon. Together, with the advice of a psychic and the aid of numerous surveillance cameras, they must figure out how to get rid of it before it's too late. Written by Dimension Films	86 min	http://ia.media-imdb.com/images/M/MV5BMTc5OTIxMjQ4NF5BMl5BanBnXkFtZTcwOTAyNDcyOQ@@._V1_SY317_CR0,0,214,317_.jpg	12 April 2013 (USA)	3.39999999999999991	Scary MoVie	\N
117	Neil (Ben Affleck) is an American traveling in Europe who meets and falls in love with Marina (Olga Kurylenko), an Ukrainian divorcée who is raising her 10-year-old daughter Tatiana in Paris. The lovers travel to Mont St. Michel, the island abbey off the coast of Normandy, basking in the wonder of their newfound romance. Neil makes a commitment to Marina, inviting her to relocate to his native Oklahoma with Tatiana. He takes a job as an environmental inspector and Marina settles into her new life in America with passion and vigor. After a holding pattern, their relationship cools. Marina finds solace in the company of another exile, the Catholic priest Father Quintana (Javier Bardem), who is undergoing a crisis of faith. Work pressures and increasing doubt pull Neil further apart from Marina, who returns to France with Tatiana when her visa expires. Neil reconnects with Jane (Rachel McAdams), an old flame. They fall in love until Neil learns that Marina has fallen on hard times. ... Written by Magnolia Pictures	112 min	http://ia.media-imdb.com/images/M/MV5BMTAwNzk1NjM2ODZeQTJeQWpwZ15BbWU3MDE1MjQwMjk@._V1_SX214_.jpg	9 May 2013 (Portugal)	6.09999999999999964	To the Wonder	\N
118	Syd March is an employee at a clinic that sells injections of live viruses harvested from sick celebrities to obsessed fans. Biological communion - for a price. Syd also supplies illegal samples of these viruses to piracy groups, smuggling them from the clinic in his own body. When he becomes infected with the disease that kills super sensation Hannah Geist, Syd becomes a target for collectors and rabid fans. He must unravel the mystery surrounding her death before he suffers the same fate. Written by Rhombus Media	108 min	http://ia.media-imdb.com/images/M/MV5BNjI5MzY0OTgwMF5BMl5BanBnXkFtZTcwNzQ1MzAzOQ@@._V1_SX214_.jpg	30 November 2012 (Iceland)	5.5	Antiviral	\N
119	Eight friends meet for their monthly couples brunch. But what starts as an impromptu therapy session/airing of domestic grievances takes a sudden, catastrophic turn when the city falls victim to a mysterious attack. Trapped in the house and unsure of their fates, these seemingly normal people become increasingly unhinged to surprising results. Written by Oscilloscope Pictures	88 min	http://ia.media-imdb.com/images/M/MV5BMTQwNjYzMTQ0Ml5BMl5BanBnXkFtZTcwNDUzODM5Nw@@._V1_SX214_.jpg	7 June 2013 (Poland)	6.40000000000000036	It's a Disaster	\N
120	This bitter sweet comedy follows protagonist Robbie as he sneaks into the maternity hospital to visit his young girlfriend Leonie and hold his newborn son Luke for the first time. Overwhelmed by the moment, he swears that Luke will not have the same tragic life he has had. Escaping a prison sentence by the skin of his teeth, he's given one last chance......While serving a community service order, he meets Rhino, Albert and Mo who, like him, find it impossible to find work because of their criminal records. Little did Robbie imagine how turning to drink might change their lives - not cheap fortified wine, but the best malt whiskies in the world. Will it be 'slopping out' for the next twenty years, or a new future with 'Uisge Beatha' the 'Water of Life?' Only the angels know........ Written by Rebecca O'Brien, producer	101 min	http://ia.media-imdb.com/images/M/MV5BNzQ0MTg1MzI0Ml5BMl5BanBnXkFtZTcwNDA0MTcyOQ@@._V1_SY317_CR6,0,214,317_.jpg	3 October 2013 (Portugal)	7	The Angels' Share	\N
121	A hard-working lawyer, attached to his cell phone, can't find the time to communicate with his family. A couple is drawn into a dangerous situation when their secrets are exposed online. A widowed ex-cop struggles to raise a mischievous son who cyber-bullies a classmate. An ambitious journalist sees a career-making story in a teen that performs on an adult-only site. They are strangers, neighbors and colleagues and their stories collide in this riveting dramatic thriller about ordinary people struggling to connect in today's wired world. Written by LD Entertainment	115 min	http://ia.media-imdb.com/images/M/MV5BMjA2MTEzMDkyOF5BMl5BanBnXkFtZTcwNzc4NTgxOQ@@._V1_SX214_.jpg	17 October 2013 (Portugal)	7.5	Disconnect	\N
122	In World War II, the German pilots Lieutenant Horst Schopis, Josef Schwartz and Wolfgang Strunk crash their airplane in the wilderness of Norway after shooting down a British airplane. They walk through a snow storm until they reach shelter in an abandoned hunter cabin. Soon the British pilot Captain Charles P. Davenport and the gunner Robert Smith arrive in the cabin and they become prisoners of the German pilots. However, after the initial friction between the enemies, they realize that they should team-up to survive in the wilderness in the beginning of an improbable friendship. Written by Claudio Carvalho, Rio de Janeiro, Brazil	100 min	http://ia.media-imdb.com/images/M/MV5BMTM5MDgzMTAyMV5BMl5BanBnXkFtZTcwODA5MzUwOQ@@._V1_SY317_CR0,0,214,317_.jpg	12 April 2013 (USA)	7	Into the White	\N
123	Caden Welles has the world at his disposal. With the resources of his wealthy father, he's living life as large as any 20-year-old could dream. But what happens when that dream becomes a nightmare halfway around the world? Traveling with his friends to Hyderabad, India on a whim, Caden's expectations of a never-ending party crash hard. But not as hard as his conscience when he refuses to help a starving man and his little girl. Haunted by the images of Kiran and Annika, Caden attempts to right his wrong-only to discover Kiran has been forced to sell his own daughter. Caden's eyes are now opened to a world few Americans know still exists: a thriving human-trafficking trade. Add the dehumanization of Kiran and hundreds of millions of other Dalits due to India's caste system, and Caden could easily turn his back. Yet spurred by a true purpose, an unlikely new friendship, and the prayers of his mother and girlfriend back home, Caden chooses to help in Kiran's unlikely search to find his ... Written by Not Today	118 min	http://ia.media-imdb.com/images/M/MV5BMjIxNDI5ODc1MV5BMl5BanBnXkFtZTcwNjY1NjQxOA@@._V1_SX214_.jpg	12 April 2013 (USA)	4.59999999999999964	Not Today	\N
124	One of the few remaining drone repairmen assigned to Earth, its surface devastated after decades of war with the alien Scavs, discovers a crashed spacecraft with contents that bring into question everything he believed about the war, and may even put the fate of mankind in his hands. Written by Black Dahlia	124 min	http://ia.media-imdb.com/images/M/MV5BMTQwMDY0MTA4MF5BMl5BanBnXkFtZTcwNzI3MDgxOQ@@._V1_SX214_.jpg	19 April 2013 (USA)	7	Oblivion	\N
125	Heidi, a blond rock chick, DJs at a local radio station, and together with the two Hermans (Whitey and Munster) forms part of the "Big H Radio Team." A mysterious wooden box containing a vinyl record arrives for Heidi, a gift of the Lords. She assumes it's a rock band on a mission to spread their word. As Heidi and Whitey play the Lords' record, it starts to play backwards, and Heidi experiences a flashback to a past trauma. Later, Whitey plays the Lords' record, dubbing them the Lords of Salem, and to his surprise, the record plays normally and is a massive hit with his listeners. The arrival of another wooden box from the Lords presents the Big H team with free tickets, posters and records to host a gig in Salem. Soon, Heidi and her cohorts are far from the rock spectacle they're expecting. The original Lords of Salem are returning and they're out for blood. Written by UHM	101 min	http://ia.media-imdb.com/images/M/MV5BMjA2NTc5Njc4MV5BMl5BanBnXkFtZTcwNTYzMTcwOQ@@._V1_SX214_.jpg	18 April 2013 (Russia)	5.20000000000000018	The Lords of Salem	\N
126	Maria Jose 'Majo' Tonorio is a tough LA street poet who spits from the heart. After meeting a talented DJ she cuts her first demo under the guidance of a small time hustler more interested in promoting Majo's sexuality than her lyrics. Soon a major label and its strong-arm executive come calling. Convinced that a record deal will deliver much needed money for the family, Majo is suddenly faced with some stark choices. Does she accept the deal and turn her back on the friends who got her to the precipice of success or does she let a golden opportunity slip away. Written by Anonymous	80 min	http://ia.media-imdb.com/images/M/MV5BMTU2ODA0OTI4Ml5BMl5BanBnXkFtZTcwMjM5MDkzOQ@@._V1_SX214_.jpg	19 April 2013 (USA)	4.5	Filly Brown	\N
127	A sixteen-year-old boy insinuates himself into the house of a fellow student from his literature class and writes about it in essays for his French teacher. Faced with this gifted and unusual pupil, the teacher rediscovers his enthusiasm for his work, but the boy's intrusion will unleash a series of uncontrollable events. Written by Production	105 min	http://ia.media-imdb.com/images/M/MV5BMTY3OTQwMTg5Ml5BMl5BanBnXkFtZTcwNjQ4NzAyOQ@@._V1_SX214_.jpg	18 July 2013 (Portugal)	7.29999999999999982	Dentro de Casa	\N
128	Based on the true story of Daniel Lugo (Mark Wahlberg) a Miami bodybuilder who wants to live the American dream. He would like to have the money that other people have. So he enlists the help of fellow bodybuilder Adrian Doorbal (Anthony Mackie) and ex-convict, Christian bodybuilder Paul Doyle (Dwayne Johnson). Their kidnapping and extortion scheme goes terribly wrong since they have muscles for brains and they're left to haphazardly try to hold onto the elusive American dream. Written by napierslogs	129 min	http://ia.media-imdb.com/images/M/MV5BMTU0NDE5NTU0OV5BMl5BanBnXkFtZTcwMzI1OTMzOQ@@._V1_SY317_CR0,0,214,317_.jpg	26 April 2013 (USA)	6.5	Pain & Gain	\N
129	Don and Ellie were once married and have two children, Lyla and Jared. They adopted a boy from Colombia, Alejandro. Eventually they divorce, Ellie moves away and Don hooks up with Bebe, Ellie's best friend. When Alejandro is about to get married, he informs Don And Ellie that he never told his natural mother who is so traditional that they got divorced. And she is coming for the wedding so he asks them if they can pretend to still be married. Don and Ellie reluctantly agree to it and Bebe moves out who is also upset that Don for some reason doesn't want to commit. Written by rcs0411@yahoo.com	89 min	http://ia.media-imdb.com/images/M/MV5BMTcwODUwMjg2Ml5BMl5BanBnXkFtZTcwMTc2NzkxOA@@._V1_SX214_.jpg	26 April 2013 (USA)	5.40000000000000036	The Big Wedding	\N
130	14 year-old Ellis (Tye Sheridan) lives on a makeshift houseboat on the banks of a river in Arkansas with his parents, Mary Lee (Sarah Paulson) and Senior (Ray McKinnon). He sneaks out early one morning to meet his best friend, Neckbone (Jacob Lofland). Neckbone, also 14, lives with his uncle, Galen (Michael Shannon), who makes a hardscrabble living diving for oysters. The two boys set out to an island on the Mississippi River, where Neckbone has discovered an unusual sight-a boat, suspended high in the trees, a remnant of an extreme flood some time in the past. They climb the tree and into the boat only to find fresh bread and fresh footprints. Realizing that they are not the only ones who have discovered the treehouse boat, they decide to leave. When they reach the shore, they find the same footprint in their boat. And that's when they meet Mud (Matthew McConaughey). Mud is a gritty, superstitious character; his clothes are dirty, his tooth is cracked, and he needs help. He tells the... Written by Roadside Attractions	130 min	http://ia.media-imdb.com/images/M/MV5BMTU2MzcyODgyNV5BMl5BanBnXkFtZTcwNTc4MDYwOQ@@._V1_SX214_.jpg	10 May 2013 (USA)	7.5	Mud	\N
304	The tragic death of a beautiful young girl starts a tense and atmospheric game of cat and mouse between hunter John Moon and the hardened backwater criminals out for his blood.	116 min	http://ia.media-imdb.com/images/M/MV5BMjMzNzAwNTk2OF5BMl5BanBnXkFtZTgwMjE3MDAxMDE@._V1_SY317_CR2,0,214,317_.jpg	25 April 2013 (USA)	5.90000000000000036	A Single Shot	\N
131	The Norwegian explorer Thor Heyerdahl crossed the Pacific Ocean in a balsawood raft in 1947, together with five men, to prove that South Americans back in pre-Columbian times could have crossed the ocean and settled on Polynesian islands. After financing the trips with loans and donations, they set off on an epic 101-day-long trip across 8000 kilometers, while the world was waiting for the result of the trip. The film tells about the origin of the idea, the preparations, and the events on the trip. The "Kon-Tiki" was named after the Inca sun god, Viracocha, and "Kon-Tiki" is an old name for this god. Heyerdahl filmed the expedition, which later became the Academy Award winning documentary in 1951, and he wrote a book about the expedition that was translated into 70 languages and sold more than 50 millions copies around the world. Heyerdahl believed that people from South America could have settled Polynesia in pre-Columbian times, although most anthropologists now believe they did not... Written by OJT	118 min	http://ia.media-imdb.com/images/M/MV5BMjMxOTU2NzQxMF5BMl5BanBnXkFtZTcwODIwODY0OA@@._V1_SY317_CR4,0,214,317_.jpg	26 April 2013 (USA)	7.20000000000000018	Kon-Tiki	\N
132	Wallace Avery hates his job. His ex-wife and son hate him, and he's blown his one shot at living his dream. Not wanting to face all this, he stages his own death and buys himself a new identity as Arthur Newman. However, Arthur's road trip towards anew life is interrupted by the arrival of the beautiful but fragile Mike, who is also trying to leave her past behind. Drawn to one another, these two damaged souls begin to connect as they break into empty homes and take on the identities of the absent owners: elderly newlyweds, a high-roller and his Russian lady, among others. Through this process, Arthur and Mike discover that what they love most about each other are the identities they left at home, and their real journey, that of healing, begins. Written by Becky Johnston	101 min	http://ia.media-imdb.com/images/M/MV5BMTEyNzY1NzAzNjZeQTJeQWpwZ15BbWU3MDA5MjcxMzk@._V1_SX214_.jpg	25 July 2013 (Portugal)	5.40000000000000036	Arthur Newman	\N
133	In the competitive world of modern agriculture, ambitious Henry Whipple wants his rebellious son Dean to help expand his family's farming empire. However, Dean has his sights set on becoming a professional race car driver. When a high-stakes investigation into their business is exposed, father and son are pushed into an unexpected crisis that threatens the family's entire livelihood. Written by Sony Pictures Classics	105 min	http://ia.media-imdb.com/images/M/MV5BMTc1Nzg0NDEwOV5BMl5BanBnXkFtZTcwODUxNTgxOQ@@._V1_SX214_.jpg	18 July 2013 (Portugal)	5.59999999999999964	At Any Price	\N
134	A young Pakistani man is chasing corporate success on Wall Street. He finds himself embroiled in a conflict between his American Dream, a hostage crisis, and the enduring call of his family's homeland.	130 min	http://ia.media-imdb.com/images/M/MV5BNzAzNjg3Mzg1Nl5BMl5BanBnXkFtZTcwOTUzNzExOQ@@._V1._CR25,27.166671752929688,1347,1995.9999542236328_SY317_CR1,0,214,317_.jpg	23 May 2013 (Portugal)	6.70000000000000018	The Reluctant Fundamentalist	\N
135	Family man Marlon Villar - a longtime chauffeur to corrupt Filipino politician Manuel Chango - is faced with an unthinkable predicament when he is ambushed while driving both his boss's and his own daughter home from school one afternoon. In the chaos of the kidnapping attempt, things go horribly awry and Marlon's daughter is taken and held for ransom instead. Desperate to save his daughter, Marlon must navigate the conflicting motives between the ruthless kidnappers, untrustworthy Chango and determined detectives eager to name him a suspect without letting on the wrong girl was taken hostage. As events spin wildly out of control, Marlon, Chango and their families are forced into a rapid downward spiral of deceit and betrayal that will leave no one innocent. Written by Graceland	84 min	http://ia.media-imdb.com/images/M/MV5BMTQ0MDI4NTIzN15BMl5BanBnXkFtZTcwOTM1MzcxOQ@@._V1_SX214_.jpg	26 April 2013 (USA)	6.5	Graceland	\N
136	Marvel's "Iron Man 3" pits brash-but-brilliant industrialist Tony Stark/Iron Man against an enemy whose reach knows no bounds. When Stark finds his personal world destroyed at his enemy's hands, he embarks on a harrowing quest to find those responsible. This journey, at every turn, will test his mettle. With his back against the wall, Stark is left to survive by his own devices, relying on his ingenuity and instincts to protect those closest to him. As he fights his way back, Stark discovers the answer to the question that has secretly haunted him: does the man make the suit or does the suit make the man? Written by Jawadjee	130 min	http://ia.media-imdb.com/images/M/MV5BMjIzMzAzMjQyM15BMl5BanBnXkFtZTcwNzM2NjcyOQ@@._V1_SX214_.jpg	3 May 2013 (USA)	7.40000000000000036	Iron Man Three	\N
137	A Danish woman, Ida (Trine Dyrholm), who has just finished her cancer treatments, walks in on her suffering husband in bed with his young co-worker. She travels alone to their daughter's wedding, which is to take place in Italy, but meets the father of the groom, Philip (Pierce Brosnan), and immediately makes a bad first impression. At the seaside villa where Philip once lived with his wife, conflicts arise not least between the soon-to-be newlyweds. But first impressions fade, and Ida may find her chance for another life. Written by Peter Brandt Nielsen	116 min	http://ia.media-imdb.com/images/M/MV5BNzYxMDQwMzIzMF5BMl5BanBnXkFtZTcwNjcxODIzOQ@@._V1_SY317_CR0,0,214,317_.jpg	9 May 2013 (Portugal)	6.5	Só Precisamos de Amor	\N
138	It's the most mythic of all American emporiums - and the scene of many an ultimate fashion fantasy. Now audiences get a rarified chance to peek behind the backroom doors and into the reality of the fascinating inner workings and fabulous untold stories from Bergdorf Goodman's iconic history in Scatter My Ashes at Bergdorf's. Written by Anonymous	93 min	http://ia.media-imdb.com/images/M/MV5BMjI3MjQwNTU4Ml5BMl5BanBnXkFtZTcwNjcyODUzOQ@@._V1_SX214_.jpg	3 May 2013 (USA)	4.59999999999999964	Scatter My Ashes at Bergdorf's	\N
139	In the 1960s, Richard Kuklinski is working as a porn film lab tech until his mob bosses persuade him to change his career into that of a contract killer. For years, Kuklinski gains a reputation for cold blooded professionalism even as he raises a family who are kept in the dark about his true career. Unfortunately, mob politics ultimately forces him to secretly work independently with the psychopathic Robert 'Mr. Freezy' Pronge. As much as Kuklinski tries to keep his lives separate, circumstances and his own weaknesses threaten a terrible collision as the consequences of his choices finally catch up to him. Written by Kenneth Chisholm (kchishol@rogers.com)	105 min	http://ia.media-imdb.com/images/M/MV5BMTc3NjY3NzUyOF5BMl5BanBnXkFtZTcwMTA5NzAyOA@@._V1_SX214_.jpg	1 August 2013 (Portugal)	6.90000000000000036	The Iceman	\N
140	In the months after the heady weeks of May '68, a group of young Europeans search for a way to continue the revolution believed to be just beginning.	122 min	http://ia.media-imdb.com/images/M/MV5BMTk1Mjg5NDU1OV5BMl5BanBnXkFtZTcwMDI5OTI0OQ@@._V1_SY317_CR0,0,214,317_.jpg	14 November 2012 (France)	6.59999999999999964	Something in the Air	\N
221	The true story of the "Flying Sikh" - world champion runner and Olympian Milkha Singh -- who overcame the massacre of his family, civil war during the India-Pakistan partition, and homelessness to become one of India's most iconic athletes. Written by Reliance Big Pictures	186 min	http://ia.media-imdb.com/images/M/MV5BMTY1Nzg4MjcwN15BMl5BanBnXkFtZTcwOTc1NTk1OQ@@._V1_SY317_CR2,0,214,317_.jpg	12 July 2013 (USA)	8.09999999999999964	Bhaag Milkha Bhaag	\N
141	What Maisie Knew is a contemporary New York City revisioning of the Henry James novel by the same name. It revolves around unwitting 7-year-old Maisie, caught in the middle of a custody battle between her mother Susanna, an aging rock star, and her father, Beale, a major art dealer. Written by Anonymous	99 min	http://ia.media-imdb.com/images/M/MV5BMTY1MDk0MTIzN15BMl5BanBnXkFtZTcwNDM3NzkxOQ@@._V1_SX214_.jpg	3 May 2013 (USA)	7.40000000000000036	What Maisie Knew	\N
142	The vampire Djuna resists the advances of Paolo, but soon gives in to their passion. When her trouble-making sister unexpectedly comes to visit, Djuna's love is threatened, and the whole vampire community becomes endangered.	97 min	http://ia.media-imdb.com/images/M/MV5BMjMyMzg5OTAxNF5BMl5BanBnXkFtZTcwNTcxMzUxOQ@@._V1_SY317_CR0,0,214,317_.jpg	28 March 2013 (USA)	5.40000000000000036	Kiss of the Damned	\N
143	Greetings from Tim Buckley follows the story of the days leading up to Jeff Buckley's eminent 1991 performance at his father's tribute concert in St. Ann's Church. Through a romance with a young woman working at the concert, he learns to embrace all of his feelings toward the father who abandoned him - longing, anger, forgiveness, and love. Culminating a cathartic performance of his father's most famous songs, Jeff's debut stuns the audience and launches his career as one of the greatest young musicians of his time. Written by Production Weekly	99 min	http://ia.media-imdb.com/images/M/MV5BMTkyNTI0MzkxMF5BMl5BanBnXkFtZTcwMDE1MzU0OQ@@._V1_SX214_.jpg	4 July 2013 (Hong Kong)	5.29999999999999982	Greetings from Tim Buckley	\N
144	"Generation Um..." follows a day in the life of John and his two beautiful cohorts as they live life on the fringe, immersed in sex, drugs and indecision. As they navigate their daily routine of bars, crowds and New York City living, they embark on a path of self-discovery. Written by Anonymous	97 min	http://ia.media-imdb.com/images/M/MV5BMTY2OTk0MzQzNF5BMl5BanBnXkFtZTcwNTQxNTgxOQ@@._V1_SY317_CR2,0,214,317_.jpg	28 May 2013 (USA)	3.70000000000000018	Generation Um...	\N
145	A western set on the New Mexico frontier a few years after the Civil War and centered on a struggling young family and the mining company who wants to buy their land.	93 min	http://ia.media-imdb.com/images/M/MV5BMTQxNjQyMzI3OF5BMl5BanBnXkFtZTcwMDQxNDA0OQ@@._V1_SY317_CR0,0,214,317_.jpg	3 May 2013 (USA)	5.20000000000000018	Dead Man's Burden	\N
146	Adam is a rich industrialist, who aspires to a more cultured world. Spurred on by playful jibes that he is little more than a city suit living the capitalist's dream, this frustrated amateur opera singer decides to throw an opera in his lavish country retreat. Once his friends see him belting out the notes, he feels sure it will spell the end to their shallow taunts. In fact, it might even help him win the hand of a female conductor he has been pursuing whom - it just so happens - is the first to be recruited for his showpiece. Written by Anonymous	116 min	http://ia.media-imdb.com/images/M/MV5BODUzOTYyNzM2NF5BMl5BanBnXkFtZTcwMTE0NDg0Ng@@._V1_SY317_CR9,0,214,317_.jpg	3 May 2013 (USA)	4.5	1st Night	\N
147	On May 5th, 1862, a few thousand Mexican soldiers put their lives on the line against the world's largest and most powerful army in one legendary battle for freedom and for Mexico.	125 min	http://ia.media-imdb.com/images/M/MV5BMjAzMjg4MDU1OF5BMl5BanBnXkFtZTcwNjg4MDU0OQ@@._V1_SX214_.jpg	3 May 2013 (Mexico)	5.20000000000000018	Cinco de Mayo, La Batalla	\N
148	An adaptation of F. Scott Fitzgerald's Long Island-set novel, where Midwesterner Nick Carraway is lured into the lavish world of his neighbor, Jay Gatsby. Soon enough, however, Carraway will see through the cracks of Gatsby's nouveau riche existence, where obsession, madness, and tragedy await. Written by Anonymous	143 min	http://ia.media-imdb.com/images/M/MV5BMTkxNTk1ODcxNl5BMl5BanBnXkFtZTcwMDI1OTMzOQ@@._V1_SX214_.jpg	10 May 2013 (USA)	7.29999999999999982	O Grande Gatsby	\N
149	Sparks fly when Wade Walker crashes the Peeples annual reunion in the Hamptons to ask for their precious daughter Grace's hand in marriage.	95 min	http://ia.media-imdb.com/images/M/MV5BMTQwODU0MDM4Ml5BMl5BanBnXkFtZTcwMTA5MDkzOQ@@._V1_SX214_.jpg	10 May 2013 (USA)	4.5	Peeples	\N
150	Chris wants to show girlfriend Tina his world, but events soon conspire against the couple and their dream caravan holiday takes a very wrong turn.	88 min	http://ia.media-imdb.com/images/M/MV5BMTQ5ODAwNDAzOF5BMl5BanBnXkFtZTcwMDUyOTc0OQ@@._V1_SX214_.jpg	10 May 2013 (USA)	6.5	Sightseers	\N
151	Ever since Venus and Serena Williams started playing in tennis tournaments, they've provoked strong reactions - from awe and admiration to suspicion and resentment. They've been winning championships for over a decade, pushing the limits of longevity in such a demanding sport. How long can they last? In Venus & Serena, we gain unprecedented access into their lives during the most intimidating year of their career. Over the course of 2011, Venus grappled with an energy-sapping autoimmune disease while Serena battled back from a life-threatening pulmonary embolism. Neither Venus nor Serena let their adversities hold them back. They drew their greatest strength from each other. Written by Michelle Major	99 min	http://ia.media-imdb.com/images/M/MV5BMzM0MDQyMzc3OF5BMl5BanBnXkFtZTcwNTA0NDcyOQ@@._V1_SY317_CR0,0,214,317_.jpg	28 June 2013 (UK)	5.59999999999999964	Venus and Serena	\N
152	After an earthquake erupts in Chile, tourist discover that a neighboring prison in the area collapsed in the event, and all surviving criminals managed to break free. Soon they learn that the most terrifying thing, more threatening that Mother Nature, is what she created. Written by AnotherMovieGuy45	89 min	http://ia.media-imdb.com/images/M/MV5BMTQyOTA3MjQzNF5BMl5BanBnXkFtZTcwMzc3NzY0OQ@@._V1_SY317_CR0,0,214,317_.jpg	9 May 2013 (Kuwait)	4.79999999999999982	Aftershock	\N
153	A gang of ruthless highway killers kidnap a wealthy couple traveling cross country only to shockingly discover that things are not what they seem.	86 min	http://ia.media-imdb.com/images/M/MV5BMjMzMzI0OTgwM15BMl5BanBnXkFtZTgwMzU5ODQxMDE@._V1_SY317_CR5,0,214,317_.jpg	10 May 2013 (USA)	5.79999999999999982	No One Lives	\N
154	In 1970, Jeffrey Kagel walked away from the American dream of rock 'n' roll stardom, turning down the chance to record as lead singer for the band soon-to-be the Blue Oyster Cult. Instead, he sold all his possessions and moved from the suburbs of Long Island to the foothills of the Himalayas in search of happiness and a little-known saint named Neem Karoli Baba. ONE TRACK HEART: THE STORY OF KRISHNA DAS follows his journey to India and back, witnessing his struggles with depression and drug abuse, to his eventual emergence as Krishna Das, world-renowned spiritual teacher and chant master. Featuring interviews with Ram Dass (LSD Icon Richard Alpert), Rick Rubin (Grammy Award winning Producer), Sharon Salzberg (NY Times bestselling author), Daniel Goleman (two-time Pulitzer Prize nominee), as well as a musical score by J Mascis (Dinosaur Jr) & Devadas, this is the inspiring story of how one man's heart-expanding journey continues to transform countless lives. Written by Anonymous	74 min	http://ia.media-imdb.com/images/M/MV5BMjMzNjAwNjI4Nl5BMl5BanBnXkFtZTcwOTU2NzAzOQ@@._V1_SX214_.jpg	17 June 2012 (USA)	6.70000000000000018	One Track Heart: The Story of Krishna Das	\N
155	Story centers on the aftermath of a suicide bombing in Indonesia, where a reckless American posing as a grad student is bent on vengeance but quickly finds that the world's problems can't be solved with violence alone. A mysterious American Marine/FBI agent Jake Travers (Kellan Lutz) teams with a Muslim cop Hashim (Ario Bayu) to hunt down a dangerous international jewel thief Malik (Mickey Rourke) who kidnaps a Sultan's daughter Sultana (Atiqah Hasiholan) in a plot to steal the royal treasury: exotic intrigue amid ancient palaces, mosques, temples, subterranean labyrinths and stone pyramids in the heart of Java. Written by H.G.	104 min	http://ia.media-imdb.com/images/M/MV5BMTczNzU3MTA3Nl5BMl5BanBnXkFtZTcwOTc1OTYzOQ@@._V1_SX214_.jpg	18 April 2013 (Indonesia)	4.90000000000000036	Java Heat	\N
156	When the crew of the Enterprise is called back home, they find an unstoppable force of terror from within their own organization has detonated the fleet and everything it stands for, leaving our world in a state of crisis. With a personal score to settle, Captain Kirk leads a manhunt to a war-zone world to capture a one man weapon of mass destruction. As our heroes are propelled into an epic chess game of life and death, love will be challenged, friendships will be torn apart, and sacrifices must be made for the only family Kirk has left: his crew. Written by Paramount Pictures	132 min	http://ia.media-imdb.com/images/M/MV5BMTk2NzczOTgxNF5BMl5BanBnXkFtZTcwODQ5ODczOQ@@._V1_SX214_.jpg	16 May 2013 (USA)	7.90000000000000036	Star Trek Into Darkness	\N
157	Frances lives in New York, but she doesn't really have an apartment. Frances is an apprentice for a dance company, but she's not really a dancer. Frances has a best friend named Sophie, but they aren't really speaking anymore. Frances throws herself headlong into her dreams, even as their possible reality dwindles. Frances wants so much more than she has but lives her life with unaccountable joy and lightness. Written by IFC Films	86 min	http://ia.media-imdb.com/images/M/MV5BOTY0NDQ2NzQ2N15BMl5BanBnXkFtZTcwMTU0OTkwOQ@@._V1_SX214_.jpg	17 October 2013 (Portugal)	7.59999999999999964	Frances Ha	\N
158	In this inspired, genre-twisting new film, Oscar®-nominated writer/director Sarah Polley discovers that the truth depends on who's telling it. Polley is both filmmaker and detective as she investigates the secrets kept by a family of storytellers. She playfully interviews and interrogates a cast of characters of varying reliability, eliciting refreshingly candid, yet mostly contradictory, answers to the same questions. As each relates their version of the family mythology, present-day recollections shift into nostalgia-tinged glimpses of their mother, who departed too soon, leaving a trail of unanswered questions. Polley unravels the paradoxes to reveal the essence of family: always complicated, warmly messy and fiercely loving. Stories We Tell explores the elusive nature of truth and memory, but at its core is a deeply personal film about how our narratives shape and define us as individuals and families, all interconnecting to paint a profound, funny and poignant picture of the ... Written by The National Film Board of Canada	108 min	http://ia.media-imdb.com/images/M/MV5BMTg3MDU2NjI3N15BMl5BanBnXkFtZTcwMjYwMzYyOQ@@._V1_SX214_.jpg	7 November 2013 (Portugal)	7.59999999999999964	Histórias que Contamos	\N
159	An ex-CIA agent and his estranged daughter are forced on the run when his employers erase all records of his existence, and mark them both for termination as part of a wide-reaching international conspiracy.	100 min	http://ia.media-imdb.com/images/M/MV5BMTM3MjQwNzE1OF5BMl5BanBnXkFtZTcwMDYyNDYyOQ@@._V1_SX214_.jpg	4 April 2013 (Portugal)	6	Erased	\N
160	Linda Sinclair (Julianne Moore) is a forty-year-old unmarried high school English teacher in the small town of Kingston, Pennsylvania. She shares a small apartment with two Siamese cats and her rich collection of great literature. She maintains no close personal relationships aside from those she has with her favorite authors and stories. Her life is far less complicated than the dramas she devours on the page, and she likes it that way. But Linda's simple life turns an unexpected page when former star pupil Jason Sherwood (Michael Angarano) returns to Kingston after trying to make it as a playwright in New York. Now in his 20s, Jason is on the verge of abandoning art, pressured by his overbearing father, Dr. Tom Sherwood (Greg Kinnear), to face reality and go to law school. Linda can't stand the thought of Jason giving up on his dreams so she decides to mount his play - a dark, angst-ridden, ambitious work - as a Kingston High School production, with flamboyant drama teacher Carl ... Written by Cinedigm	93 min	http://ia.media-imdb.com/images/M/MV5BMTU2MjIwNDA5MF5BMl5BanBnXkFtZTcwMjU2NzEzOQ@@._V1_SX214_.jpg	28 November 2013 (Portugal)	5.59999999999999964	The English Teacher	\N
161	A look at the relationship between pioneering 19th century French neurologist Dr. Jean-Martin Charcot and his star teenage patient, a kitchen maid who is left partially paralyzed after a seizure.	102 min	http://ia.media-imdb.com/images/M/MV5BMTM2ODA4MzE3N15BMl5BanBnXkFtZTcwODE2NjA0OQ@@._V1_SY317_CR0,0,214,317_.jpg	7 November 2012 (France)	5.90000000000000036	Augustine	\N
162	Three women who were good friends in the past get back together for the first time since they were kids to spend time on an island called Black Rock. They meet some local hunters and find out they know one of them from when they were children. After inviting them to join them in a few drinks on the beach, the atmosphere changes into one of panic and horror as the situation and friendships are turned on their head in a brutal confrontation. Written by Michael Hallows Eve	83 min	http://ia.media-imdb.com/images/M/MV5BMjM0NjExNDkwOF5BMl5BanBnXkFtZTcwMDQ3ODQxOQ@@._V1_SX214_.jpg	17 May 2013 (USA)	4.59999999999999964	Black Rock	\N
163	A look deep inside Israel and Palestine at the men and women trying to seize a historic opportunity to end the conflict and make implementing the two-state solution a reality.	98 min	http://ia.media-imdb.com/images/M/MV5BMzQxNDc3NzcyNV5BMl5BanBnXkFtZTcwOTI0MDE1OQ@@._V1_SX214_.jpg	17 May 2013 (USA)	5.59999999999999964	State 194	\N
164	Since Dom (Diesel) and Brian's (Walker) Rio heist toppled a kingpin's empire and left their crew with $100 million, our heroes have scattered across the globe. But their inability to return home and living forever on the lam have left their lives incomplete. Meanwhile, Hobbs (Johnson) has been tracking an organization of lethally skilled mercenary drivers across 12 countries, whose mastermind (Evans) is aided by a ruthless second-in-command revealed to be the love Dom thought was dead, Letty (Rodriguez). The only way to stop the criminal outfit is to outmatch them at street level, so Hobbs asks Dom to assemble his elite team in London. Payment? Full pardons for all of them so they can return home and make their families whole again. Written by Universal Pictures	130 min	http://ia.media-imdb.com/images/M/MV5BMTM3NTg2NDQzOF5BMl5BanBnXkFtZTcwNjc2NzQzOQ@@._V1_SX214_.jpg	24 May 2013 (USA)	7.20000000000000018	Fast & Furious 6	\N
165	In the aftermath of the death of Alan's father, the wolfpack decide to take Alan to get treated for his mental issues. But things start to go wrong on the way to the hospital as the wolfpack is assaulted and Doug is kidnapped. Now they must find Mr. Chow again in order to surrender him to the gangster who kidnapped Doug in order to save him. Written by HeWhoShallNotBeNamed	100 min	http://ia.media-imdb.com/images/M/MV5BMTA0NjE1MzMzODheQTJeQWpwZ15BbWU3MDY4MTQ3Mzk@._V1_SX214_.jpg	23 May 2013 (USA)	5.90000000000000036	The Hangover Part III	\N
166	Young Mary Katherine (M.K.) returns to her eccentric scientist father's home, but his all-consuming quest to discover a tiny civilization in the neighboring forest drives them apart. However, M.K. soon finds herself shrunken down by Queen Tara of that forest who was mortally wounded by the putrefying Boggans, and charged to deliver a pod bearing the new Queen to safety. Together with a veteran Leafman warrior, two goofy mollusks and a young maverick, M.K. agrees to help. As the villainous Boggan leader, Mandrake closes in, M.K. and her new friends must draw on the best of themselves together and discover what they have to save their world. Written by Kenneth Chisholm (kchishol@rogers.com)	102 min	http://ia.media-imdb.com/images/M/MV5BMTgyNDYwNzE5NV5BMl5BanBnXkFtZTcwMzUyODM5OA@@._V1_SY317_CR0,0,214,317_.jpg	24 May 2013 (USA)	6.59999999999999964	Epic	\N
167	It has been nine years since we last met Jesse and Celine, the French-American couple who once met on a train in Vienna. They now live in Paris with twin daughters, but have spent a summer in Greece on the invitation of an author colleague of Jesse's. When the vacation is over and Jesse must send his teenage son off to the States, he begins to question his life decisions, and his relationship with Celine is at risk. Written by Peter Brandt Nielsen	109 min	http://ia.media-imdb.com/images/M/MV5BMjA5NzgxODE2NF5BMl5BanBnXkFtZTcwNTI1NTI0OQ@@._V1_SX214_.jpg	14 June 2013 (USA)	8.09999999999999964	Before Midnight	\N
168	A devout 18-year-old Israeli is pressured to marry the husband of her late sister. Declaring her independence is not an option in Tel Aviv's ultra-Orthodox Hasidic community, where religious law, tradition and the rabbi's word are absolute. Written by Sundance Film Festival	90 min	http://ia.media-imdb.com/images/M/MV5BNzQ3ODMyMjA1MV5BMl5BanBnXkFtZTcwMTIzMzEzOQ@@._V1_SX214_.jpg	29 August 2013 (Portugal)	6.59999999999999964	Noiva Prometida	\N
169	A documentary that details the creation of Julian Assange's controversial website, which facilitated the largest security breach in U.S. history.	130 min	http://ia.media-imdb.com/images/M/MV5BNTg3MjUyNjkzNl5BMl5BanBnXkFtZTcwMTQzNDgyOQ@@._V1_SX214_.jpg	11 July 2013 (Germany)	6.5	We Steal Secrets: The Story of WikiLeaks	\N
170	One thousand years after cataclysmic events forced humanity's escape from Earth, Nova Prime has become mankind's new home. Legendary General Cypher Raige returns from an extended tour of duty to his estranged family, ready to be a father to his 13-year-old son, Kitai. When an asteroid storm damages Cypher and Kitai's craft, they crash-land on a now unfamiliar and dangerous Earth. As his father lies dying in the cockpit, Kitai must trek across the hostile terrain to recover their rescue beacon. His whole life, Kitai has wanted nothing more than to be a soldier like his father. Today, he gets his chance. Written by Columbia Pictures	100 min	http://ia.media-imdb.com/images/M/MV5BMTY3MzQyMjkwMl5BMl5BanBnXkFtZTcwMDk2OTE0OQ@@._V1_SX214_.jpg	31 May 2013 (USA)	5	After Earth	\N
171	Four magicians each answer a mysterious summons to an obscure address with secrets inside. A year later, they are the Four Horseman, big time stage illusionists who climax their sold out Las Vegas show with a bank apparently robbed for real. This puts agents Dylan Rhodes of the FBI and Alma Dray of Interpol on the case to find out how they did it. However, this mystery proves difficult to solve even with the insights of the professional illusion exposer, Thaddeus Bradley. What follows is a bizarre investigation where nothing is what it seems with illusions, dark secrets and hidden agendas galore as all involved are reminded of a great truth in this puzzle: the closer you look, the less you see. Written by Kenneth Chisholm (kchishol@rogers.com)	115 min	http://ia.media-imdb.com/images/M/MV5BMTY0NDY3MDMxN15BMl5BanBnXkFtZTcwOTM5NzMzOQ@@._V1_SX214_.jpg	31 May 2013 (USA)	7.20000000000000018	Mestres da Ilusão	\N
172	Joe Toy, on the verge of adolescence, finds himself increasingly frustrated by his single father, Frank's attempts to manage his life. Declaring his freedom once and for all, he escapes to a clearing in the woods with his best friend, Patrick, and a strange kid named Biaggio. He announces that they are going to build a house there, free from responsibility and parents. Once their makeshift abode is finished, the three young men find themselves masters of their own destiny, alone in the woods. Written by A.J. Porter	95 min	http://ia.media-imdb.com/images/M/MV5BMTc3ODA1NTI0MV5BMl5BanBnXkFtZTcwOTE4OTUzOQ@@._V1_SX214_.jpg	23 August 2013 (UK)	7.20000000000000018	The Kings of Summer	\N
173	A successful operative for an elite private intelligence firm is tasked with infiltrating an anarchist group known for executing covert attacks upon major corporations. However, she finds her priorities changing as she befriends the members and begins to develop romantic feelings for its charismatic leader. Written by Anonymous	116 min	http://ia.media-imdb.com/images/M/MV5BMjEyNjQzMzg5Nl5BMl5BanBnXkFtZTcwMjExNzU1OQ@@._V1_SX214_.jpg	28 June 2013 (UK)	6.90000000000000036	The East	\N
174	In 1993, the IRA member Collette is arrested in the London tube after leaving a bomb in the facility. MI-5 Agent Mac offers a deal to Collette to become an informer. She accepts the agreement to protect her son and in return Mac offers a new identity to her after a period working for the MI-5. Soon Mac learns that his superior Kate Fletcher is using Collette to protect her mole inside the Irish organization. Mac tries to find the identity of the informer and protect Collette. Written by Claudio Carvalho, Rio de Janeiro, Brazil	101 min	http://ia.media-imdb.com/images/M/MV5BMTQzMDYyMTk1OV5BMl5BanBnXkFtZTcwOTkyMTkzOQ@@._V1_SX214_.jpg	28 November 2013 (Portugal)	6.20000000000000018	Shadow Dancer	\N
175	A look at the life of philosopher and political theorist Hannah Arendt, who reported for The New Yorker on the war crimes trial of the Nazi Adolf Eichmann.	113 min	http://ia.media-imdb.com/images/M/MV5BMjIyMDM2NTUyNF5BMl5BanBnXkFtZTcwOTQ2NzAzOQ@@._V1_SX214_.jpg	3 October 2013 (Portugal)	7.09999999999999964	Hannah Arendt	\N
176	Two aliens from the planet Hondo have come take over our planet. But when they discover an amazing human invention called "music", they immediately abandon their mission, head to a tiny Brooklyn bar, and start the universe's first Hondonian bluegrass duo: Future Folk! Written by Production	86 min	http://ia.media-imdb.com/images/M/MV5BNzA3MDI3MzAxMl5BMl5BanBnXkFtZTcwNDY2Mjc0OQ@@._V1_SY317_CR0,0,214,317_.jpg	31 May 2013 (USA)	6.40000000000000036	The History of Future Folk	\N
177	Billy (Vince Vaughn) and Nick (Owen Wilson) are salesmen whose careers have been torpedoed by the digital world. Trying to prove they are not obsolete, they defy the odds by talking their way into a coveted internship at Google, along with a battalion of brilliant college students. But, gaining entrance to this utopia is only half the battle. Now they must compete with a group of the nation's most elite, tech-savvy geniuses to prove that necessity really is the mother of re-invention. Written by Twentieth Century Fox	119 min	http://ia.media-imdb.com/images/M/MV5BMjM1MzczMDgwOV5BMl5BanBnXkFtZTcwMDM4NjM2OQ@@._V1_SX214_.jpg	7 June 2013 (USA)	6.20000000000000018	The Internship	\N
261	A road trip through medicalized America, examining the pervasiveness of pharmaceutical drugs through the lives of eight very unique characters.	80 min	http://ia.media-imdb.com/images/M/MV5BMTgwNzY0Mzc3MF5BMl5BanBnXkFtZTcwMjAyNzY3OQ@@._V1_SX214_.jpg	May 2012 (Canada)	4.90000000000000036	Off Label	\N
178	In an America wracked by crime and overcrowded prisons, the government has sanctioned an annual 12-hour period in which any and all criminal activity-including murder-becomes legal. The police can't be called. Hospitals suspend help. It's one night when the citizenry regulates itself without thought of punishment. On this night plagued by violence and an epidemic of crime, one family wrestles with the decision of who they will become when a stranger comes knocking. When an intruder breaks into James Sandin's (Ethan Hawke) gated community during the yearly lockdown, he begins a sequence of events that threatens to tear a family apart. Now, it is up to James, his wife, Mary (Lena Headey), and their kids to make it through the night without turning into the monsters from whom they hide. Written by Universal Pictures	85 min	http://ia.media-imdb.com/images/M/MV5BMTU0OTE1Nzk2NF5BMl5BanBnXkFtZTcwMjE5NDY0OQ@@._V1_SX214_.jpg	7 June 2013 (USA)	5.5	The Purge	\N
179	Leonato (Clark Gregg), the governor of Messina, is visited by his friend Don Pedro (Reed Diamond) who is returning from a victorious campaign against his rebellious brother Don John (Sean Maher). Accompanying Don Pedro are two of his officers: Benedick (Alexis Denisof) and Claudio (Fran Kranz). While in Messina, Claudio falls for Leonato's daughter Hero (Jillian Morgese), while Benedick verbally spars with Beatrice (Amy Acker), the governor's niece. The budding love between Claudio and Hero prompts Don Pedro to arrange with Leonato for a marriage. In the days leading up to the ceremony, Don Pedro, with the help of Leonato, Claudio and Hero, attempts to sport with Benedick and Beatrice in an effort to trick the two into falling in love. Meanwhile, the villainous Don John, with the help of his allies Conrade (Riki Lindhome) and Borachio (Spencer Treat Clark), plots against the happy couple, using his own form of trickery to try to destroy the marriage before it begins. A series of comic... Written by http://muchadomovie.com/#story	109 min	http://ia.media-imdb.com/images/M/MV5BMTgxNjQ0MjAwMl5BMl5BanBnXkFtZTcwNjI1NDEyOQ@@._V1_SY317_CR12,0,214,317_.jpg	14 June 2013 (UK)	7.20000000000000018	Much Ado About Nothing	\N
180	Two teenage assassins accept what they think will be a quick-and-easy job, until an unexpected target throws them off their plan.	88 min	http://ia.media-imdb.com/images/M/MV5BMTczOTc4ODE4OF5BMl5BanBnXkFtZTcwMjg3NzY0OQ@@._V1_SY317_CR3,0,214,317_.jpg	6 June 2013 (Israel)	6.20000000000000018	Violet & Daisy	\N
181	Dirty Wars follows investigative reporter Jeremy Scahill, author of the international bestseller Blackwater, into the hidden world of America's covert wars, from Afghanistan to Yemen, Somalia, and beyond. With a strong cinematic style, the film blurs the boundaries of documentary and fiction storytelling. Part action film and part detective story, Dirty Wars is a gripping journey into one of the most important and underreported stories of our time. What begins as a report on a deadly U.S. night raid in a remote corner of Afghanistan quickly turns into a global investigation of the secretive and powerful Joint Special Operations Command (JSOC). As Scahill digs deeper into the activities of JSOC, he is pulled into a world of covert operations unknown to the public and carried out across the globe by men who do not exist on paper and will never appear before Congress. In military jargon, JSOC teams "find, fix, and finish" their targets, who are selected through a secret process. No ... Written by Anonymous	87 min	http://ia.media-imdb.com/images/M/MV5BMTUyOTYwNDUyMV5BMl5BanBnXkFtZTcwNzQwOTU1OQ@@._V1_SX214_.jpg	18 October 2013 (Spain)	6.90000000000000036	Dirty Wars	\N
182	Four friends lose themselves in a carefree South-East Asian holiday. Only three come back. Dave and Alice return home to their young family desperate for answers about Jeremy's mysterious disappearance. When Alice's sister Steph returns not long after, a nasty secret is revealed about the night her boyfriend went missing. But it is only the first of many. Who amongst them knows what happened on that fateful night when they were dancing under a full moon in Cambodia? Written by Production	89 min	http://ia.media-imdb.com/images/M/MV5BMTYzNzY5Njg1MV5BMl5BanBnXkFtZTcwNzU0OTIzOQ@@._V1_SX214_.jpg	7 June 2013 (USA)	5.79999999999999982	Wish You Were Here	\N
183	A slacker hatches a million-dollar idea. But, in order to see it through, he has to learn to trust his attractive corporate counterpart. Based on Max Barry's novel.	90 min	http://ia.media-imdb.com/images/M/MV5BMjA3NzYzMDI1MF5BMl5BanBnXkFtZTcwMDE1NTI0OQ@@._V1_SY317_CR4,0,214,317_.jpg	1 May 2013 (USA)	5.5	Syrup	\N
184	Long before O'Reilly and Beck, Morton Downey, Jr., was tearing up the talk-show format with his divisive populism. Between the fistfights, rabid audience, and Mort's cigarette smoke always "in your face," The Morton Downey Jr. Show was billed as "3-D television," "rock and roll without the music." Évocateur meditates on the hysteria that ended the '80s and ultimately its most notorious agitator. Written by Ironbound Films		http://ia.media-imdb.com/images/M/MV5BNDQ3NjcwMzc0Nl5BMl5BanBnXkFtZTcwNzQ1ODYzOQ@@._V1_SX214_.jpg	7 June 2013 (USA)	5.79999999999999982	Évocateur: The Morton Downey Jr. Movie	\N
185	A young boy learns that he has extraordinary powers and is not of this Earth. As a young man, he journeys to discover where he came from and what he was sent here to do. But the hero in him must emerge if he is to save the world from annihilation and become the symbol of hope for all mankind. Written by Warner Bros. Pictures	143 min	http://ia.media-imdb.com/images/M/MV5BMjI5OTYzNjI0Ml5BMl5BanBnXkFtZTcwMzM1NDA1OQ@@._V1_SY317_CR1,0,214,317_.jpg	14 June 2013 (USA)	7.40000000000000036	Man of Steel	\N
186	All Jay Baruchel expected coming to LA was a fun time with Seth Rogen with all the wild partying to have both by themselves and at James Franco's housewarming party. Suddenly, the Rapture hits and the Biblical Apocalypse has begun. Now, Jay and Seth are desperately sheltering in James' house for rescue along with a few other friends. Together, they must band together to attempt to survive the end of the world, only for Jay to find that they are all too dumb and superficial to do it until they discover the only way out. Written by Kenneth Chisholm (kchishol@rogers.com)	107 min	http://ia.media-imdb.com/images/M/MV5BMTQxODE3NjM1Ml5BMl5BanBnXkFtZTcwMzkzNjc4OA@@._V1_SX214_.jpg	12 June 2013 (USA)	7	This Is the End	\N
187	College. Three of the most important years of your life. Three years of studies (at times) and sheer indulgence. Indulgence in all the little pleasures that a carefree life has to offer. But it isn't always about ragging, fuchacha parties, college fests, races, and churning out ways to whack some extra pocket money from your parents. It's sometimes hard, ugly, and complicated. More so, when you really need to get admission in the coolest college in town and you know you don't deserve it. And to top that, you get yourself involved in the most bizarre stations that could crack you into pieces before you could crack it. Written by Excel Entertainment	139 min	http://ia.media-imdb.com/images/M/MV5BODI5MzQ2NDg0MV5BMl5BanBnXkFtZTcwNTEwMzI1OQ@@._V1_SY317_CR12,0,214,317_.jpg	14 June 2013 (USA)	6.59999999999999964	Fukrey	\N
274	A 20-something supervising staff member of a foster care facility navigates the troubled waters of that world alongside her co-worker and longtime boyfriend.	96 min	http://ia.media-imdb.com/images/M/MV5BMTEwNjE2OTM4NDZeQTJeQWpwZ15BbWU3MDE2MTE4OTk@._V1_SX214_.jpg	23 August 2013 (USA)	8	Short Term 12	\N
188	The backup singer exists in a strange place in the pop music world; they are always in the shadow of the feature artists even when they are in front of them in concert while they provide a vital foundation for the music. Through interviews with veterans and concert footage, the history of these predominately African-American singers is explored through the rock era. Furthermore, special focus is given to special stand outs who endeavored to make a living in the art burdened with a low profile and more personal career frustrations, especially those who faced the very different challenge of singing in the spotlight themselves. Written by Kenneth Chisholm (kchishol@rogers.com)	91 min	http://ia.media-imdb.com/images/M/MV5BMTQxNDY2NjMwNF5BMl5BanBnXkFtZTcwNzExMDg0OQ@@._V1_SX214_.jpg	28 November 2013 (Netherlands)	7.40000000000000036	20 Feet from Stardom	\N
189	A sound engineer's work for an Italian horror studio becomes a terrifying case of life imitating art.	92 min	http://ia.media-imdb.com/images/M/MV5BMTEzMzI3OTM4MDleQTJeQWpwZ15BbWU3MDgyNDAzNTk@._V1_SY317_CR0,0,214,317_.jpg	31 August 2012 (UK)	6.29999999999999982	Berberian Sound Studio	\N
190	Life for former United Nations investigator Gerry Lane and his family seems content. Suddenly, the world is plagued by a mysterious infection turning whole human populations into rampaging mindless zombies. After barely escaping the chaos, Lane is persuaded to go on a mission to investigate this disease. What follows is a perilous trek around the world where Lane must brave horrific dangers and long odds to find answers before human civilization falls. Written by Kenneth Chisholm (kchishol@rogers.com)	116 min	http://ia.media-imdb.com/images/M/MV5BMTg0NTgxMjIxOF5BMl5BanBnXkFtZTcwMDM0MDY1OQ@@._V1_SX214_.jpg	21 June 2013 (USA)	7.09999999999999964	World War Z	\N
191	Mike Wazowski and James P. Sullivan are an inseparable pair, but that wasn't always the case. From the moment these two mismatched monsters met they couldn't stand each other. "Monsters University" unlocks the door to how Mike and Sulley overcame their differences and became the best of friends. Written by Disney/Pixar	104 min	http://ia.media-imdb.com/images/M/MV5BMTUyODgwMDU3M15BMl5BanBnXkFtZTcwOTM4MjcxOQ@@._V1_SX214_.jpg	21 June 2013 (USA)	7.5	Monsters University	\N
192	"Song for Marion", a London-set comedic drama, is about shy, grumpy pensioner Arthur who is reluctantly inspired by his beloved wife Marion to join a highly unconventional local choir. At odds with his son James, it is left to charismatic choir director Elizabeth to try and persuade Arthur that he can learn to embrace life. Arthur must confront the undercurrents of his own grumbling persona as he embarks on a hilarious, life-affirming journey of musical self discovery. Written by Anonymous	93 min	http://ia.media-imdb.com/images/M/MV5BMTY5MjA5NzExM15BMl5BanBnXkFtZTcwMDE5NzU2OQ@@._V1_SX214_.jpg	22 February 2013 (UK)	6.79999999999999982	Unfinished Song	\N
193	Just when the streets seemed safe, a serial killer with a fetish for scalps is back and on the hunt. Frank is the withdrawn owner of a mannequin store, but his life changes when young artist Anna appears asking for his help with her new exhibition. As their friendship develops and Frank's obsession escalates, it becomes clear that she has unleashed a long-repressed compulsion to stalk and kill. Written by Anonymous	89 min	http://ia.media-imdb.com/images/M/MV5BMjI2NjMxMTQ5MV5BMl5BanBnXkFtZTcwODczMTQ3OQ@@._V1_SY317_CR0,0,214,317_.jpg	2 January 2013 (France)	6.09999999999999964	Maniac	\N
194	The cargo ship MV Rozen is heading for harbor when it is hijacked by Somali pirates in the Indian Ocean. Amongst the men on board are the ship's cook Mikkel and the engineer Jan, who along with the rest of the seamen are taken hostage in a cynical game of life and death. With the demand for a ransom of millions of dollars a psychological drama unfolds between the CEO of the shipping company and the Somali pirates. Written by Production	103 min	http://ia.media-imdb.com/images/M/MV5BMTQ0NDI4Nzg1N15BMl5BanBnXkFtZTcwNjE2NjcyOQ@@._V1_SY317_CR0,0,214,317_.jpg	20 September 2012 (Denmark)	7.09999999999999964	A Hijacking	\N
195	A documentary that explores the downloading revolution; the kids that created it, the bands and the businesses that were affected by it, and its impact on the world at large.	106 min	http://ia.media-imdb.com/images/M/MV5BMTk5MjI3NDQ5NV5BMl5BanBnXkFtZTcwOTc3NzY0OQ@@._V1_SX214_.jpg	10 March 2013 (USA)	6.40000000000000036	Downloaded	\N
196	Inspired by actual events, a group of fame-obsessed teenagers use the internet to track celebrities' whereabouts in order to rob their homes.	90 min	http://ia.media-imdb.com/images/M/MV5BMTQzMTgwMzQxN15BMl5BanBnXkFtZTcwOTcwNTY0OQ@@._V1_SX214_.jpg	21 June 2013 (USA)	5.70000000000000018	The Bling Ring	\N
197	Capitol Policeman John Cale has just been denied his dream job with the Secret Service of protecting President James Sawyer. Not wanting to let down his little girl with the news, he takes her on a tour of the White House, when the complex is overtaken by a heavily armed paramilitary group. Now, with the nation's government falling into chaos and time running out, it's up to Cale to save the president, his daughter, and the country. Written by Columbia Pictures	131 min	http://ia.media-imdb.com/images/M/MV5BMTAyNzQyNTcwNjVeQTJeQWpwZ15BbWU3MDAwOTQ4Nzk@._V1_SY317_CR0,0,214,317_.jpg	28 June 2013 (USA)	6.29999999999999982	White House Down	\N
198	Sarah Ashburn, an FBI agent, is extremely ambitious and has her eye on a promotion, but she doesn't get along with her co-workers. She is sent to Boston to uncover the identity of an elusive drug lord, Mr. Larkin, by tracking down his proxy, Rojas, and is told that she'll have a good shot at the promotion if she finds Larkin. When she arrives in Boston, she learns that Larkin has been eliminating his competition and taking over their operations. She learns that Rojas is in Boston PD custody and goes to see him to ask him what he knows about Larkin, but is warned that the cop who arrested Rojas, Shannon Mullins, is very territorial, and she is not exactly sociable. When the two meet they don't get along. When Mullins learns why Ashburn is in Boston, she decides to find Larkin herself. Ashburn is told by her boss to work with Mullins, but it won't be easy because Ashburn does things by the book while Mullins does things her way. Written by rcs0411@yahoo.com	117 min	http://ia.media-imdb.com/images/M/MV5BMjA2MDQ2ODM3MV5BMl5BanBnXkFtZTcwNDUzMTQ3OQ@@._V1_SX214_.jpg	28 June 2013 (USA)	6.59999999999999964	The Heat	\N
199	A technical failure has endangered the lives of the people on board Peninsula Flight 2549. The pilots are striving, along with their colleagues in the Control Center, to find a solution. The flight attendants and the chief steward are atypical, baroque characters who, in the face of danger, try to forget their own personal problems and devote themselves body and soul to the task of making the flight as enjoyable as possible for the passengers, while they wait for a solution. Life in the clouds is as complicated as it is at ground level, and for the same reasons, which could be summarized in two: sex and death. Written by Production	90 min	http://ia.media-imdb.com/images/M/MV5BMjM0MDY2OTEzNl5BMl5BanBnXkFtZTcwMjI5ODU0OQ@@._V1_SX214_.jpg	18 April 2013 (Portugal)	5.59999999999999964	I'm So Excited!	\N
327	The U.S. government recruits Machete to battle his way through Mexico in order to take down an arms dealer who looks to launch a weapon into space.	107 min	http://ia.media-imdb.com/images/M/MV5BMjA2MzUxMTM3M15BMl5BanBnXkFtZTgwMzA2NzkxMDE@._V1_SX214_.jpg	11 October 2013 (USA)	6.09999999999999964	Machete Kills	\N
200	Two mysterious women seek refuge in a run-down coastal resort. Clara meets lonely Noel, who provides shelter in his deserted guesthouse, Byzantium. Schoolgirl Eleanor befriends Frank and tells him their lethal secret. They were born 200 years ago and survive on human blood. As knowledge of their secret spreads, their past catches up on them with deathly consequence. Written by Production	118 min	http://ia.media-imdb.com/images/M/MV5BMTk2Nzc0NDQwMV5BMl5BanBnXkFtZTcwNjI2MjY3OQ@@._V1_SX214_.jpg	31 May 2013 (UK)	6.5	Byzantium	\N
201	Homeless and on the run from a military court martial, a damaged ex-special forces soldier navigating London's criminal underworld seizes an opportunity to assume another man's identity -- transforming into an avenging angel in the process.	100 min	http://ia.media-imdb.com/images/M/MV5BMjI0ODc3NjI4NV5BMl5BanBnXkFtZTcwOTc3MzI1OQ@@._V1_SX214_.jpg	4 July 2013 (Portugal)	6.20000000000000018	Redemption	\N
202	A drama that charts ten years in the relationship of a male-to-female transsexual's relationship with her lover.	168 min	http://ia.media-imdb.com/images/M/MV5BMjAyNjQzODUyMV5BMl5BanBnXkFtZTcwNTExOTIxOQ@@._V1_SX214_.jpg	28 June 2013 (USA)	7.09999999999999964	Laurence Para Sempre	\N
203	Based on his play by the same name, Neil LaBute's script follows a successful writer who, on the eve of his wedding, travels across the country to meet up with ex-lovers in an attempt to make amends for past relationship transgressions. Crisscrossing from Seattle to Boston, he reunites with high school sweetheart Sam, sexually free-spirited Tyler, married college professor Lindsay, his best friend's little sister Reggie, and "the one that got away" Bobbi. A modern-day Candide stumbling through a landscape familiar to most men-messy breakups. Written by Leeden Media	90 min	http://ia.media-imdb.com/images/M/MV5BMTQ0ODI2NDM5MF5BMl5BanBnXkFtZTcwMTkwOTU1OQ@@._V1_SY317_CR0,0,214,317_.jpg	26 June 2013 (USA)	4.79999999999999982	Some Girl(s)	\N
204	Before Bad Brains, the Sex Pistols or even the Ramones, there was a band called Death. Punk before punk existed, three teenage brothers in the early '70s formed a band in their spare bedroom, began playing a few local gigs and even pressed a single in the hoped of getting signed. But this was the era of Motown and emerging disco. Record companies found Death's music - and band name - too intimidating, and the group were never given a fair shot, disbanding before they even completed one album. Equal parts electrifying rockumentary and epic family love story, A Band Called Death chronicles the incredible fairy-tale journey of what happened almost three decades later, when a dusty 1974 demo tape made it way out of the attic and found an audience several generations younger. Playing music impossible ahead of its time, Death is now being credited as the first black punk band (hell...the first punk band!), and are finally receiving their long overdue recognition as true rock pioneers. Written by Drafthouse Films	96 min	http://ia.media-imdb.com/images/M/MV5BMTU1NjAzMjc1M15BMl5BanBnXkFtZTcwOTk4NDY0OQ@@._V1_SY317_CR3,0,214,317_.jpg	28 June 2013 (USA)	7.09999999999999964	A Band Called Death	\N
205	Ten easy steps show you how to make money from drugs, featuring a series of interviews with drug dealers, prison employees, and lobbyists arguing for tougher drug laws.	96 min	http://ia.media-imdb.com/images/M/MV5BMTQ2NDk2NDcxOF5BMl5BanBnXkFtZTcwNDk4MjA3OQ@@._V1_SY317_CR2,0,214,317_.jpg	25 April 2013 (USA)	7.59999999999999964	How to Make Money Selling Drugs	\N
206	In the 1930s, an elderly Tonto tells a young boy the tale of John Reid, the Lone Ranger. An idealistic lawyer, he rides with his brother and fellow Texas Rangers in pursuit of the notorious Butch Cavendish. Ambushed by the outlaw and left for dead, John Reid is rescued by the renegade Comanche, Tonto, at the insistence of a mysterious white horse and offers to help him to bring Cavendish to justice. Becoming a reluctant masked rider with a seemingly incomprehensible partner, Reid pursues the criminal against all obstacles. However, John and Tonto learn that Cavendish is only part of a far greater injustice and the pair must fight it in an adventure that would make them a legend. Written by Kenneth Chisholm (kchishol@rogers.com)	149 min	http://ia.media-imdb.com/images/M/MV5BMjI3Mjk5MTUxOV5BMl5BanBnXkFtZTcwNTMyNzY3OQ@@._V1_SX214_.jpg	3 July 2013 (USA)	6.59999999999999964	The Lone Ranger	\N
207	While Gru, the ex-supervillain is adjusting to family life and an attempted honest living in the jam business, a secret Arctic laboratory is stolen. The Anti-Villain League decides it needs an insider's help and recruits Gru in the investigation. Together with the eccentric AVL agent, Lucy Wilde, Gru concludes that his prime suspect is the presumed dead supervillain, El Macho, whose his teenage son is also making the moves on his eldest daughter, Margo. Seemingly blinded by his overprotectiveness of his children and his growing mutual attraction to Lucy, Gru seems on the wrong track even as his minions are being quietly kidnapped en masse for some malevolent purpose. Written by Kenneth Chisholm (kchishol@rogers.com)	98 min	http://ia.media-imdb.com/images/M/MV5BOTg4NTk2OTg5N15BMl5BanBnXkFtZTcwMDk1MzI2OQ@@._V1._CR243,215.64999389648438,1087,1598.0000305175781_SY317_CR14,0,214,317_.jpg	3 July 2013 (USA)	7.59999999999999964	Despicable Me 2	\N
208	Filmed at a sold-out performance at Madison Square Garden, comedian Kevin Hart delivers material from his 2012 "Let Me Explain" concert tour.	75 min	http://ia.media-imdb.com/images/M/MV5BMTg4MjM2MjAxOF5BMl5BanBnXkFtZTcwMTAzOTEyOQ@@._V1_SX214_.jpg	3 July 2013 (USA)	6.20000000000000018	Kevin Hart: Let Me Explain	\N
209	Shy 14-year-old Duncan goes on summer vacation with his mother, her overbearing boyfriend, and her boyfriend's daughter. Having a rough time fitting in, Duncan finds an unexpected friend in Owen, manager of the Water Wizz water park.	103 min	http://ia.media-imdb.com/images/M/MV5BNTU5ODk5NDg0Nl5BMl5BanBnXkFtZTcwNzQwMjI1OQ@@._V1_SX214_.jpg	26 July 2013 (USA)	7.5	The Way Way Back	\N
210	After the untimely death of his daughter, Paul Raymond reflects on his life. Rising from a mind-reading act, Raymond grew to have a fabulously successful career as an erotica magnate that would make him the richest man in Britain. However, for all his material success, Paul's appetites mess up his personal life, such as alienating his wife with his philandering. Furthermore, even as he challenged his society's sexual mores, Paul's relationship with his daughter proves troublingly problematic as she came of age. While trying to be the best father he could, Paul gradually comes to realize that his proclivities have impoverished him in ways that mere money cannot address. Written by Kenneth Chisholm (kchishol@rogers.com)	101 min	http://ia.media-imdb.com/images/M/MV5BMTAxNDIyMDIxNjheQTJeQWpwZ15BbWU3MDYzNTk3MTk@._V1_SX214_.jpg	7 July 2013 (USA)	5.90000000000000036	The Look of Love	\N
275	Tensions rise between lifelong friends Mitchell and Carter after their truck breaks down on an isolated desert road as they start to attack each other's life decisions with unwavering brutality.		http://ia.media-imdb.com/images/M/MV5BMjAyNjIyOTU0M15BMl5BanBnXkFtZTcwNTUwOTI2OQ@@._V1_SY317_CR0,0,214,317_.jpg	23 August 2013 (USA)	6.40000000000000036	Scenic Route	\N
328	Romeo and Juliet secretly wed despite the sworn contempt their families hold for each another. It is not long, however, before a chain of fateful events changes the lives of both families forever.	118 min	http://ia.media-imdb.com/images/M/MV5BMTA3MjQwOTg4MTheQTJeQWpwZ15BbWU3MDM3NDE0OTk@._V1_SX214_.jpg	24 October 2013 (Portugal)	5.09999999999999964	Romeo and Juliet	\N
211	BIG STAR: NOTHING CAN HURT ME is a feature-length documentary about legendary Memphis band Big Star. While mainstream success eluded them, Big Star's three albums have become critically lauded touchstones of the rock music canon. A seminal band in the history of alternative music, Big Star has been cited as an influence by artists including REM, The Replacements, Belle & Sebastian, Elliott Smith and Flaming Lips, to name just a few. With never-before-seen footage and photos of the band, in-depth interviews and a rousing musical tribute by the bands they inspired, BIG STAR: NOTHING CAN HURT ME is a story of artistic and musical salvation. Written by Danielle McCarthy	113 min	http://ia.media-imdb.com/images/M/MV5BMTc0MDQwMjY5MV5BMl5BanBnXkFtZTcwMDkzNDY2OQ@@._V1_SX214_.jpg	15 March 2012 (USA)	6.40000000000000036	Big Star: Nothing Can Hurt Me	\N
212	A high energy, high concept, stylish action epic set in the Norse world sees a passionate young man transform into a brutal warrior as he travels the unforgiving British landscape in search of his long lost brother Hakan The Ferrocious who his people are relying on to restore order to their kingdom following the bloody death of their king. Written by Anonymous	99 min	http://ia.media-imdb.com/images/M/MV5BMTY5ODY2NjE5OF5BMl5BanBnXkFtZTcwNzY4NzAzOQ@@._V1_SY317_CR6,0,214,317_.jpg	30 May 2013 (USA)	4.5	Hammer of the Gods	\N
213	Mona (Golshifteh Farahani), 26, an immigrant from North Africa, runs her in-laws' mini market in Chicago. She's married to Mourad, a man who can't stand up to his authoritarian mother. Mona is harassed by her mother-in-law because after five years of marriage, she hasn't be able to get pregnant, something that's considered a shame and a taboo in her culture. Marilyn (Sienna Miller), 29, is a receptionist at a computer repair company. Her marriage with Harvey is on the ropes. The only thing in her life that makes her happy is her belly dance class, a passion shared by Mona. Dancing at family gatherings lifts her spirits up and makes her forget the misery of her daily life. Marilyn shops at Mona's mini-market. They've become friends. One morning, Mona's mother-in-law is found dead in her bed. Mona realizes that she mixed the wrong dose while preparing her medicine. Realizing that she might be accused of murder, Mona runs away and flees Chicago by bus. Marilyn loses her job because of ... Written by Cohen Media Group	90 min	http://ia.media-imdb.com/images/M/MV5BMTU0OTQ5NDg5N15BMl5BanBnXkFtZTcwMTc0NTg1OQ@@._V1_SY317_CR2,0,214,317_.jpg	5 July 2013 (USA)	5.5	Just Like a Woman	\N
214	When monstrous creatures, known as Kaiju, started rising from the sea, a war began that would take millions of lives and consume humanity's resources for years on end. To combat the giant Kaiju, a special type of weapon was devised: massive robots, called Jaegers, which are controlled simultaneously by two pilots whose minds are locked in a neural bridge. But even the Jaegers are proving nearly defenseless in the face of the relentless Kaiju. On the verge of defeat, the forces defending mankind have no choice but to turn to two unlikely heroes - a washed up former pilot (Charlie Hunnam) and an untested trainee (Rinko Kikuchi) - who are teamed to drive a legendary but seemingly obsolete Jaeger from the past. Together, they stand as mankind's last hope against the mounting apocalypse. Written by Del Torro	131 min	http://ia.media-imdb.com/images/M/MV5BMTY3MTI5NjQ4Nl5BMl5BanBnXkFtZTcwOTU1OTU0OQ@@._V1_SY317_CR0,0,214,317_.jpg	12 July 2013 (USA)	7.20000000000000018	Pacific Rim	\N
215	After having the greatest time of his life three summers ago, Lenny (Adam Sandler), decides he wants to move his family back to his hometown and have them grow up with his gang of childhood friends and their kids. But between old bullies, new bullies, schizophrenic bus drivers, drunk cops on skis, psycho grade school girlfriends and 400 costumed party crashes he finds out that sometimes crazy follows you. Written by Happy Madison	101 min	http://ia.media-imdb.com/images/M/MV5BMTgwNTI2MDI0OF5BMl5BanBnXkFtZTcwMTk5MDg0OQ@@._V1_SX214_.jpg	12 July 2013 (USA)	5.20000000000000018	Grown Ups 2	\N
216	This is the true story of Oscar, a 22-year-old Bay Area resident who wakes up on the morning of December 31, 2008 and feels something in the air. Not sure what it is, he takes it as a sign to get a head start on his resolutions: being a better son to his mother, whose birthday falls on New Year's Eve, being a better partner to his girlfriend, who he hasn't been completely honest with as of late, and being a better father to T, their beautiful 4 year old daughter. He starts out well, but as the day goes on, he realizes that change is not going to come easy. He crosses paths with friends, family, and strangers, each exchange showing us that there is much more to Oscar than meets the eye. But it would be his final encounter of the day, with police officers at the Fruitvale BART station that would shake the Bay Area to its very core, and cause the entire nation to be witnesses to the story of Oscar Grant. Written by The Weinstein Company	85 min	http://ia.media-imdb.com/images/M/MV5BMTQ0OTU1MDkxMF5BMl5BanBnXkFtZTcwNjI5OTA3OQ@@._V1_SX214_.jpg	26 July 2013 (USA)	7.70000000000000018	Fruitvale Station	\N
217	A teacher lives a lonely life, all the while struggling over his son's custody. His life slowly gets better as he finds love and receives good news from his son, but his new luck is about to be brutally shattered by an innocent little lie.	115 min	http://ia.media-imdb.com/images/M/MV5BMTg2NDg3ODg4NF5BMl5BanBnXkFtZTcwNzk3NTc3Nw@@._V1_SY317_CR4,0,214,317_.jpg	7 March 2013 (Portugal)	8.30000000000000071	The Hunt	\N
218	Searching for a missing student, two private investigators break into his house and find collection of VHS tapes. Viewing the horrific contents of each cassette, they realize there may be dark motives behind the student's disappearance.	96 min	http://ia.media-imdb.com/images/M/MV5BODg4OTMxNDAxMV5BMl5BanBnXkFtZTcwMjM4ODQ0OQ@@._V1_SX214_.jpg	6 June 2013 (USA)	6.09999999999999964	V/H/S/2	\N
219	Jamie (Cera) is a boorish, insensitive American twentysomething traveling in Chile, who somehow manages to create chaos at every turn. He and his friends are planning on taking a road trip north to experience a legendary shamanistic hallucinogen called the San Pedro cactus. In a fit of drunkenness at a wild party, Jamie invites an eccentric woman -- a radical spirit named Crystal Fairy (Hoffmann) -- to come along. What is meant to be a devil-may-care journey becomes a battle of wills as Jamie finds himself locking horns with his new traveling companion. But on a remote, pristine beach at the edge of the desert, the magic brew is finally imbibed, and the true adventure begins. Written by Production	98 min	http://ia.media-imdb.com/images/M/MV5BMTk3Mjk5NjUxNF5BMl5BanBnXkFtZTcwMTk3OTA4OQ@@._V1_SX214_.jpg	17 January 2013 (USA)	5.70000000000000018	Crystal Fairy	\N
220	Faced with the absurd competitiveness surrounding his son's youth league baseball team, Max Morris, a famous comedian, decides to get to know the colorful parents and coaches of the team better in an attempt to find the inspiration for his next movie. Written by IFC Films		http://ia.media-imdb.com/images/M/MV5BNjE0MTIyMDY0Ml5BMl5BanBnXkFtZTcwMjA1Njk2OQ@@._V1_SX214_.jpg	12 July 2013 (USA)	4.90000000000000036	Dealin' with Idiots	\N
329	In a world of fake castles and anthropomorphic rodents, an epic battle begins when an unemployed father's sanity is challenged by a chance encounter with two underage girls on holiday.	90 min	http://ia.media-imdb.com/images/M/MV5BNTIxNjcxOTgxM15BMl5BanBnXkFtZTgwMjYzODEzMDE@._V1_SY317_CR0,0,214,317_.jpg	18 January 2013 (USA)	5.5	Escape from Tomorrow	\N
222	After years of stability, the lives of octogenarian couple, Craig and Irene Morrison, are slowly beginning to change. Because of changing times and regulations, they are no longer able to make a living from their small coastal New Brunswick farm. And Irene has begun to show signs of early dementia. Against the wishes of their two offspring who still reside in the area and who would like to see more standard care provided for Irene, Craig, the son of a master shipbuilder who inherited his father's building abilities, decides to mill lumber from trees on their property and with it build a more suitable, small one story house on the property in which he and Irene can live. Beginning this project with only a design in his mind, he is encouraged by friends at least to go through the regulatory process of building permits and the like. Despite being able to complete this project to more than exacting centuries old standards, Craig ends up hitting one roadblock after another in this ... Written by Huggo	102 min	http://ia.media-imdb.com/images/M/MV5BMjA3NjA5OTM4MF5BMl5BanBnXkFtZTcwMjQ0MTA3OQ@@._V1_SX214_.jpg	6 June 2013 (Australia)	6.90000000000000036	Still Mine	\N
223	Based on actual events, a fisherman tries to survive in the freezing ocean after his boat capsizes off the south coast of Iceland.	95 min	http://ia.media-imdb.com/images/M/MV5BODc3MzQyMTU0OF5BMl5BanBnXkFtZTcwNjI0MzU0OQ@@._V1_SY317_CR6,0,214,317_.jpg	21 May 2013 (USA)	6.70000000000000018	The Deep	\N
224	Terms And Conditions May Apply examines the cost of so-called 'free' services and the continuing disappearance of online privacy. People may think they know what they give up when they click 'I Agree' on companies like Facebook and Google. They're wrong. Written by Anonymous	79 min	http://ia.media-imdb.com/images/M/MV5BMTQyNDc5NTUzOF5BMl5BanBnXkFtZTcwNzM0MTAzOQ@@._V1_SX214_.jpg	12 July 2013 (USA)	7	Terms and Conditions May Apply	\N
225	An unlikely basketball team of unappreciated middle-aged Texas women, all former high school champs, challenge the current arrogant high school girls' state champs to a series of games to raise money for breast cancer prevention. Sparks fly as these marginalized women go to comic extremes to prove themselves on and off the court, and become a national media sensation. Written by Hennig, Brad	99 min	http://ia.media-imdb.com/images/M/MV5BMjQ4OTM5NDk3NV5BMl5BanBnXkFtZTcwNDY1NTk1OQ@@._V1_SX214_.jpg	9 August 2013 (Spain)	4.40000000000000036	The Hot Flashes	\N
226	A group of actresses performing in a production of Shakespeare's "Twelfth Night" get caught up in a web of romantic intrigue and revelation.	65 min	http://ia.media-imdb.com/images/M/MV5BMTQxNjUwMDAyMV5BMl5BanBnXkFtZTcwNDI2Mjk3OQ@@._V1_SX214_.jpg	27 March 2013 (USA)	6.09999999999999964	Viola	\N
227	SHRAPNEL tells the story of two veterans of the Bosnian War, one American, one Serbian, who clash in the Appalachian Mountain wilderness. FORD is a former American soldier who fought on the front lines in Bosnia. When our story begins, he has retreated to a remote cabin in the woods, trying to escape painful memories of war. The drama begins when KOVAC, a former Serbian soldier, seeks Ford out, hoping to settle an old score. What follows is a cat-and-mouse game in which Ford and Kovac fght their own personal World War III, with battles both physical and psychological. By the end of the flm, old wounds are opened, suppressed memories are drawn to the surface and long-hidden secrets about both Ford and Kovac are revealed. Written by producer	91 min	http://ia.media-imdb.com/images/M/MV5BOTQ2MzA3MTk3MV5BMl5BanBnXkFtZTcwMDM5ODk2OQ@@._V1_SY317_CR0,0,214,317_.jpg	17 October 2013 (Portugal)	5.29999999999999982	Killing Season - Temporada de Caça	\N
228	A missing wedding ring leads to a wild-goose chase involving meth addicts, skinheads and an Elvis impersonator.	112 min	http://ia.media-imdb.com/images/M/MV5BMTYwMTQ3MTU0MF5BMl5BanBnXkFtZTcwMDU5NzY2OQ@@._V1_SX214_.jpg	12 July 2013 (USA)	5.59999999999999964	Pawn Shop Chronicles	\N
229	Retired C.I.A. agent Frank Moses reunites his unlikely team of elite operatives for a global quest to track down a missing portable nuclear device.	116 min	http://ia.media-imdb.com/images/M/MV5BMjI2ODQ4ODY3Nl5BMl5BanBnXkFtZTcwNTc2NzE1OQ@@._V1_SX214_.jpg	19 July 2013 (USA)	6.70000000000000018	Red 2	\N
230	After Nick is murdered by his own partner, he joins the Rest in Peace Department to protect the world from the undeads. While working with his new partner, many undeads are seen gathering in Boston. Soon he realizes that someone close to him is behind all a plot to bring on the apocalypse. Written by Immanuel A.	96 min	http://ia.media-imdb.com/images/M/MV5BMTM5OTYxNzE5N15BMl5BanBnXkFtZTcwMDU1MTQ4OQ@@._V1_SX214_.jpg	19 July 2013 (USA)	5.5	R.I.P.D.	\N
231	From the makers of MADAGASCAR and KUNG FU PANDA, TURBO is a high-velocity 3D comedy about a snail who dares to dream big - and fast. After a freak accident infuses him with the power of super-speed, Turbo kicks into overdrive and embarks on an extraordinary journey to achieve the seemingly impossible: competing in the world's fastest race, the Indianapolis 500. With the help of his tricked-out streetwise snail crew, this ultimate underdog puts his heart and shell on the line to prove that no dream is too big, and no dreamer too small. Written by DreamWorks Animation	96 min	http://ia.media-imdb.com/images/M/MV5BMTA4NTgwMjM5MzheQTJeQWpwZ15BbWU3MDg2ODA1ODk@._V1_SX214_.jpg	17 July 2013 (USA)	6.40000000000000036	Turbo	\N
232	In 1971, Carolyn and Roger Perron move their family into a dilapidated Rhode Island farm house and soon strange things start happening around it with escalating nightmarish terror. In desperation, Carolyn contacts the noted paranormal investigators, Ed and Lorraine Warren, to examine the house. What the Warrens discover is a whole area steeped in a satanic haunting that is now targeting the Perron family wherever they go. To stop this evil, the Warrens will have to call upon all their skills and spiritual strength to defeat this spectral menace at its source that threatens to destroy everyone involved. Written by Kenneth Chisholm (kchishol@rogers.com)	112 min	http://ia.media-imdb.com/images/M/MV5BMTM3NjA1NDMyMV5BMl5BanBnXkFtZTcwMDQzNDMzOQ@@._V1_SX214_.jpg	19 July 2013 (USA)	7.59999999999999964	The Conjuring	\N
233	Kristen Wiig stars as Imogene, a failed New York playwright awkwardly navigating the transition from Next Big Thing to Last Year's News. After both her career and relationship hit the skids, she's forced to make the humiliating move back home to New Jersey with her eccentric mother and younger brother (Annette Bening and Christopher Fitzgerald). Adding further insult to injury, there's a strange man sleeping in her old bedroom (Darren Criss) and an even stranger man sleeping in her mother's bed (Matt Dillon). Through it all, Imogene eventually realizes that as part of her rebuilding process she must finally come to love and accept both her family and her Jersey roots if she's ever going to be stable enough to get the hell away from them. Written by Roadside Attractions	103 min	http://ia.media-imdb.com/images/M/MV5BMTEyMDgyNDYwNjReQTJeQWpwZ15BbWU3MDc1MDQwNjk@._V1_SX214_.jpg	26 September 2013 (Portugal)	5.59999999999999964	Girl Most Likely	\N
300	Battle of the Year attracts all the best teams from around the world, but the Americans haven't won in fifteen years. Dante enlists Blake to assemble a team of the best dancers and bring the Trophy back to America where it started.	110 min	http://ia.media-imdb.com/images/M/MV5BOTY2OTcyNzM3NF5BMl5BanBnXkFtZTgwNzgxMjkxMDE@._V1_SY317_CR1,0,214,317_.jpg	20 September 2013 (USA)	3.70000000000000018	Battle of the Year	\N
234	Bangkok. Ten years ago Julian killed a man and went on the run. Now he manages a Thai boxing club as a front for a drugs operation. Respected in the criminal underworld, deep inside, he feels empty. When Julian's brother murders an underage prostitute, the police call on retired cop Chang - the Angel of Vengeance. Chang allows the father to kill his daughter's murderer, then 'restores order' by chopping off the man's right hand. Julian's mother Crystal - the head of a powerful criminal organization - arrives in Bangkok to collect her son's body. She dispatches Julian to find his killers and 'raise hell'. Written by www.joblo.com	90 min	http://ia.media-imdb.com/images/M/MV5BMzE5NzcxMTk5NF5BMl5BanBnXkFtZTcwNjE2MDg2OQ@@._V1_SX214_.jpg	25 July 2013 (Portugal)	5.90000000000000036	Só Deus Perdoa	\N
235	Notorious killer whale Tilikum is responsible for the deaths of three individuals, including a top killer whale trainer. Blackfish shows the sometimes devastating consequences of keeping such intelligent and sentient creatures in captivity. Written by Anonymous	83 min	http://ia.media-imdb.com/images/M/MV5BNTkyNTkwMzkxMl5BMl5BanBnXkFtZTcwMzAwOTE2OQ@@._V1_SX214_.jpg	18 October 2013 (Iceland)	8	Blackfish	\N
236	A documentary that challenges former Indonesian death squad leaders to reenact their real-life mass-killings in whichever cinematic genres they wish, including classic Hollywood crime scenarios and lavish musical numbers.	115 min	http://ia.media-imdb.com/images/M/MV5BNzQ0NDA1ODQ3NF5BMl5BanBnXkFtZTcwNjQwMzk0OA@@._V1_SY317_CR4,0,214,317_.jpg	8 November 2012 (Denmark)	8	The Act of Killing	\N
237	9 years ago Wali Khan (Irrfan Khan) was sent into Karachi, Pakistan by the Chief of RAW Ashwini Rao (Nasser) to report the activities of The Most Wanted Man in India. 9 days ago Rudra Pratap Singh (Arjun Rampal) Indian Armed Forces, MARCOS unit, Zoya Rehman (Huma Qureshi) RAW Explosives expert, and Aslam, a petty thief from the streets of Mumbai recruited by RAW, infiltrated Pakistan to join Wali Khan and carry out the mission to bring back The Most Wanted Man in India. The man who was going to break all ISI protocol and security and attend his own son's wedding. The man who could on that day be abducted and brought back to India to face justice. 1 day ago everything went according to plan until it all failed. The team sent in to bring The Most Wanted Man in India, did the unthinkable - they carried out the most daring operation and almost got away with it. Almost because, something went horribly wrong. Written by Yash Raj Films	153 min	http://ia.media-imdb.com/images/M/MV5BMTk4MDQzMjU3M15BMl5BanBnXkFtZTcwMDY1NzA4OQ@@._V1_SY317_CR3,0,214,317_.jpg	19 July 2013 (India)	6.90000000000000036	D-Day	\N
238	Members of a once-promising hip-hop group, now in their late 30's, struggle with regret, disappointment, and change on Election Night 2008.	93 min	http://ia.media-imdb.com/images/M/MV5BMjIxMDQ3OTM5OV5BMl5BanBnXkFtZTcwNDI3MTA2OQ@@._V1_SY317_CR1,0,214,317_.jpg	18 January 2013 (USA)	4.5	Big Words	\N
239	In modern day Japan, Wolverine is out of his depth in an unknown world as he faces his ultimate nemesis in a life-or-death battle that will leave him forever changed. Vulnerable for the first time and pushed to his physical and emotional limits, he confronts not only lethal samurai steel but also his inner struggle against his own immortality, emerging more powerful than we have ever seen him before. Written by Twentieth Century Fox	126 min	http://ia.media-imdb.com/images/M/MV5BNzg1MDQxMTQ2OF5BMl5BanBnXkFtZTcwMTk3MjAzOQ@@._V1_SX214_.jpg	26 July 2013 (USA)	6.90000000000000036	Wolverine	\N
240	Feeling pressured to become more sexually experienced before she goes to college, Brandy Klark makes a list of things to accomplish before hitting campus in the fall.	104 min	http://ia.media-imdb.com/images/M/MV5BODg4ODYxMTk2NV5BMl5BanBnXkFtZTcwNzYxMTI5OQ@@._V1_SX214_.jpg	26 July 2013 (USA)	5.70000000000000018	The To Do List	\N
241	Jasmine French used to be on the top of the heap as a New York socialite, but now is returning to her estranged sister in San Francisco utterly ruined. As Jasmine struggles with her haunting memories of a privileged past bearing dark realities she ignored, she tries to recover in her present. Unfortunately, it all proves a losing battle as Jasmine's narcissistic hangups and their consequences begin to overwhelm her. In doing so, her old pretensions and new deceits begin to foul up everyone's lives, especially her own. Written by Kenneth Chisholm (kchishol@rogers.com)	98 min	http://ia.media-imdb.com/images/M/MV5BMTc0ODk5MzEyMV5BMl5BanBnXkFtZTcwMzI0MDY1OQ@@._V1_SX214_.jpg	23 August 2013 (USA)	7.70000000000000018	Blue Jasmine	\N
242	An artist meets a mysterious and wealthy benefactor and their relationship is not what it appears to be.	85 min	http://ia.media-imdb.com/images/M/MV5BMTQwNTU1MjI3NF5BMl5BanBnXkFtZTcwODk2MDk3OQ@@._V1_SX214_.jpg	23 July 2013 (USA)	5.09999999999999964	The Time Being	\N
243	When four best friends try and move forward in their work and personal life, they realize that trying to live their life's dream is more difficult than they imagine -- especially in the high fashion world of Shanghai.	116 min	http://ia.media-imdb.com/images/M/MV5BMjA1NjQyNTIzNF5BMl5BanBnXkFtZTcwMjQzMzg4OQ@@._V1_SY317_CR6,0,214,317_.jpg	27 June 2013 (China)	2.70000000000000018	Tiny Times 1.0	\N
244	After losing control of his car and crashing into a local restaurant, a man loses consciousness on the street. Later, while working on a case, the police's anti-drug division captain, Zhang Lei (Honglei Sun), realizes that the man in the crash is drug lord Tian Ming (Louis Koo). In order to avoid the death penalty, Tian Ming helps the police put a stop to the entire drug trafficking circuit, but just as soon as the police are ready to make a large bust, Tian Ming makes a decision that shocks everyone involved. Written by Anonymous	107 min	http://ia.media-imdb.com/images/M/MV5BMjI3MDE4MjYxNl5BMl5BanBnXkFtZTcwNzIwODA4OQ@@._V1_SX214_.jpg	4 April 2013 (China)	7	Drug War	\N
245	Sara, a college student who was slandered by a classmate, finds herself framed for murder by Alex, who initially proposed the perfect, untraceable crime.	83 min	http://ia.media-imdb.com/images/M/MV5BODcwNTUxNTkwNl5BMl5BanBnXkFtZTcwNjQ3ODY4OQ@@._V1_SY317_CR2,0,214,317_.jpg	26 July 2013 (USA)	4.70000000000000018	Breaking the Girls	\N
246	Robert Trench, an undercover DEA agent, takes advantage of gunman Michael Stigman's idea to rob a bank to bust him and a mob boss. However, it proves too successful with much more money seized than anticipated with Trench's forces not stopping the getaway. Complicating things still more, Stigman turns out to be a Naval Intelligence agent who shoots Trench and takes the money. The interservice debacle suddenly finds Trench and Stigman in a bloody web of corrupt clandestine rivalries as they are hunted, blackmailed and isolated for the money on both sides of the law. Now, the fugitives must work together to find a way out of this situation with no one to turn to but themselves. Written by Kenneth Chisholm (kchishol@rogers.com)	109 min	http://ia.media-imdb.com/images/M/MV5BNTQ5MTgzNDg4OF5BMl5BanBnXkFtZTcwMjAyODEzOQ@@._V1_SX214_.jpg	2 August 2013 (USA)	6.90000000000000036	2 Guns	\N
330	A coming-of-age story about two inner city boys who are left to fend for themselves over the summer after their mothers are taken away by the authorities.	108 min	http://ia.media-imdb.com/images/M/MV5BMTUwMjgyNTE2OV5BMl5BanBnXkFtZTgwNzU1MzgwMDE@._V1_SY317_CR0,0,214,317_.jpg	25 January 2013 (USA)	5.90000000000000036	The Inevitable Defeat of Mister & Pete	\N
247	The evil wizard Gargamel creates a couple of mischievous Smurf-like creatures called the Naughties that he hopes will let him harness the all-powerful, magical Smurf-essence. But when he discovers that only a real Smurf can give him what he wants, and only a secret spell that Smurfette knows can turn the Naughties into real Smurfs, Gargamel kidnaps Smurfette and brings her to Paris, where he has been winning the adoration of millions as the world¹s greatest sorcerer. It's up to Papa, Clumsy, Grouchy, and Vanity to return to our world, reunite with their human friends Patrick and Grace Winslow, and rescue her! Will Smurfette, who has always felt different from the other Smurfs, find a new connection with the Naughties Vexy and Hackus or will the Smurfs convince her that their love for her is True Blue? Written by Columbia Pictures	105 min	http://ia.media-imdb.com/images/M/MV5BMTkyNDUxODg3MV5BMl5BanBnXkFtZTcwNjE5OTY2OQ@@._V1_SX214_.jpg	31 July 2013 (USA)	5	The Smurfs 2	\N
248	Sutter Keely lives in the now. It's a good place for him. A high school senior, charming and self-possessed, he's the life of the party, loves his job at a men's clothing store, and has no plans for the future. A budding alcoholic, he's never far from his supersized, whiskey-fortified thirst-master cup. But after being dumped by his girlfriend, Sutter gets drunk and wakes up on a lawn with Aimee Finecky hovering over him. She's different: the "nice girl" who reads science fiction and doesn't have a boyfriend. While Amy has dreams of a future, Sutter lives in the impressive delusion of a spectacular now, yet somehow, they're drawn together. Written by Production	95 min	http://ia.media-imdb.com/images/M/MV5BMjA5MTc0NTkzM15BMl5BanBnXkFtZTcwODEwNjE3OQ@@._V1_SY317_CR0,0,214,317_.jpg	13 September 2013 (USA)	7.70000000000000018	The Spectacular Now	\N
249	When Christian, an LA trust-fund kid with casual ties to Hollywood, learns of a secret affair between Tara and the lead of his film project, Ryan, he spirals out of control, and his cruel mind games escalate into an act of bloody violence.	99 min	http://ia.media-imdb.com/images/M/MV5BMTkyMjk5NDA0OF5BMl5BanBnXkFtZTgwODEwNjU0MDE@._V1_SY317_CR4,0,214,317_.jpg	2 August 2013 (USA)	4.09999999999999964	The Canyons	\N
250	An international crew of astronauts undertakes a privately funded mission to search for life on Jupiter's fourth largest moon.	90 min	http://ia.media-imdb.com/images/M/MV5BMjA2OTk5ODkxMl5BMl5BanBnXkFtZTcwODc4MDk0OQ@@._V1_SY317_CR4,0,214,317_.jpg	27 June 2013 (USA)	6.5	Europa Report	\N
251	In the 70s two brothers battle killer waves, conservative society and ruthless bikers to kick-start the modern surf industry.		http://ia.media-imdb.com/images/M/MV5BMTYzNzMxNjg0Ml5BMl5BanBnXkFtZTcwOTM0OTU5OQ@@._V1_SY317_CR4,0,214,317_.jpg	2 July 2013 (USA)	5.79999999999999982	Drift	\N
252	In the year 2154, two classes of people exist: the very wealthy, who live on a pristine man-made space station called Elysium, and the rest, who live on an overpopulated, ruined Earth. Secretary Delacourt, a government official, will stop at nothing to enforce anti-immigration laws and preserve the luxurious lifestyle of the citizens of Elysium. That doesn't stop the people of Earth from trying to get in by any means they can. When unlucky Max is backed into a corner, he agrees to take on a daunting mission that, if successful, will not only save his life but could bring equality to these polarized worlds. Written by Production	109 min	http://ia.media-imdb.com/images/M/MV5BNDc2NjU0MTcwNV5BMl5BanBnXkFtZTcwMjg4MDg2OQ@@._V1_SX214_.jpg	9 August 2013 (USA)	6.90000000000000036	Elysium	\N
253	In this retelling of Rick Riordans book, "The Sea of Monsters", Percy Jackson, accompanied by his friends Annabeth Chase, Clarisse La Rue and Tyson, his half brother, goes on a journey to the Sea of Monsters to retrieve the Golden Fleece and save Camp Half-Blood. Written by Michelle Stone	106 min	http://ia.media-imdb.com/images/M/MV5BMTUwODUyODI0Nl5BMl5BanBnXkFtZTcwNzAxODY2OQ@@._V1_SX214_.jpg	7 August 2013 (USA)	6.20000000000000018	Percy Jackson: Sea of Monsters	\N
254	After being robbed of a week's take, small-time pot dealer David is forced by his boss to go to Mexico to pick up a load of marijuana. In order to improve his odds of making it past the border, David asks the broke stripper Rose and two local teenagers to join him and pretend they're on a family holiday. Written by Peter Brandt Nielsen	110 min	http://ia.media-imdb.com/images/M/MV5BMjA5Njc0NDUxNV5BMl5BanBnXkFtZTcwMjYzNzU1OQ@@._V1_SY317_CR0,0,214,317_.jpg	7 August 2013 (USA)	7.09999999999999964	We're the Millers	\N
255	Dusty Crophopper is a little cropduster plane with a fear of heights and a crazy dream of being a racer. While his friends need convincing, Dusty gets the training he needs from Skipper, a veteran fighter, and qualifies for the Wings Across the World race. In the event, Dusty finds competitors who soon learn that there is something special about this underdog as he is tested to his physical and emotional limits. In doing so, Dusty soon finds enemies, and more importantly friends, who are inspired by his dream. In the face of all obstacles, the winner of this air race will be anyone's guess. Written by Kenneth Chisholm (kchishol@rogers.com)	91 min	http://ia.media-imdb.com/images/M/MV5BMjAwODc5NzYzOF5BMl5BanBnXkFtZTcwNTk4MjEzOQ@@._V1_SX214_.jpg	9 August 2013 (USA)	5.40000000000000036	Planes	\N
256	Two highway road workers spend the summer of 1988 away from their city lives. The isolated landscape becomes a place of misadventure as the men find themselves at odds with each other and the women they left behind.	94 min	http://ia.media-imdb.com/images/M/MV5BMTQzMzMwNDExMV5BMl5BanBnXkFtZTcwMzE5MjU3OQ@@._V1_SX214_.jpg	19 September 2013 (Netherlands)	6.40000000000000036	Prince Avalanche	\N
257	Rahul embarks on a journey to a small town in Tamil Nadu to fulfill the last wish of his grandfather: to have his ashes immersed in the Holy water of Rameshwaram. En route, he meets a woman hailing from a unique family down South. As they find love through this journey in the exuberant lands of South India, an unanticipated drive awaits them. Written by UTV Motion Pictures	141 min	http://ia.media-imdb.com/images/M/MV5BMjE2OTEyOTA3OV5BMl5BanBnXkFtZTcwNjI4MDk3OQ@@._V1_SY317_CR2,0,214,317_.jpg	8 August 2013 (USA)	6.09999999999999964	Chennai Express	\N
258	The story of Linda Lovelace, who is used and abused by the porn industry at the behest of her coercive husband, before taking control of her life.	93 min	http://ia.media-imdb.com/images/M/MV5BOTM0Mzc2MjgyN15BMl5BanBnXkFtZTcwOTIzNDQ4OQ@@._V1_SX214_.jpg	14 November 2013 (Portugal)	6.09999999999999964	Lovelace	\N
259	An underachieving vocal coach is motivated by her father, the king of movie-trailer voice-overs, to pursue her aspirations of becoming a voiceover star. Amidst pride, sexism and family dysfunction, she sets out to change the voice of a generation. Written by Anonymous	93 min	http://ia.media-imdb.com/images/M/MV5BMTU0NzE0Mzg3M15BMl5BanBnXkFtZTcwNzY2MDY3OQ@@._V1_SX214_.jpg	13 September 2013 (UK)	7.29999999999999982	In a World...	\N
260	Newlywed couple Nat and Josh are deliriously happy despite their differences, though friends and family aren't convinced that they can last. With their first anniversary approaching and attractive alternatives in the mix, can they last?	97 min	http://ia.media-imdb.com/images/M/MV5BMTg5NDk4MTUwNl5BMl5BanBnXkFtZTcwMDU5MTc4OQ@@._V1_SY317_CR4,0,214,317_.jpg	4 April 2013 (Portugal)	5.70000000000000018	I Give It a Year	\N
262	After Kick-Ass' insane bravery inspires a new wave of self-made masked crusaders, led by the badass Colonel Stars and Stripes, our hero joins them on patrol. When these amateur superheroes are hunted down by Red Mist -- reborn as The Mother F%&*^r -- only the blade-wielding Hit Girl can prevent their annihilation. When we last saw junior assassin Hit Girl and young vigilante Kick-Ass, they were trying to live as normal teenagers Mindy and Dave. With graduation looming and uncertain what to do, Dave decides to start the world's first superhero team with Mindy. Unfortunately, when Mindy is busted for sneaking out as Hit Girl, she's forced to retire-leaving her to navigate the terrifying world of high-school mean girls on her own. With no one left to turn to, Dave joins forces with Justice Forever, run by a born-again ex-mobster named Colonel Stars and Stripes. Just as they start to make a real difference on the streets, the world's first super villain, The Mother F%&*^r, assembles his ... Written by Universal Pictures	103 min	http://ia.media-imdb.com/images/M/MV5BMTQ4OTQxNzc0N15BMl5BanBnXkFtZTcwOTQxOTU5OQ@@._V1_SY317_CR2,0,214,317_.jpg	16 August 2013 (USA)	6.90000000000000036	Kick-Ass 2	\N
263	Cecil Gaines was a sharecropper's son who grew up in the 1920s as a domestic servant for the white family who casually destroyed his. Eventually striking out on his own, Cecil becomes a hotel valet of such efficiency and discreteness in the 1950s that he becomes a butler in the White House itself. There, Cecil would serve numerous US Presidents over the decades as a passive witness of history with the American Civil Rights Movement gaining momentum even as his family has troubles of its own. As his wife, Gloria, struggles with her addictions and his defiant eldest son, Louis, strives for a just world, Cecil must decide whether he should take action in his own way. Written by Kenneth Chisholm (kchishol@rogers.com)	132 min	http://ia.media-imdb.com/images/M/MV5BMjM2NDY3MjkyMF5BMl5BanBnXkFtZTcwMDM5Nzg5OQ@@._V1_SX214_.jpg	16 August 2013 (USA)	6.70000000000000018	Lee Daniels' The Butler	\N
264	The high stakes thriller Paranoia takes us deep behind the scenes of global success to a deadly world of greed and deception. The two most powerful tech billionaires in the world (Harrison Ford and Gary Oldman) are bitter rivals with a complicated past who will stop at nothing to destroy each other. A young superstar (Liam Hemsworth), seduced by unlimited wealth and power falls between them, and becomes trapped in the middle of the twists and turns of their life-and-death game of corporate espionage. By the time he realizes his life is in danger, he is in far too deep and knows far too much for them to let him walk away. Written by Relativity Media	106 min	http://ia.media-imdb.com/images/M/MV5BMTUyNjYwMTYwM15BMl5BanBnXkFtZTcwNDA4NTc2OQ@@._V1_SX214_.jpg	16 August 2013 (USA)	5	Paranoia	\N
265	The story of Steve Jobs' ascension from college dropout into one of the most revered creative entrepreneurs of the 20th century.	128 min	http://ia.media-imdb.com/images/M/MV5BMTM5NTQ3MTYxN15BMl5BanBnXkFtZTcwODE2Nzk3OQ@@._V1_SX214_.jpg	16 August 2013 (USA)	5.70000000000000018	Jobs	\N
266	The tale of an outlaw who escapes from prison and sets out across the Texas hills to reunite with his wife and the daughter he has never met.	96 min	http://ia.media-imdb.com/images/M/MV5BMjg2MjI1OTU2M15BMl5BanBnXkFtZTcwODc3MzM5OQ@@._V1_SY317_CR2,0,214,317_.jpg	16 August 2013 (USA)	6.70000000000000018	Ain't Them Bodies Saints	\N
267	Austenland is a romantic comedy about 30-something, single Jane Hayes, a seemingly normal young woman with a secret: her obsession with Mr. Darcy-as played by Colin Firth in the BBC adaptation of Pride and Prejudice-is ruining her love life; no real man can compare. But when she decides to spend her life savings on a trip to an English resort catering to Austen-crazed women, Jane's fantasies of meeting the perfect Regency-era gentleman suddenly become more real than she ever could have imagined. Written by Anonymous	97 min	http://ia.media-imdb.com/images/M/MV5BMjE2MTUzMjgyNF5BMl5BanBnXkFtZTcwNjY4NDM4OQ@@._V1_SX214_.jpg	27 September 2013 (UK)	5.79999999999999982	Austenland	\N
268	This candid New York love story explores the chaotic 40-year marriage of famed boxing painter Ushio Shinohara and his wife, Noriko. Anxious to shed her role as her overbearing husband's assistant, Noriko finds an identity of her own.	82 min	http://ia.media-imdb.com/images/M/MV5BMjEyNzgyMjUzNl5BMl5BanBnXkFtZTcwODk3NjQyOQ@@._V1_SY317_CR0,0,214,317_.jpg	1 November 2013 (UK)	6.79999999999999982	Cutie and the Boxer	\N
269	Set in contemporary New York City, a seemingly ordinary teenager, Clary Fray (Lily Collins), discovers she is the descendant of a line of Shadowhunters, a secret cadre of young half-angel warriors locked in an ancient battle to protect our world from demons. After the disappearance of her mother (Lena Headey), Clary must join forces with a group of Shadowhunters, who introduce her to a dangerous alternate New York called Downworld, filled with demons, warlocks, vampires, werewolves and other deadly creatures. Based on the worldwide best-selling book series. Written by Sony Pictures Entertainment	130 min	http://ia.media-imdb.com/images/M/MV5BMTc5NzAyOTQyNF5BMl5BanBnXkFtZTcwNzQ1MDc4OQ@@._V1_SX214_.jpg	21 August 2013 (USA)	6	The Mortal Instruments: City of Bones	\N
270	20 years after attempting an epic pub crawl, five childhood friends reunite when one of them becomes hell bent on trying the drinking marathon again. They are convinced to stage an encore by mate Gary King, a 40-year old man trapped at the cigarette end of his teens, who drags his reluctant pals to their home town and once again attempts to reach the fabled pub, The World's End. As they attempt to reconcile the past and present, they realize the real struggle is for the future, not just theirs but humankind's. Reaching The World's End is the least of their worries. Written by Production	109 min	http://ia.media-imdb.com/images/M/MV5BNzA1MTk1MzY0OV5BMl5BanBnXkFtZTgwNjkzNTUwMDE@._V1_SX214_.jpg	23 August 2013 (USA)	7.29999999999999982	The World's End	\N
271	When a gang of masked, ax-wielding murderers descend upon the Davison family reunion, the hapless victims seem trapped... until an unlikely guest of the family proves to be the most talented killer of all. Written by Lionsgate	95 min	http://ia.media-imdb.com/images/M/MV5BMTQwODAxMTE1NF5BMl5BanBnXkFtZTcwNTQ0MjY3OQ@@._V1_SX214_.jpg	23 August 2013 (USA)	6.79999999999999982	You're Next	\N
272	Ip Man's peaceful life in Foshan changes after Gong Yutian seeks an heir for his family in Southern China. Ip Man then meets Gong Er who challenges him for the sake of regaining her family's honor. After the Second Sino-Japanese War, Ip Man moves to Hong Kong and struggles to provide for his family. In the mean time, Gong Er chooses the path of vengeance after her father was killed by Ma San. Written by Immanuel Ambhara	108 min	http://ia.media-imdb.com/images/M/MV5BMTQ0OTY2NTU2MF5BMl5BanBnXkFtZTcwNTEyMjY2OQ@@._V1_SX214_.jpg	30 August 2013 (USA)	6.59999999999999964	The Grandmaster	\N
273	Luke and Kate are co-workers at a Chicago brewery, where they spend their days drinking and flirting. They're perfect for each other, except that they're both in relationships. Luke is in the midst of marriage talks with his girlfriend of six years, Kate is playing it cool with her music producer boyfriend Chris. But you know what makes the line between "friends" and "more than friends" really blurry? Beer. Written by Anonymous	90 min	http://ia.media-imdb.com/images/M/MV5BMjMwNDU1NzMzM15BMl5BanBnXkFtZTcwNTY3ODk1OQ@@._V1_SX214_.jpg	25 July 2013 (USA)	6.20000000000000018	Drinking Buddies	\N
276	An intimate all-access look at life on the road for the global music phenomenon. Weaved with stunning live concert footage, this inspiring feature film tells the remarkable story of Niall, Zayn, Liam, Harry and Louis' meteoric rise to fame, from their humble hometown beginnings and competing on the X-Factor, to conquering the world and performing at London's famed O2 Arena. Hear it from the boys themselves and see through their own eyes what it's really like to be One Direction. Written by Sony Pictures Entertainment	92 min	http://ia.media-imdb.com/images/M/MV5BMTk5NTIxNzg3Nl5BMl5BanBnXkFtZTcwMzc5MDE0OQ@@._V1_SX214_.jpg	30 August 2013 (USA)	3.29999999999999982	One Direction: This Is Us	\N
277	Getaway is the gritty, exciting action thriller from Warner Brothers in which former race car driver Brent Magna is pitted against the clock as he commandeers a custom Shelby Super Snake Mustang, taking it and its unwitting owner on a high-speed adventure at the command of a mysterious villain on a race against time to save the life of his kidnapped wife. Written by anonymous	90 min	http://ia.media-imdb.com/images/M/MV5BMTM5NTkzNzk0NF5BMl5BanBnXkFtZTcwMTQwNjE5OQ@@._V1_SY317_CR0,0,214,317_.jpg	30 August 2013 (USA)	4	Getaway	\N
278	A high-profile terrorism case unexpectedly binds together two ex-lovers on the defense team - testing the limits of their loyalties and placing their lives in jeopardy.	96 min	http://ia.media-imdb.com/images/M/MV5BMjc3MTU2MzI2Ml5BMl5BanBnXkFtZTcwMzI3ODI2OQ@@._V1_SX214_.jpg	28 August 2013 (USA)	5.79999999999999982	Closed Circuit	\N
279	The rivalry between the manipulative boss of an advertising agency and her talented protégée escalates from stealing credit to public humiliation to murder.	102 min	http://ia.media-imdb.com/images/M/MV5BMjMwOTg4NjQ0MV5BMl5BanBnXkFtZTcwMTkzMDg2OQ@@._V1_SX214_.jpg	11 July 2013 (Portugal)	5.40000000000000036	Paixão	\N
280	Valentin is Acapulco's resident playboy, until a former fling leaves a baby on his doorstep and takes off without a trace. Leaving Mexico for Los Angeles to find the baby's mother, Valentin ends up finding a new home for himself and his newfound daughter, Maggie. An unlikely father figure, Valentin raises Maggie for six years, while also establishing himself as one of Hollywood's top stuntmen to pay the bills, with Maggie acting as his on-set coach. As Valentin raises Maggie, she forces him to grow up too. But their unique and offbeat family is threatened when Maggie's birth mom shows up out of the blue, and Valentin realizes he's in danger of losing his daughter - and his best friend. Written by Pantaleon Films	122 min	http://ia.media-imdb.com/images/M/MV5BMTUyNjI3ODI0N15BMl5BanBnXkFtZTcwMTQ1NTY5OQ@@._V1_SX214_.jpg	6 September 2013 (USA)	7.20000000000000018	Instructions Not Included	\N
281	A former valedictorian quits her reporter job in New York and returns to the place she last felt happy: her childhood home in Connecticut. She gets work as a lifeguard and starts a dangerous relationship with a troubled teenager.	98 min	http://ia.media-imdb.com/images/M/MV5BMjExOTI5MjY3Ml5BMl5BanBnXkFtZTcwMjU2NDk3OQ@@._V1_SX214_.jpg	19 January 2013 (USA)	5.5	The Lifeguard	\N
282	Armed with nothing more than twigs, their imaginations and a simple set of rules, a group of 12-year-olds engaged in a lively game of Capture the Flag in the neighborhood woods start dangerously blurring the lines between make-believe and reality. Paint-filled balloons = Grenades. Trees = Control towers. Sticks = Sub-machine guns. The youthful innocence of the game gradually takes on a different tone as the quest for victory pushes the boundaries of friendship. The would-be warriors get a searing glimpse of humanity's dark side as their combat scenario takes them beyond the rules of the game and into an adventure where fantasy combat clashes with the real world. Written by Anonymous	94 min	http://ia.media-imdb.com/images/M/MV5BOTg4NTQyODIyM15BMl5BanBnXkFtZTcwMjI1OTQ4OQ@@._V1_SY317_CR0,0,214,317_.jpg	15 April 2012 (USA)	5.90000000000000036	I Declare War	\N
283	Betrayed by his own kind and left for dead on a desolate planet, Riddick fights for survival against alien predators and becomes more powerful and dangerous than ever before. Soon bounty hunters from throughout the galaxy descend on Riddick only to find themselves pawns in his greater scheme for revenge. With his enemies right where he wants them, Riddick unleashes a vicious attack of vengeance before returning to his home planet of Furya to save it from destruction. Written by Shock Till You Drop	119 min	http://ia.media-imdb.com/images/M/MV5BMTk5NzYwMzQ4MV5BMl5BanBnXkFtZTcwMjE5MTI1OQ@@._V1_SX214_.jpg	6 September 2013 (USA)	6.70000000000000018	Riddick	\N
284	An unprecedented look inside the private world of J.D. Salinger, the reclusive author of The Catcher in the Rye.	120 min	http://ia.media-imdb.com/images/M/MV5BMTQ1MjM4NTMyMl5BMl5BanBnXkFtZTcwNzE3MDkzOQ@@._V1_SX214_.jpg	5 September 2013 (Australia)	5.79999999999999982	Salinger	\N
285	What happens when three young people in today's changing India try to figure out what love, attraction and commitment mean to each of them? Raghu (Shushant Singh Rajput) needs a woman in his life -the rest he's going to figure out along the way. Gayatri (Parineeti Chopra) has been around the block a few times and knows the scene, warts and all. Tara (Vaani Kapoor) knows what's right for her, but a little experimenting never did hurt anybody, did it? When their lives crisscross, their beliefs get challenged, and their loves, tested. We all want it all...the love, the sex, the relationship, the commitment. But when we get it, it may not be in the way we recognize. Written by Yash Raj Films	141 min	http://ia.media-imdb.com/images/M/MV5BMTU0NjI2MTI0Ml5BMl5BanBnXkFtZTcwNjI4MzY5OQ@@._V1_SY317_CR8,0,214,317_.jpg	6 September 2013 (India)	5.90000000000000036	Shuddh Desi Romance	\N
286	Jason Stevens survived the journey his grandfather Red Stevens sent him through for "the Ultimate Gift". Now...That gift which includes managing a Billion dollar foundation is being challenged by his own family. In a courtroom battle...his assets are seized...his love interest with Alexia gets complicated...Jason could lose it all...He is now on a quest to discover what it truly means to fulfill his destiny...And Live. Written by Anonymous		http://ia.media-imdb.com/images/M/MV5BMjI5ODU3NjQyNl5BMl5BanBnXkFtZTcwNDA2NTU3OQ@@._V1_SX214_.jpg	6 September 2013 (USA)	3.70000000000000018	The Ultimate Life	\N
287	A massage therapist is unable to do her job when stricken with a mysterious and sudden aversion to bodily contact. Meanwhile, her uptight brother's floundering dental practice receives new life when clients seek out his healing touch.	89 min	http://ia.media-imdb.com/images/M/MV5BNjc1NjIyMzk5M15BMl5BanBnXkFtZTcwMDk2NjE3OQ@@._V1_SX214_.jpg	19 January 2013 (USA)	4.90000000000000036	Touchy Feely	\N
301	A divorced and single parent, Eva (Julia Louis-Dreyfus) spends her days enjoying work as a masseuse but dreading her daughter's impending departure for college. She meets Albert (James Gandolfini) - a sweet, funny and like-minded man also facing an empty nest. As their romance quickly blossoms, Eva befriends Marianne (Catherine Keener), her new massage client. Marianne is a beautiful poet who seems "almost perfect" except for one prominent quality: she rags on her ex-husband way too much. Suddenly, Eva finds herself doubting her own relationship with Albert as she learns the truth about Marianne's ex. Written by ID-PR	93 min	http://ia.media-imdb.com/images/M/MV5BMjI2MjIwMDk2Ml5BMl5BanBnXkFtZTcwNTQ1MzQ5OQ@@._V1_SX214_.jpg	11 October 2013 (USA)	7.5	Enough Said	\N
288	Spring, 1958. 21-year-old Rose Pamphyle lives with her grouchy widower father who runs the village store. Engaged to the son of the local mechanic, she seems destined for the quiet, drudgery-filled life of a housewife. But that's not the life Rose longs for. When she travels to Lisieux in Normandy, where charismatic insurance agency boss Louis Echard is advertising for a secretary, the ensuing interview is a disaster. But Rose reveals a special gift - she can type at extraordinary speed. Unwittingly, the young woman awakens the dormant sports fan in Louis. If she wants the job she'll have to compete in a speed typing competition. Whatever sacrifices Rose must make to reach the top, Louis declares himself her trainer. He'll turn her into the fastest girl not only in the country, but in the world! But a love of sport doesn't always mix well with love itself ... Written by The Weinstein Company	111 min	http://ia.media-imdb.com/images/M/MV5BMjA2NzY4MDExOV5BMl5BanBnXkFtZTcwNTE4NzQzOQ@@._V1_SY317_CR0,0,214,317_.jpg	27 June 2013 (Portugal)	6.70000000000000018	A Datilógrafa	\N
289	'Good Ol' Freda' tells the story of Freda Kelly, a shy Liverpudlian teenager asked to work for a young local band hoping to make it big: the Beatles. As the Beatles' fame multiplies, Freda bears witness to music and cultural history but never exploits her insider access. Their loyal secretary from beginning to end, Freda finally tells her tales for the first time in 50 years. Written by Anonymous	86 min	http://ia.media-imdb.com/images/M/MV5BMjIwMjU3MzUxM15BMl5BanBnXkFtZTcwNzE1NDQ4OQ@@._V1_SY317_CR0,0,214,317_.jpg	6 September 2013 (USA)	6.20000000000000018	Good Ol' Freda	\N
290	The haunted Lambert family seeks to uncover the mysterious childhood secret that has left them dangerously connected to the spirit world.	106 min	http://ia.media-imdb.com/images/M/MV5BMTg0OTA5ODIxNF5BMl5BanBnXkFtZTcwNTUzNDg4OQ@@._V1_SX214_.jpg	13 September 2013 (USA)	7	Insidious: Chapter 2	\N
291	A mafia boss and his family are relocated to a sleepy town in France under the witness protection program after snitching on the mob. Despite the best efforts of CIA Agent Stansfield (Tommy Lee Jones) to keep them in line, Fred Manzoni (Robert De Niro), his wife Maggie (Michelle Pfeiffer) and their children Belle (Dianna Agron) and Warren (John D'Leo) can't help but revert to old habits and blow their cover by handling their problems the "family" way, enabling their former mafia cronies to track them down. Chaos ensues as old scores are settled in the unlikeliest of settings in this darkly funny film by Luc Besson (Taken, Transporter). Written by Minoesch	111 min	http://ia.media-imdb.com/images/M/MV5BMjE2MzI0MzkyNV5BMl5BanBnXkFtZTcwMjQ2MDM2OQ@@._V1_SX214_.jpg	13 September 2013 (USA)	6.40000000000000036	The Family	\N
292	Meet, Prem, and Amar look to have a blast at their college reunion, though they soon find themselves in another predicament.	137 min	http://ia.media-imdb.com/images/M/MV5BMTQwOTc3MjM5N15BMl5BanBnXkFtZTgwMjcxODEyMDE@._V1_SX214_.jpg	13 September 2013 (USA)	4.20000000000000018	Grand Masti	\N
293	WADJDA is a 10-year-old girl living in a suburb of Riyadh, the capital of Saudi Arabia. Although she lives in a conservative world, Wadjda is fun loving, entrepreneurial and always pushing the boundaries of what she can get away with. After a fight with her friend Abdullah, a neighborhood boy she shouldn't be playing with, Wadjda sees a beautiful green bicycle for sale. She wants the bicycle desperately so that she can beat Abdullah in a race. But Wadjda's mother won't allow it, fearing repercussions from a society that sees bicycles as dangerous to a girl's virtue. So Wadjda decides to try and raise the money herself. At first, Wadjda's mother is too preoccupied with convincing her husband not to take a second wife to realize what's going on. And soon enough Wadjda's plans are thwarted when she is caught running various schemes at school. Just as she is losing hope of raising enough money, she hears of a cash prize for a Koran recitation competition at her school. She devotes herself... Written by Razor Film Produktion GmbH	98 min	http://ia.media-imdb.com/images/M/MV5BMjI4MzMyNzM2Ml5BMl5BanBnXkFtZTgwNDQ5MDgwMDE@._V1_SX214_.jpg	5 September 2013 (Germany)	7.79999999999999982	Wadjda	\N
294	An abandoned boy is lured to America and drawn into the shadow of a dangerous father figure. Inspired by the real life events that led to the 2002 Beltway sniper attacks.	93 min	http://ia.media-imdb.com/images/M/MV5BNzYwMTcyMzU5OV5BMl5BanBnXkFtZTgwOTAwOTUwMDE@._V1_SY317_CR0,0,214,317_.jpg	19 January 2013 (USA)	6.09999999999999964	Blue Caprice	\N
295	A follow up to award winning documentary 'Herb & Dorothy', the film captures the ordinary couple's extraordinary gift of art to the nation as they close the door on their life as collectors. When Herb and Dorothy Vogel, a retired postal clerk and librarian, began collecting works of contemporary art in the 1960s, they never imagined it would outgrow their one bedroom Manhattan apartment and spread throughout America. 50 years later, the collection is nearly 5,000 pieces and worth millions. Refusing to sell, the couple launches an unprecedented gift project giving artworks to one museum in all 50 states. The film journeys around the country with the Vogels, meeting artists who are famous or unknown, often controversial, striking today's society with questions about art and its survival. Written by Anonymous	87 min	http://ia.media-imdb.com/images/M/MV5BMTM5MjYyMzQzMl5BMl5BanBnXkFtZTgwNDA4MDEwMDE@._V1_SX214_.jpg	13 September 2013 (USA)	5.29999999999999982	Herb & Dorothy 50X50	\N
296	A documentary on radical left-wing activist turned FBI informant, Brandon Darby.	81 min	http://ia.media-imdb.com/images/M/MV5BNzYxMzM2ODQ0N15BMl5BanBnXkFtZTgwNDMzMjExMDE@._V1_SX214_.jpg	13 September 2013 (USA)	5.20000000000000018	Informant	\N
297	A documentary focused on former Vogue Paris editor-in-chief and fashion stylist Carine Roitfeld as she moves to New York to launch her own magazine.	93 min	http://ia.media-imdb.com/images/M/MV5BMTg0MDc4NTQ5OV5BMl5BanBnXkFtZTgwODcyNjYwMDE@._V1_SY317_CR2,0,214,317_.jpg	11 September 2013 (USA)	5.29999999999999982	Mademoiselle C	\N
298	A young man in the 1940s raises a family in Alabama after his wife leaves him for an Englishman and moves to England. When the wife dies, she leaves a request to be brought back to Alabama to be buried, and at that point the man hasn't seen her in nearly 30 years. The two families - her original family she abandoned and her English family - meet and make an attempt to adjust to each other, with uneven results. Written by alfiehitchie	122 min	http://ia.media-imdb.com/images/M/MV5BNTcxMzMxNTEyMF5BMl5BanBnXkFtZTcwODIxNjg5OQ@@._V1_SX214_.jpg	20 August 2013 (USA)	6	Jayne Mansfield's Car	\N
299	How far would you go to protect your family? Keller Dover is facing every parent's worst nightmare. His six-year-old daughter, Anna, is missing, together with her young friend, Joy, and as minutes turn to hours, panic sets in. The only lead is a dilapidated RV that had earlier been parked on their street. Heading the investigation, Detective Loki arrests its driver, Alex Jones, but a lack of evidence forces his release. As the police pursue multiple leads and pressure mounts, knowing his child's life is at stake the frantic Dover decides he has no choice but to take matters into his own hands. But just how far will this desperate father go to protect his family? Written by Warner Bros. Pictures	153 min	http://ia.media-imdb.com/images/M/MV5BMTg0NTIzMjQ1NV5BMl5BanBnXkFtZTcwNDc3MzM5OQ@@._V1_SY317_CR0,0,214,317_.jpg	20 September 2013 (USA)	8.09999999999999964	Prisoners	\N
305	In this charming film based on the popular L. Frank Baum stories, Dorothy and her dog Toto are caught in a tornado's path and somehow end up in the land of Oz. Here she meets some memorable friends and foes in her journey to meet the Wizard of Oz who everyone says can help her return home and possibly grant her new friends their goals of a brain, heart and courage. Written by Dale Roloff	102 min	http://ia.media-imdb.com/images/M/MV5BMTU0MTA2OTIwNF5BMl5BanBnXkFtZTcwMzA0Njk3OA@@._V1_SY317_CR10,0,214,317_.jpg	25 August 1939 (USA)	8.09999999999999964	The Wizard of Oz	\N
306	Set against the sexy, glamorous golden age of Formula 1 racing in the 1970s, the film is based on the true story of a great sporting rivalry between handsome English playboy James Hunt (Hemsworth), and his methodical, brilliant opponent, Austrian driver Niki Lauda (Bruhl). The story follows their distinctly different personal styles on and off the track, their loves and the astonishing 1976 season in which both drivers were willing to risk everything to become world champion in a sport with no margin for error: if you make a mistake, you die. Written by P. Morgan	123 min	http://ia.media-imdb.com/images/M/MV5BMTQyMDE0MTY0OV5BMl5BanBnXkFtZTcwMjI2OTI0OQ@@._V1_SX214_.jpg	27 September 2013 (USA)	8.30000000000000071	Rush	\N
307	After the disastrous food storm in the first film, Flint and his friends are forced to leave the town. Flint accepts the invitation from his idol Chester V to join The Live Corp Company, which has been tasked to clean the island, and where the best inventors in the world create technologies for the betterment of mankind. When Flint discovers that his machine still operates and now creates mutant food beasts like living pickles, hungry tacodiles, shrimpanzees and apple pie-thons, he and his friends must return to save the world. Written by Reese Sara Eversting	95 min	http://ia.media-imdb.com/images/M/MV5BMTYzNDM0MDI1NF5BMl5BanBnXkFtZTcwNzQ5NzYxOQ@@._V1_SX214_.jpg	27 September 2013 (USA)	6.5	Cloudy with a Chance of Meatballs 2	\N
308	Determined to get engaged before her youngest sister's wedding, flight attendant Montana Moore (Paula Patton) finds herself with only 30 days to find Mr. Right. Using her airline connections to "accidentally" meet up with eligible ex-boyfriends and scour for potential candidates, she racks up more than 30,000 miles and countless comedic encounters, all the while searching for the perfect guy. Written by Fox Searchlight	96 min	http://ia.media-imdb.com/images/M/MV5BMjIyNDU4NTY3M15BMl5BanBnXkFtZTcwOTA3MDA1OQ@@._V1_SX214_.jpg	27 September 2013 (USA)	3.79999999999999982	Baggage Claim	\N
309	Jon Martello objectifies everything in his life: his apartment, his car, his family, his church, and, of course, women. His buddies even call him Don Jon because of his ability to pull "10s" every weekend without fail. Yet even the finest flings don't compare to the transcendent bliss he achieves alone in front of the computer watching pornography. Dissatisfied, he embarks on a journey to find a more gratifying sex life, but ends up learning larger lessons of life and love through relationships with two very different women. Written by SophiaLB	90 min	http://ia.media-imdb.com/images/M/MV5BMTQxNTc3NDM2MF5BMl5BanBnXkFtZTcwNzQ5NTQ3OQ@@._V1._CR28,28.649993896484375,1271,1991.0000305175781_SX214_.jpg	27 September 2013 (USA)	7.20000000000000018	Don Jon	\N
310	Located alongside the Tennessee River, Muscle Shoals, Alabama is the unlikely breeding ground for some of America's most creative and defiant music. Under the spiritual influence of the 'Singing River' as Native Americans called it, the music of Muscle Shoals changed the world and sold millions upon millions of copies. At its heart is Rick Hall who founded FAME Studios. Overcoming crushing poverty and staggering tragedies, he brought black and white together in Alabama's cauldron of racial hostility to create music for the generations while giving birth to the 'Muscle Shoals Sound' and 'The Swampers'. Mick Jagger, Keith Richards, Percy Sledge, Gregg Allman, Clarence Carter, Etta James, Alicia Keys, Bono, and others bear witness to Muscle Shoals' magnetism, mystery, and why it remains influential today. Written by Anonymous	111 min	http://ia.media-imdb.com/images/M/MV5BMTUzMzU1MTA0N15BMl5BanBnXkFtZTgwMjY3MDgwMDE@._V1_SX214_.jpg	25 October 2013 (UK)	6.5	Muscle Shoals	\N
311	A seemingly wholesome and benevolent family, the Parkers have always kept to themselves, and for good reason. Behind closed doors, patriarch Frank rules his family with a rigorous fervor, determined to keep his ancestral customs intact at any cost. As a torrential rainstorm moves into the area, tragedy strikes and his daughters Iris and Rose are forced to assume responsibilities that extend beyond those of a typical family. As the unrelenting downpour continues to flood their small town, the local authorities begin to uncover clues that bring them closer to the secret that the Parkers have held closely for so many years. Written by Entertainment One	105 min	http://ia.media-imdb.com/images/M/MV5BMjI3NjI3NjAyN15BMl5BanBnXkFtZTgwODE3NzMxMDE@._V1_SY317_CR0,0,214,317_.jpg	25 October 2013 (UK)	5.70000000000000018	We Are What We Are	\N
312	A documentary that follows former U.S. Labor Secretary Robert Reich as he looks to raise awareness of the country's widening economic gap.	89 min	http://ia.media-imdb.com/images/M/MV5BMTY5NjUwNjU1OF5BMl5BanBnXkFtZTgwOTI2NjEwMDE@._V1_SX214_.jpg	19 January 2013 (USA)	6.70000000000000018	Inequality for All	\N
313	Dr. Ryan Stone (Sandra Bullock) is a brilliant medical engineer on her first shuttle mission, with veteran astronaut Matt Kowalsky (George Clooney) in command of his last flight before retiring. But on a seemingly routine spacewalk, disaster strikes. The shuttle is destroyed, leaving Stone and Kowalsky completely alone - tethered to nothing but each other and spiraling out into the blackness. Written by MuTaTeD	91 min	http://ia.media-imdb.com/images/M/MV5BNjE5MzYwMzYxMF5BMl5BanBnXkFtZTcwOTk4MTk0OQ@@._V1_SY317_CR0,0,214,317_.jpg	4 October 2013 (USA)	8.5	Gravity	\N
314	Princeton grad student Richie, believing he's been swindled, travels to Costa Rica to confront online gambling tycoon Ivan Block. Richie is seduced by Block's promise of immense wealth, until he learns the disturbing truth about his benefactor. When the FBI tries to coerce Richie to help bring down Block, Richie faces his biggest gamble ever: attempting to outmaneuver the two forces closing in on him. Written by 20th Century Fox Distribution	91 min	http://ia.media-imdb.com/images/M/MV5BMTU5OTA0MjI4Ml5BMl5BanBnXkFtZTgwMTgxOTQwMDE@._V1_SY317_CR0,0,214,317_.jpg	4 October 2013 (USA)	5.29999999999999982	Runner Runner	\N
315	Rachel is an intelligent, modern-day woman constantly on the move. Primarily focused on her career as a diplomatic consul for the U.S. embassy, she's literally lived her life on the move, globe-trotting from city to city. Currently working in Mexico City and set to leave for London, Rachel's world turns upside down on the eve of her own goodbye party when she gets drunk and passes out on the street. Saved by Alejandro, a handsome Mariachi singer and single father, Rachel wakes up in his apartment with no recollection of how she got there. Nor does she remember that she rejected his visa the day before, which he desperately needs for his daughter. Romance unexpectedly blossoms between the two, but either sparks or fists will fly after she finds out his secret. Written by Pantelion Films	111 min	http://ia.media-imdb.com/images/M/MV5BMTk4NjAxMTYyMF5BMl5BanBnXkFtZTgwOTY4MDEzMDE@._V1_SX214_.jpg	8 November 2013 (Mexico)	4.90000000000000036	Pulling Strings	\N
316	Babli (Ranbir Kapoor) is a street smart car mechanic living in a Delhi orphanage. He is charming and lives life to the fullest. He also steals cars to support his orphanage. He has no sense of right or wrong till he unwittingly hurts the love of his life, Tara (Pallavi Sharda) and is chased by cop couple Chulbul Chautala (Rishi Kapoor) and Bulbul Chautala (Neetu Kapoor). Babli realizes that there is no right way of doing the wrong thing. Babli sets out to fix all the wrongs in his life and he continues to be shameless about it. Written by Reliance Entertainment	143 min	http://ia.media-imdb.com/images/M/MV5BMjI1NTk0NzgyOV5BMl5BanBnXkFtZTgwODQ3NjgyMDE@._V1_SX214_.jpg	2 October 2013 (India)	3.70000000000000018	Besharam	\N
317	Grace Unplugged is an Inspirational movie starring Amanda "AJ" Michalka as 18 year old Christian singer/songwriter, Grace Rose Trey. Beautiful, highly talented and restless, Grace is so far undiscovered outside church. She performs there each Sunday with her gifted father Johnny, the praise music director at Freedom Community Chapel, a small town Alabama church. A former rock star, Johnny Trey charted a Billboard number one single 20 years before. When the hits stopped coming he crash landed hard, a one hit wonder. Johnny found Christ and a new life for his family, far from the Hollywood Hills. One day without warning, Grace leaves for Los Angeles. She has landed a record deal with the help of Johnny's ruthless former manager and producer Frank "Mossy" Mostin. Mossy sees in Grace a potential pop superstar - the next Katie Perry. Cutting off contact with her parents, Grace seems prepared to walk away from her Christian faith and music to achieve her long-suppressed fantasy of Hollywood... Written by Chris Zarpas	102 min	http://ia.media-imdb.com/images/M/MV5BMTA4MzY3MzA1MTZeQTJeQWpwZ15BbWU3MDY1MTE2Nzk@._V1_SX214_.jpg	4 October 2013 (USA)	5.5	Grace Unplugged	\N
318	A.C.O.D. follows a seemingly well-adjusted Adult Child of Divorce (Adam Scott) who is forced to revisit the chaos of his parents (Catherine O'Hara and Richard Jenkins) bitter divorce all over again after his younger brother (Clark Duke) decides to get married. Written by The Film Arcade	88 min	http://ia.media-imdb.com/images/M/MV5BMTQwNTc5MjkyNF5BMl5BanBnXkFtZTgwNzQ5NTYwMDE@._V1_SX214_.jpg	23 January 2013 (USA)	5.5	A.C.O.D.	\N
319	After a blow to the head, Abby decides she can't do it anymore. Her life just can't be only about the house, the kids and the wife. She needs more: she needs to be Eleanor.	96 min	http://ia.media-imdb.com/images/M/MV5BMjMxNDAyODI0Ml5BMl5BanBnXkFtZTgwNTAzMTUzMDE@._V1_SX214_.jpg	4 October 2013 (USA)	5.5	Concussion	\N
320	Recounting the chaotic events that occurred in Dallas, Texas on November 22, 1963, Parkland weaves together the perspectives of a handful of ordinary individuals suddenly thrust into extraordinary circumstances: the young doctors and nurses at Parkland Hospital; Dallas' chief of the Secret Service; an unwitting cameraman who captured what became the most watched and examined film in history; the FBI agents who nearly had the gunman within their grasp; the brother of Lee Harvey Oswald, left to deal with his shattered family; and JFK's security team, witnesses to both the president's death and Vice President Lyndon Johnson's rise to power over a nation whose innocence was forever altered. Written by Exclusive Media Group	93 min	http://ia.media-imdb.com/images/M/MV5BMjE2NjkwNDE2MF5BMl5BanBnXkFtZTgwNDY5ODIxMDE@._V1_SX214_.jpg	2 October 2013 (France)	6	Parkland	\N
321	In February 2012, an entire nation of basketball fans unexpectedly went 'Linsane.' Stuck in the mire of a disappointing season, the New York Knicks did what no other NBA team had thought about doing. They gave backup point guard Jeremy Lin an opportunity to prove himself. He took full advantage, scoring more points in his first five NBA starts than any other player in the modern era, and created a legitimate public frenzy in the process. Prior to this now-legendary run, Lin had faced adversity in his career at every turn. He wasn't offered a scholarship by any major university, nor was he drafted by any NBA team after a standout collegiate career at Harvard. Written by Sundance	89 min	http://ia.media-imdb.com/images/M/MV5BMjAxNzU4ODM3Nl5BMl5BanBnXkFtZTgwNTIwMTEyMDE@._V1_SX214_.jpg	4 October 2013 (USA)	5.5	Linsanity	\N
322	Two French Canadian ne'er-do-wells travel to New York City with a scheme to get rich quick selling Christmas trees. Easygoing charmer Rene (Paul Rudd) clashes with misanthropic ex-con Dennis (Paul Giamatti), whose wife Rene just stole. Still, this odd couple must make an honest go of it in this fresh buddy comedy co-starring Sally Hawkins, by the director of the indie breakout hit Junebug. Written by Anonymous	107 min	http://ia.media-imdb.com/images/M/MV5BMjE2ODg4MDUzOF5BMl5BanBnXkFtZTgwMzk5MjkxMDE@._V1_SY317_CR0,0,214,317_.jpg	10 September 2013 (USA)	5.40000000000000036	All Is Bright	\N
323	On May 13, 1985, Philadelphia police dropped two pounds of military explosives onto a city row house occupied by the radical group MOVE. The resulting fire was not fought for over an hour although firefighters were on the scene with water cannons in place. Five children and six adults were killed and sixty-one homes were destroyed by the six-alarm blaze, one of the largest in the city's history. This dramatic tragedy unfolds through an extraordinary visual record previously withheld from the public. It is a graphic illustration of how prejudice, intolerance and fear can lead to unthinkable acts of violence. Written by Anonymous	88 min	http://ia.media-imdb.com/images/M/MV5BOTE5NjkwMjE3Nl5BMl5BanBnXkFtZTgwNzI4NDgyMDE@._V1_SX214_.jpg	2 October 2013 (USA)	7	Let the Fire Burn	\N
324	The story of the deadliest day on the world's most dangerous mountain, when 11 climbers mysteriously perished on K2.	95 min	http://ia.media-imdb.com/images/M/MV5BMjE0NTYxODMwNV5BMl5BanBnXkFtZTgwOTE5OTAyMDE@._V1_SX214_.jpg	1 November 2013 (Sweden)	5.70000000000000018	The Summit	\N
325	Ken is an average guy who works at an average office job. But he starts to get pains in his stomach whenever he feels stressed out. Things get worse every time he tries to just hide his stress, by burying it inside. It all comes to a head when that "stress" is turned in to an actual little beast that exits his body via his butt and takes revenge on the things that stress him out. But it soon starts to threaten the one thing he loves, his wife. Written by Michael Hallows Eve	85 min	http://ia.media-imdb.com/images/M/MV5BMTQzNTA5MTEwN15BMl5BanBnXkFtZTcwMDk1ODU5OQ@@._V1_SY317_CR0,0,214,317_.jpg	29 August 2013 (USA)	5.40000000000000036	Bad Milo	\N
326	Captain Phillips is a multi-layered examination of the 2009 hijacking of the U.S. container ship Maersk Alabama by a crew of Somali pirates. It is - through director Paul Greengrass's distinctive lens - simultaneously a pulse-pounding thriller, and a complex portrait of the myriad effects of globalization. The film focuses on the relationship between the Alabama's commanding officer, Captain Richard Phillips (two time Academy Award®-winner Tom Hanks), and the Somali pirate captain, Muse (Barkhad Abdi), who takes him hostage. Phillips and Muse are set on an unstoppable collision course when Muse and his crew target Phillips' unarmed ship; in the ensuing standoff, 145 miles off the Somali coast, both men will find themselves at the mercy of forces beyond their control. Written by Sony Pictures Entertainment	134 min	http://ia.media-imdb.com/images/M/MV5BMTQzNzExMDg3Ml5BMl5BanBnXkFtZTgwODU1NzEzMDE@._V1_SX214_.jpg	11 October 2013 (USA)	8.09999999999999964	Captain Phillips	\N
331	The orphan Mandy Lane is a beautiful, virgin and pure teenager raised by her aunt, desired by her schoolmates and a close friend of the outcast Emmet. After the death of their high school mate in a pool party, Mandy befriends Chloe, Marlin, Red, Bird and Jake. Red invites the group for a weekend party in the isolated ranch of his family, with all the boys disputing who would succeed in having sex with Mandy Lane. They meet the henchman Garth that takes care of the ranch and he asks the group to go easy on the drugs and booze. In the middle of the night, a stranger wearing a hood attacks Marlin in the barn; when Jake seeks her out, he faces the killer, beginning a night of bloodshed and terror. Written by Claudio Carvalho, Rio de Janeiro, Brazil	90 min	http://ia.media-imdb.com/images/M/MV5BMzM0MjU1MzUzMF5BMl5BanBnXkFtZTcwMjcwNDQyOQ@@._V1_SY317_CR0,0,214,317_.jpg	6 September 2013 (USA)	5.59999999999999964	All the Boys Love Mandy Lane	\N
332	CBGB follows the story of Hilly Kristal's New York club from its conceit as a venue for Country, Bluegrass and Blues (CBGB) to what it ultimately became: the birthplace of underground rock 'n roll and punk. When Kristal had difficulty booking country bands in his club on the Bowery he opened his doors to other kinds of rock music. Kristal had one demand of the acts he booked; they could only play original music. No top 40's, no covers. It was the credo he lived by, support the artist at whatever the cost. Hilly Kristal ironically became known as the godfather of punk giving a chance to such bands as Blondie, Television, Ramones, Talking Heads, Dead Boys and The Police. Written by anonymous	101 min	http://ia.media-imdb.com/images/M/MV5BMTg1NDcxODY0OV5BMl5BanBnXkFtZTgwOTgwMzQxMDE@._V1_SY317_CR0,0,214,317_.jpg	11 October 2013 (USA)	6	CBGB	\N
333	In the late 1800's, a beautiful former prostitute (January Jones: "Mad Men") is trying to build an honest life with her husband in the rugged plains of New Mexico. When she catches the eye of a sadistic and powerful religious leader (Jason Isaacs: Harry Potter series), her life is violently turned upside down. She embarks on a bloody course of vengeance with the assistance of a renegade sheriff (Ed Harris: Pollock, The Hours, A Beautiful Mind, Apollo 13) who has pretty violent tendencies of his own. Written by ARC Entertainment	95 min	http://ia.media-imdb.com/images/M/MV5BMjM1NzUyNjE0MF5BMl5BanBnXkFtZTgwNTIwMzkyMDE@._V1_SX214_.jpg	11 October 2013 (USA)	6.09999999999999964	Sweetwater	\N
334	Devastated by the death of her younger sister, Lily Morel seeks solace at the spiritualist community of Cassadaga. But instead of finding closure, she contacts something else - the vengeful ghost of a murdered young woman. With her life crumbling all-around her, Lily races to unravel the mysterious circumstances surrounding the woman's death - a task that will bring her face-to-face with a sadistic serial killer known only as "Geppetto". Written by Bruce Wood	108 min	http://ia.media-imdb.com/images/M/MV5BMTUwNjk4OTI0MF5BMl5BanBnXkFtZTgwNDMzMzUzMDE@._V1_SX214_.jpg	11 October 2013 (USA)	5.09999999999999964	Cassadaga	\N
335	A reimagining of the classic horror tale about Carrie White (Chloë Grace Moretz), a shy girl outcast by her peers and sheltered by her deeply religious mother (Julianne Moore), who unleashes telekinetic terror on her small town after being pushed too far at her senior prom. Based on the best-selling novel by Stephen King, Carrie is directed by Kimberly Peirce with a screenplay by Lawrence D. Cohen and Roberto Aguirre-Sacasa. Written by Sony Pictures Entertainment	100 min	http://ia.media-imdb.com/images/M/MV5BMTc1MDIyOTkxN15BMl5BanBnXkFtZTgwMTU1NzEzMDE@._V1_SY317_CR0,0,214,317_.jpg	18 October 2013 (USA)	6.40000000000000036	Carrie	\N
336	The story begins as WikiLeaks founder Julian Assange (Benedict Cumberbatch) and his colleague Daniel Domscheit-Berg (Daniel Brühl) team up to become underground watchdogs of the privileged and powerful. On a shoestring, they create a platform that allows whistle-blowers to anonymously leak covert data, shining a light on the dark recesses of government secrets and corporate crimes. Soon, they are breaking more hard news than the world's most legendary media organizations combined. But when Assange and Berg gain access to the biggest trove of confidential intelligence documents in U.S. history, they battle each other and a defining question of our time: what are the costs of keeping secrets in a free society-and what are the costs of exposing them? Written by DreamWorks Pictures	128 min	http://ia.media-imdb.com/images/M/MV5BMjY1MTY5NTg3M15BMl5BanBnXkFtZTgwMDQyMjgwMDE@._V1_SX214_.jpg	18 October 2013 (USA)	5.70000000000000018	The Fifth Estate	\N
337	Based on an incredible true story of one man's fight for survival and freedom. In the pre-Civil War United States, Solomon Northup (Chiwetel Ejiofor), a free black man from upstate New York, is abducted and sold into slavery. Facing cruelty (personified by a malevolent slave owner, portrayed by Michael Fassbender), as well as unexpected kindnesses, Solomon struggles not only to stay alive, but to retain his dignity. In the twelfth year of his unforgettable odyssey, Solomon's chance meeting with a Canadian abolitionist (Brad Pitt) will forever alter his life. Written by Fox Searchlight	134 min	http://ia.media-imdb.com/images/M/MV5BMjExMTEzODkyN15BMl5BanBnXkFtZTcwNTU4NTc4OQ@@._V1_SX214_.jpg	8 November 2013 (USA)	8.69999999999999929	12 Years a Slave	\N
338	Ray Breslin is the world's foremost authority on structural security. After analyzing every high security prison and learning a vast array of survival skills so he can design escape-proof prisons, his skills are put to the test. He's framed and incarcerated in a master prison he designed himself. He needs to escape and find the person who put him behind bars. Written by Anonymous	115 min	http://ia.media-imdb.com/images/M/MV5BMTk3OTcxMTEyNl5BMl5BanBnXkFtZTcwMDQ4MjQ2OQ@@._V1_SY317_CR0,0,214,317_.jpg	18 October 2013 (USA)	7.20000000000000018	Escape Plan	\N
339	Deep into a solo voyage in the Indian Ocean, an unnamed man (Redford) wakes to find his 39-foot yacht taking on water after a collision with a shipping container left floating on the high seas. With his navigation equipment and radio disabled, the man sails unknowingly into the path of a violent storm. Despite his success in patching the breached hull, his mariner's intuition and a strength that belies his age, the man barely survives the tempest. Using only a sextant and nautical maps to chart his progress, he is forced to rely on ocean currents to carry him into a shipping lane in hopes of hailing a passing vessel. But with the sun unrelenting, sharks circling and his meager supplies dwindling, the ever-resourceful sailor soon finds himself staring his mortality in the face. Written by Roadside Attractions	106 min	http://ia.media-imdb.com/images/M/MV5BMjI0MzIyMjU1N15BMl5BanBnXkFtZTgwOTk1MjQxMDE@._V1_SX214_.jpg	7 November 2013 (Greece)	7.59999999999999964	All Is Lost	\N
340	A murder in 1944 draws together the great poets of the beat generation: Allen Ginsberg, Jack Kerouac and William Burroughs.	104 min	http://ia.media-imdb.com/images/M/MV5BMjA4MzAxMTE1N15BMl5BanBnXkFtZTgwMDY2OTIxMDE@._V1_SX214_.jpg	17 October 2013 (Italy)	6.90000000000000036	Kill Your Darlings	\N
373	An advertising executive is kidnapped and held hostage for 20 years in solitary confinement. When he is inexplicably released, he embarks on an obsessive mission to discover who orchestrated his punishment, only to find he is still trapped in a web of conspiracy and torment. Written by FilmDistrict	104 min	http://ia.media-imdb.com/images/M/MV5BMTg4NTQ3MDc1MV5BMl5BanBnXkFtZTgwMTA0MTY1MDE@._V1_SX214_.jpg	27 November 2013 (USA)	-1	Oldboy	\N
341	A rich and successful lawyer named Counsellor is about to get married to his fiancée but soon meets up with the middle-man known as Westray who tells him his drug trafficking plan has taken a horrible twist and now he must protect himself and his soon bride-to-be lover as the truth of the drug business uncovers and targets become chosen. Written by Anonymous	117 min	http://ia.media-imdb.com/images/M/MV5BMTc3ODk0MTY0N15BMl5BanBnXkFtZTgwOTU2MTEzMDE@._V1_SY317_CR0,0,214,317_.jpg	25 October 2013 (USA)	6	The Counselor	\N
342	Eighty-six-year-old Irving Zisman is on a journey across America with the most unlikely companion: his eight-year-old grandson Billy, in "Jackass Presents: Bad Grandpa". This October, the signature Jackass characters Irving Zisman (Johnny Knoxville) and Billy (Jackson Nicoll) will take movie audiences along for the most insane hidden camera road trip ever captured on camera. Along the way Irving will introduce the young and impressionable Billy to people, places, and situations that give new meaning to the term "childrearing". The duo will encounter male strippers, disgruntled child beauty pageant contestants (and their equally disgruntled mothers), funeral home mourners, biker bar patrons, and a whole lot of unsuspecting citizens. Real people in unreal situations, making for one really messed up comedy. Written by Paramount Pictures PR	92 min	http://ia.media-imdb.com/images/M/MV5BMTg4NjIwMTI5OV5BMl5BanBnXkFtZTgwNjU1MTMyMDE@._V1_SY317_CR1,0,214,317_.jpg	25 October 2013 (USA)	7	Jackass Presents: Bad Grandpa	\N
343	Adele's life is changed when she meets Emma, a young woman with blue hair, who will allow her to discover desire, to assert herself as a woman and as an adult. In front of others, Adele grows, seeks herself, loses herself, finds herself.	179 min	http://ia.media-imdb.com/images/M/MV5BMTQ5NTg5ODk4OV5BMl5BanBnXkFtZTgwODc4MTMzMDE@._V1_SX214_.jpg	28 November 2013 (Portugal)	8	Blue Is the Warmest Color	\N
344	When the CEO of France's Phenix Bank collapses on the golf course, Machiavellian young executive Marc Tourneuil is crowned as his replacement. A whirlwind of ruthless ambition, power struggles, greed and deception ensues as Tourneuil's brutal ascent is jeopardized by a hostile takeover attempt from a large American hedge fund led by Dittmar Rigule, erotic distractions from international supermodel Nassim, and adversaries with an agenda for destruction. Written by Cohen Media Group	114 min	http://ia.media-imdb.com/images/M/MV5BMjE2NDU2MDc5N15BMl5BanBnXkFtZTgwNTYwMzYzMDE@._V1_SY317_CR2,0,214,317_.jpg	1 May 2013 (Portugal)	6.40000000000000036	O Capital	\N
345	Spinning Plates is a documentary about three extraordinary restaurants and the incredible people who make them what they are. A cutting-edge restaurant named the seventh-best in the world whose chef must battle a life-threatening obstacle to pursue his passion. A 150-year-old family restaurant still standing only because of the unbreakable bond with its community. A fledgling Mexican restaurant whose owners are risking everything just to survive and provide for their young daughter. Their unforgettable stories of family, legacy, passion and survival come together to reveal how meaningful food can be, and the power it has to connect us to one another. Written by Anonymous	93 min	http://ia.media-imdb.com/images/M/MV5BMzA0ODYwODIxNV5BMl5BanBnXkFtZTgwNDE1OTE0MDE@._V1_SX214_.jpg	25 October 2013 (USA)	7.29999999999999982	Spinning Plates	\N
346	Supertanker captain Marco Silvestri is called back urgently to Paris. His sister Sandra is desperate - her husband has committed suicide, the family business has gone under, her daughter is spiralling downwards. Sandra holds powerful businessman Edouard Laporte responsible. Marco moves into the building where Laporte has installed his mistress and her son. But he hasn't planned for Sandra's secrets, which muddy the waters... Written by IFC Films	83 min	http://ia.media-imdb.com/images/M/MV5BMTAxNzE5NzU0MDleQTJeQWpwZ15BbWU4MDY4MzU3NDAx._V1_SY317_CR0,0,214,317_.jpg	7 August 2013 (France)	6.20000000000000018	Bastards	\N
347	The Earth was ravaged by the Formics, an alien race seemingly determined to destroy humanity. Seventy years later, the people of Earth remain banded together to prevent their own annihilation from this technologically superior alien species. Ender Wiggin, a quiet but brilliant boy, may become the savior of the human race. He is separated from his beloved sister and his terrifying brother and brought to battle school in orbit around earth. He will be tested and honed into an empathetic killer who begins to despise what he does as he learns to fight in hopes of saving Earth and his family. Written by CrystalSinger45, Jesse Daniels, strouda56	114 min	http://ia.media-imdb.com/images/M/MV5BMjAzMzI5OTgzMl5BMl5BanBnXkFtZTgwMTU5MTAwMDE@._V1_SX214_.jpg	1 November 2013 (USA)	7.20000000000000018	Ender's Game	\N
348	Billy (Michael Douglas), Paddy (Robert De Niro), Archie (Morgan Freeman) and Sam (Kevin Kline) have been best friends since childhood. So when Billy, the group's sworn bachelor, finally proposes to his thirty-something (of course) girlfriend, the four head to Las Vegas with a plan to stop acting their age and relive their glory days. However, upon arriving, the four quickly realize that the decades have transformed Sin City and tested their friendship in ways they never imagined. The Rat Pack may have once played the Sands and Cirque du Soleil may now rule the Strip, but it's these four who are taking over Vegas. Written by Production	105 min	http://ia.media-imdb.com/images/M/MV5BMTQ2ODg2MTIyNF5BMl5BanBnXkFtZTgwMzU2NjgwMDE@._V1_SX214_.jpg	1 November 2013 (USA)	6.79999999999999982	Last Vegas	\N
349	After years of fruitless warning of his farmyard brethren of the coming Thanksgiving doom, Reggie the Turkey finds himself spared as the annual Pardoned Turkey. However, Reggie's easy life is disrupted by Jake, a fanatic turkey who drags him along with the insane idea of going back in time to make sure turkeys are not part of the first Thanksgiving. Through foolhardiness and luck, the pair manage to take an experiment time machine to do just that. Now in 1621 at the Plymouth colony, Reggie and Jake find themselves in the middle of a turkey clan's struggle for survival. In doing so, their preconceptions of the world and themselves are challenged forever in a conflict from which the world will never be the same. Written by Kenneth Chisholm (kchishol@rogers.com)	91 min	http://ia.media-imdb.com/images/M/MV5BNjE0NjIwMzAwOF5BMl5BanBnXkFtZTgwOTIyMzMzMDE@._V1_SY317_CR0,0,214,317_.jpg	1 November 2013 (USA)	5.09999999999999964	Free Birds	\N
374	In a contemporary adaptation of Langston Hughes' celebrated play, the holiday musical drama BLACK NATIVITY follows Langston (Jacob Latimore), a street-wise teen from Baltimore raised by a single mother, as he journeys to New York City to spend the Christmas holiday with his estranged relatives Reverend Cornell and Aretha Cobbs (Forest Whitaker and Angela Bassett). Unwilling to live by the imposing Reverend Cobbs' rules, a frustrated Langston is determined to return home to his mother, Naima (Jennifer Hudson). Langston embarks on a surprising and inspirational journey and along with his new friends, and a little divine intervention, he discovers the true meaning of faith, healing, and family. Written by Fox Searchlight	93 min	http://ia.media-imdb.com/images/M/MV5BMTg3OTkxNzkwMl5BMl5BanBnXkFtZTgwOTcyNTE2MDE@._V1_SX214_.jpg	27 November 2013 (USA)	-1	Black Nativity	\N
350	At the age of 21, Tim Lake (Domhnall Gleeson) discovers he can travel in time... The night after another unsatisfactory New Year party, Tim's father (Bill Nighy) tells his son that the men in his family have always had the ability to travel through time. Tim can't change history, but he can change what happens and has happened in his own life-so he decides to make his world a better place...by getting a girlfriend. Sadly, that turns out not to be as easy as you might think. Moving from the Cornwall coast to London to train as a lawyer, Tim finally meets the beautiful but insecure Mary (Rachel McAdams). They fall in love, then an unfortunate time-travel incident means he's never met her at all. So they meet for the first time again-and again-but finally, after a lot of cunning time-traveling, he wins her heart. Tim then uses his power to create the perfect romantic proposal, to save his wedding from the worst best-man speeches, to save his best friend from professional disaster and to ... Written by Universal Pictures	123 min	http://ia.media-imdb.com/images/M/MV5BMTA1ODUzMDA3NzFeQTJeQWpwZ15BbWU3MDgxMTYxNTk@._V1_SX214_.jpg	8 November 2013 (USA)	7.70000000000000018	About Time	\N
351	Dallas 1985. Electrician and sometimes rodeo bull rider Ron Woodroof lives hard, which includes heavy smoking, drinking, drug use (primarily cocaine) and casual sex. He is a stereotypical redneck: racist and homophobic. While in the hospital on a work related injury, the doctors discover and inform him that he is HIV+, and that he will most-likely die within thirty days. Ron is initially in angry denial that he would have a disease that only "faggots" have, but upon quick reflection comes to the realization that the diagnosis is probably true. He begins to read whatever research is available about the disease, which at this time seems to be most effectively treated by the drug AZT. AZT, however, is only in the clinical trials stage within the US. Incredulous that he, as a dying man, cannot pay for any drug which may save or at least prolong his life, goes searching for it by whatever means possible. It eventually leads him to Mexico and a "Dr." Vass, an American physician whose ... Written by Huggo	117 min	http://ia.media-imdb.com/images/M/MV5BMTYwMTA4MzgyNF5BMl5BanBnXkFtZTgwMjEyMjE0MDE@._V1_SX214_.jpg	12 December 2013 (Portugal)	8	Dallas Buyers Club	\N
352	During the last two years of her life, Princess Diana embarks on a final rite of passage: a secret love affair with Pakistani heart surgeon Hasnat Khan.	113 min	http://ia.media-imdb.com/images/M/MV5BMjA0NDg0Njg3N15BMl5BanBnXkFtZTgwMTMxMzMzMDE@._V1_SX214_.jpg	26 September 2013 (Portugal)	4.79999999999999982	Diana	\N
353	In the year 2092, one hundred eighteen year old Nemo is recounting his life story to a reporter. He is less than clear, often times thinking that he is only thirty-four years of age. But his story becomes more confusing after he does focus on the fact of his current real age. He tells of his life at three primary points in his life: at age nine (when his parents divorced), age sixteen and age thirty-four. The confusing aspect of the story is that he tells of alternate life paths, often changing course with the flick of a decision at each of those ages. One life path has him ultimately married to Elise, a depressed woman who never got over the unrequited love she had for a guy named Stefano when she was a teenager and who asked Nemo to swear that when she died he would sprinkle her ashes on Mars. A second life path has him married to Jean. Their life is one of luxury but one also of utter boredom. And a third life path has him in a torrid romance with his step-sister Anna, the two who,... Written by Huggo	141 min	http://ia.media-imdb.com/images/M/MV5BMTg4ODkzMDQ3Nl5BMl5BanBnXkFtZTgwNTEwMTkxMDE@._V1_SY317_CR0,0,214,317_.jpg	26 September 2013 (USA)	7.79999999999999982	Sr. Ninguém	\N
354	Elise and Didier fall in love at first sight, in spite of their differences. He talks, she listens. He's a romantic atheist, she's a religious realist. When their daughter becomes seriously ill, their love is put on trial.	111 min	http://ia.media-imdb.com/images/M/MV5BMTQzMzg2Nzg2MF5BMl5BanBnXkFtZTgwNjUzNzIzMDE@._V1_SX214_.jpg	1 November 2013 (USA)	7.70000000000000018	The Broken Circle Breakdown	\N
355	Sudden fame and a self-destructive lifestyle were taking a toll on Jack Kerouac's mind and body following the unparalleled success of the groundbreaking novel, On The Road. Once the handsome literary maverick and hero of the Beat Generation, Kerouac now sees only a vestige of his former self, ravaged by alcohol and drugs, aged beyond his years and tormented by self-doubt. Questioning his talent, his faith, and his mortality, Kerouac leaves New York for California, on a quest for redemption at an isolated, fog-banked cabin in the primitive landscape of the Big Sur woods. What ensues in those fateful 3 weeks of August, 1960, is both terrifying and revelatory. While Kerouac is able to find beauty and elation in his surroundings, the dichotomy of his psyche renders him unable to face his demons alone. He sets off on a visceral collision course of paranoia, sex, delirium tremens, misery and madness. His desperation culminates in an intense, hallucinatory breakdown, but the duality of his ... Written by Anonymous	81 min	http://ia.media-imdb.com/images/M/MV5BMjI3MDU0MDY2MF5BMl5BanBnXkFtZTgwNDY3NjUzMDE@._V1_SX214_.jpg	1 November 2013 (USA)	5.40000000000000036	Big Sur	\N
356	Thousands of years ago, a race of beings known as Dark Elves tried to send the universe into darkness by using a weapon known as the Aether. But warriors from Asgard stop them but their leader Malekith escapes to wait for another opportunity. The warriors find the Aether and since it can't be destroyed, they try to hide it. In the present day, Jane Foster awaits the return of Thor but it's been two years. He's trying to bring peace to the nine realms. Jane discovers an anomaly similar to the one that brought Thor to Earth. She goes to investigate and finds a wormhole and is sucked into it. Thor wishes to return to Earth but his father, Odin refuses to let him. Thor learns from Heimdall, the one who can see into all of the realms that Jane disappeared. Thor then returns to Earth just as Jane returns. But when some policemen try to arrest her, some kind of energy repulses them. Thor then brings her to Asgard to find out what happened to her. When it happens again, they discovered that ... Written by rcs0411@yahoo.com	112 min	http://ia.media-imdb.com/images/M/MV5BMTQyNzAwOTUxOF5BMl5BanBnXkFtZTcwMTE0OTc5OQ@@._V1_SY317_CR4,0,214,317_.jpg	8 November 2013 (USA)	7.70000000000000018	Thor: The Dark World	\N
357	Based on the beloved bestselling book, THE BOOK THIEF tells the story of a spirited and courageous young girl who transforms the lives of everyone around her when she is sent to live with a foster family in World War II Germany. Written by 20th Century Fox	131 min	http://ia.media-imdb.com/images/M/MV5BOTE3NzkyMjAyNF5BMl5BanBnXkFtZTgwMDc5MTE0MDE@._V1_SX214_.jpg	23 January 2014 (Portugal)	6.59999999999999964	The Book Thief	\N
358	A documentary chronicling sports legend Lance Armstrong's improbable rise and ultimate fall from grace.	122 min	http://ia.media-imdb.com/images/M/MV5BMjA5NDMzNjg2M15BMl5BanBnXkFtZTgwNjQ4MzI1MDE@._V1_SX214_.jpg	14 November 2013 (Portugal)	6.29999999999999982	The Armstrong Lie	\N
359	An American girl sent to the English countryside to stay with relatives finds herself fighting for her survival as the UK turns into a violent military state.	101 min	http://ia.media-imdb.com/images/M/MV5BMTU4NTg4NzgzMF5BMl5BanBnXkFtZTgwOTU1NTMxMDE@._V1_SX214_.jpg	4 October 2013 (UK)	6.5	How I Live Now	\N
360	Set in the most depressing corner of a postapocalyptic future, our heroine Kantmiss Evershot (Maiara Walsh) volunteers to take her manipulative younger sister's place in the seventy-fifth annual "Starving Games." In doing so, she must leave behind her smoldering just-a-friend Dale (Brant Daugherty) and team up with the geeky baker's son Peter Malarkey (Cody Allen Christian) in a fight for her life. But wait, there's more! She could also win an old ham, a coupon for a foot-long sub at a six-inch price, and a partially eaten pickle! In The Starving Games, Friedberg and Seltzer's sixth cinematic spoof of box-office hits, the prolific parody duo has its sights trained on the adventure blockbuster The Hunger Games! It's all the laughs and half the calories as they sling dozens of cock-eyed, barbed arrows at sci-fi, action and fantasy films from The Avengers and Oz the Great and Powerful to pop culture characters and celebrities like Harry Potter and Taylor Swift. Written by Ketchup Entertainment	83 min	http://ia.media-imdb.com/images/M/MV5BMTgwOTk2OTY4MV5BMl5BanBnXkFtZTgwMTU5MjE0MDE@._V1_SY317_CR5,0,214,317_.jpg	31 October 2013 (Argentina)	3.10000000000000009	The Starving Games	\N
361	Fontayne is enlisted by Bernice- her estranged old friend and current parole officer - along with a disgraced cop to search for Bernice's son, who went missing on the Mexican border.	123 min	http://ia.media-imdb.com/images/M/MV5BMzU3MDIwODQyM15BMl5BanBnXkFtZTgwNzk4MTE1MDE@._V1_SY317_CR0,0,214,317_.jpg	11 March 2013 (USA)	6.29999999999999982	Go for Sisters	\N
362	The best man at Scott (Long) and Kristin's (Weixler) Arizona destination wedding, Lumpy (Labine) is the life of the party, until a long, indulgent night leads to his untimely death. Forced to cancel their honeymoon and fly back to Minneapolis to arrange for his funeral, Scott and Kristin meet Ramsey (Timlin) and learn that Lumpy isn't quite who they thought he was. Written by Anonymous	89 min	http://ia.media-imdb.com/images/M/MV5BOTY0OTAyOTU4NF5BMl5BanBnXkFtZTgwOTkxMTYwMDE@._V1_SX214_.jpg	3 October 2013 (USA)	6.29999999999999982	Best Man Down	\N
363	"NEBRASKA" is a father and son road trip, from Billings, Montana to Lincoln, Nebraska that gets waylaid at a small town in central Nebraska, where the father grew up and has scores to settle. Told with deadpan humor and a unique visual style, it's ultimately the story of a son trying to get through to a father he doesn't understand. Written by Anonymous	115 min	http://ia.media-imdb.com/images/M/MV5BMTU2Mjk2NDkyMl5BMl5BanBnXkFtZTgwNTk0NzcyMDE@._V1_SX214_.jpg	15 November 2013 (USA)	8	Nebraska	\N
364	When college friends reunite after 15 years over the Christmas holidays, they will discover just how easy it is for long-forgotten rivalries and romances to be ignited.	123 min	http://ia.media-imdb.com/images/M/MV5BMjU0MTI1MDg5Ml5BMl5BanBnXkFtZTgwNzc2MTMzMDE@._V1_SX214_.jpg	15 November 2013 (USA)	6.40000000000000036	The Best Man Holiday	\N
365	While traveling abroad, a guy falls for a Romanian beauty whose unreachable heart has its origins in her violent, charismatic ex.	108 min	http://ia.media-imdb.com/images/M/MV5BMjA3MTcyNjk3NF5BMl5BanBnXkFtZTgwNjkzNzUzMDE@._V1_SX214_.jpg	13 September 2013 (Norway)	5.59999999999999964	Charlie Countryman	\N
366	A documentary film about the impact of the newspaper comic strip Calvin & Hobbes, created by Bill Watterson.	99 min	http://ia.media-imdb.com/images/M/MV5BOTEwNTE0NDYyM15BMl5BanBnXkFtZTgwMDczNjE0MDE@._V1_SY317_CR0,0,214,317_.jpg	15 November 2013 (USA)	5.40000000000000036	Dear Mr. Watterson	\N
367	A version of the German legend in which a man who sells his soul to the devil in exchange for knowledge.	140 min	http://ia.media-imdb.com/images/M/MV5BMTM4NDgwNjU4Ml5BMl5BanBnXkFtZTgwNzU2OTI1MDE@._V1_SY317_CR3,0,214,317_.jpg	15 November 2013 (USA)	6.70000000000000018	Fausto	\N
368	A mix of live performances and behind-the-scenes footage from the televised benefit concert to raise relief funds for victims of Hurricane Sandy in 2012.	105 min	http://ia.media-imdb.com/images/M/MV5BMTQxNTAzNTg1MV5BMl5BanBnXkFtZTgwODc3OTk1MDE@._V1_SX214_.jpg	1 November 2013 (USA)	6.40000000000000036	12-12-12	\N
369	A Thanksgiving get-together for the eccentric Turner clan goes from bad to worse when estranged daughter Nina makes a surprise visit home for the first time in 15 years. Nina clashes with her stepmother Deborah, and sister, Lindsay, while half-brother Jacob tries to keep a massive gambling debt a secret. Meanwhile, family patriarch Poppy has his own dramatic news to share. "Cold Turkey" is a black comedy about how - despite our best efforts - we all eventually turn into our parents. Starring Alicia Witt ("Friday Night Lights"), Cheryl Hines ("Curb Your Enthusiasm"), Sonya Walger ("Lost"), Victoria Tennant ("L.A. Story") and acclaimed writer-director Peter Bogdanovich ("The Last Picture Show"). Written by Anonymous		http://ia.media-imdb.com/images/M/MV5BMjI3NTc3MzQzNF5BMl5BanBnXkFtZTgwMzEyMDQ1MDE@._V1_SX214_.jpg	15 November 2013 (USA)	5.70000000000000018	Cold Turkey	\N
370	Katniss Everdeen has returned home safe after winning the 74th Annual Hunger Games along with fellow tribute Peeta Mellark. Winning means that they must turn around and leave their family and close friends, embarking on a "Victor's Tour" of the districts. Along the way Katniss senses that a rebellion is simmering, but the Capitol is still very much in control as President Snow prepares the 75th Annual Hunger Games (The Quarter Quell) - a competition that could change Panem forever. Written by Bianca Capetillo	146 min	http://ia.media-imdb.com/images/M/MV5BMTAyMjQ3OTAxMzNeQTJeQWpwZ15BbWU4MDU0NzA1MzAx._V1_SX214_.jpg	22 November 2013 (USA)	7.40000000000000036	The Hunger Games: Catching Fire	\N
371	An affable underachiever finds out he's fathered 533 children through anonymous donations to a fertility clinic 20 years ago. Now he must decide whether or not to come forward when 142 of them file a lawsuit to reveal his identity.	103 min	http://ia.media-imdb.com/images/M/MV5BMjIxNjc2MzMzMl5BMl5BanBnXkFtZTgwMjA5NjM0MDE@._V1_SX214_.jpg	22 November 2013 (USA)	-1	Delivery Man	\N
372	Anna, a fearless optimist, sets off on an epic journey - teaming up with rugged mountain man Kristoff and his loyal reindeer Sven - to find her sister Elsa, whose icy powers have trapped the kingdom of Arendelle in eternal winter. Encountering Everest-like conditions, mystical trolls and a hilarious snowman named Olaf, Anna and Kristoff battle the elements in a race to save the kingdom. From the outside Anna's sister, Elsa looks poised, regal and reserved, but in reality, she lives in fear as she wrestles with a mighty secret-she was born with the power to create ice and snow. It's a beautiful ability, but also extremely dangerous. Haunted by the moment her magic nearly killed her younger sister Anna, Elsa has isolated herself, spending every waking minute trying to suppress her growing powers. Her mounting emotions trigger the magic, accidentally setting off an eternal winter that she can't stop. She fears she's becoming a monster and that no one, not even her sister, can help her. Written by DeAlan Wilson for ComedyE.com	108 min	http://ia.media-imdb.com/images/M/MV5BMTQ1MjQwMTE5OF5BMl5BanBnXkFtZTgwNjk3MTcyMDE@._V1_SX214_.jpg	27 November 2013 (USA)	-1	Frozen	\N
375	A chronicle of Nelson Mandela's life journey from his childhood in a rural village through to his inauguration as the first democratically elected president of South Africa.	146 min	http://ia.media-imdb.com/images/M/MV5BMTg1NTQ1NDczNV5BMl5BanBnXkFtZTcwNDQyMDU1OQ@@._V1_SX214_.jpg	3 January 2014 (UK)	6	Mandela: Long Walk to Freedom	\N
377	Russell and his younger brother Rodney live in the economically-depressed Rust Belt, and have always dreamed of escaping and finding better lives. But when a cruel twist of fate lands Russell in prison, his brother is lured into one of the most violent and ruthless crime rings in the Northeast - a mistake that will almost cost him everything. Once released, Russell must choose between his own freedom, or risk it all to seek justice for his brother. Written by Production	116 min	http://ia.media-imdb.com/images/M/MV5BMTc2MTQ4MDU4NV5BMl5BanBnXkFtZTgwOTU1ODgzMDE@._V1_SX214_.jpg	6 December 2013 (USA)	6.79999999999999982	Out of the Furnace	\N
378	Follow a week in the life of a young folk singer as he navigates the Greenwich Village folk scene of 1961. Guitar in tow, huddled against the unforgiving New York winter, he is struggling to make it as a musician against seemingly insurmountable obstacles -- some of them of his own making. Written by Production	105 min	http://ia.media-imdb.com/images/M/MV5BMjAxNjcyNDQxM15BMl5BanBnXkFtZTgwNzU2NDA0MDE@._V1_SX214_.jpg	20 December 2013 (USA)	7.70000000000000018	Inside Llewyn Davis	\N
379	After successfully crossing over (and under) the Misty Mountains, Thorin and Company must seek aid from a powerful stranger before taking on the dangers of Mirkwood Forest--without their Wizard. If they reach the human settlement of Lake-town it will be time for the hobbit Bilbo Baggins to fulfill his contract with the dwarves. The party must complete the journey to Lonely Mountain and burglar Baggins must seek out the Secret Door that will give them access to the hoard of the dragon Smaug. And, where has Gandalf got off to? And what is his secret business to the south? Written by Otaku-sempai		http://ia.media-imdb.com/images/M/MV5BMzU0NDY0NDEzNV5BMl5BanBnXkFtZTgwOTIxNDU1MDE@._V1_SY317_CR0,0,214,317_.jpg	13 December 2013 (USA)	-1	The Hobbit: The Desolation of Smaug	\N
380	Madea gets coaxed into helping a friend pay her daughter a surprise visit in the country for Christmas, but the biggest surprise is what they'll find when they arrive. As the small, rural town prepares for its annual Christmas Carnival, new secrets are revealed and old relationships are tested while Madea dishes her own brand of Christmas Spirit to all. Written by Lionsgate		http://ia.media-imdb.com/images/M/MV5BMjIwNjA3OTM4NF5BMl5BanBnXkFtZTgwOTA0MjM2MDE@._V1_SX214_.jpg	13 December 2013 (USA)	-1	Tyler Perry's A Madea Christmas	\N
381	With the 70s behind him, San Diego's top rated newsman, Ron Burgundy, returns to take New York's first 24-hour news channel by storm.		http://ia.media-imdb.com/images/M/MV5BMjE5ODk0NjQzNV5BMl5BanBnXkFtZTgwODk4MDA1MDE@._V1_SX214_.jpg	20 December 2013 (USA)	-1	Anchorman 2: The Legend Continues	\N
382	A fictional film set in the alluring world of one of the most stunning scandals to rock our nation, American Hustle tells the story of brilliant con man Irving Rosenfeld (Christian Bale), who along with his equally cunning and seductive British partner Sydney Prosser (Amy Adams) is forced to work for a wild FBI agent Richie DiMaso (Bradley Cooper). DiMaso pushes them into a world of Jersey powerbrokers and mafia that's as dangerous as it is enchanting. Jeremy Renner is Carmine Polito, the passionate, volatile, New Jersey political operator caught between the con-artists and Feds. Irving's unpredictable wife Rosalyn (Jennifer Lawrence) could be the one to pull the thread that brings the entire world crashing down. Written by Sony Pictures Entertainment	129 min	http://ia.media-imdb.com/images/M/MV5BNjkxMTc0MDc4N15BMl5BanBnXkFtZTgwODUyNTI1MDE@._V1_SX214_.jpg	18 December 2013 (USA)	-1	American Hustle	\N
383	When Walt Disney's daughters begged him to make a movie of their favorite book, P.L. Travers' "Mary Poppins," he made them a promise - one that he didn't realize would take 20 years to keep. In his quest to obtain the rights, Walt comes up against a curmudgeonly, uncompromising writer who has absolutely no intention of letting her beloved magical nanny get mauled by the Hollywood machine. But, as the books stop selling and money grows short, Travers reluctantly agrees to go to Los Angeles to hear Disney's plans for the adaptation. For those two short weeks in 1961, Walt Disney pulls out all the stops. Armed with imaginative storyboards and chirpy songs from the talented Sherman brothers, Walt launches an all-out onslaught on P.L. Travers, but the prickly author doesn't budge. He soon begins to watch helplessly as Travers becomes increasingly immovable and the rights begin to move further away from his grasp. It is only when he reaches into his own childhood that Walt discovers the ... Written by Walt Disney Pictures	125 min	http://ia.media-imdb.com/images/M/MV5BMTc0MTQ3NzE4Nl5BMl5BanBnXkFtZTcwMzA4NDM5OQ@@._V1_SX214_.jpg	20 December 2013 (USA)	7.20000000000000018	Saving Mr. Banks	\N
384	For the first time in movie history, audiences will truly see and feel what it was like when dinosaurs ruled the Earth. "Walking with Dinosaurs" is the ultimate immersive experience, utilizing state of the art 3D to put audiences in the middle of a thrilling and epic prehistoric world, where an underdog dino triumphs to become a hero for the ages. Written by Anonymous		http://ia.media-imdb.com/images/M/MV5BMjE2OTc2MTk1Nl5BMl5BanBnXkFtZTgwNDg5NDU1MDE@._V1_SY317_CR0,0,214,317_.jpg	20 December 2013 (USA)	-1	Walking with Dinosaurs 3D	\N
385	A lonely writer develops an unlikely relationship with his newly purchased operating system that's designed to meet his every need.	120 min	http://ia.media-imdb.com/images/M/MV5BMjA1Nzk0OTM2OF5BMl5BanBnXkFtZTgwNjU2NjEwMDE@._V1_SY317_CR0,0,214,317_.jpg	10 January 2014 (USA)	7.09999999999999964	Her	\N
386	Ben Stiller directs and stars in THE SECRET LIFE OF WALTER MITTY, James Thurber's classic story of a day-dreamer who escapes his anonymous life by disappearing into a world of fantasies filled with heroism, romance and action. When his job along with that of his co-worker (Kristen Wiig) are threatened, Walter takes action in the real world embarking on a global journey that turns into an adventure more extraordinary than anything he could have ever imagined. Written by 20th Century Fox		http://ia.media-imdb.com/images/M/MV5BMTQzNzU5NzQ4OF5BMl5BanBnXkFtZTgwODk3MDgxMDE@._V1_SX214_.jpg	25 December 2013 (USA)	6.70000000000000018	The Secret Life of Walter Mitty	\N
387	Based on the failed mission "Operation Red Wings" which tasked four members of SEAL Team 10 on June 28, 2005 to kill Taliban leader Ahmad Shah. They were quickly compromised and under attack, Marcus Luttrell being the only member to survive and evade capture. Written by Anonymous		http://ia.media-imdb.com/images/M/MV5BMjA0NTgwOTk5Ml5BMl5BanBnXkFtZTcwMjE3NDc5OQ@@._V1_SX214_.jpg	10 January 2014 (USA)	7.09999999999999964	Lone Survivor	\N
388	In The Wolf of Wall Street DiCaprio plays Belfort, a Long Island penny stockbroker who served 20 months in prison for defrauding investors in a massive 1990s securities scheme that involved widespread corruption on Wall Street and in the corporate banking world, including shoe designer Steve Madden. Written by anonymous	165 min	http://ia.media-imdb.com/images/M/MV5BMTQ5OTI2MTQ1MV5BMl5BanBnXkFtZTcwMjY0Njk2OQ@@._V1_SY317_CR1,0,214,317_.jpg	25 December 2013 (USA)	-1	The Wolf of Wall Street	\N
432	Circumstances force a young divorcée to move back in with her parents in suburban Connecticut, where an affair with a younger guy rejuvenates her passion for life	95 min	http://ia.media-imdb.com/images/M/MV5BMzkzMDc0Nzg5OF5BMl5BanBnXkFtZTcwMDU0MzAyOA@@._V1_SY317_CR1,0,214,317_.jpg	31 January 2013 (Russia)	6	Hello I Must Be Going	\N
389	A look at the lives of the strong-willed women of the Weston family, whose paths have diverged until a family crisis brings them back to the Oklahoma house they grew up in, and to the dysfunctional woman who raised them.	130 min	http://ia.media-imdb.com/images/M/MV5BNzQ5ODE4NTcxNV5BMl5BanBnXkFtZTgwNjkyNDQ0MDE@._V1_SX214_.jpg	25 December 2013 (USA)	6.90000000000000036	August: Osage County	\N
390	A band of samurai set out to avenge the death and dishonor of their master at the hands of a ruthless shogun.		http://ia.media-imdb.com/images/M/MV5BMTc0MjE2NzE0OV5BMl5BanBnXkFtZTgwNTU5MjE1MDE@._V1_SX214_.jpg	25 December 2013 (USA)	-1	47 Ronin	\N
391	A pair of aging boxing rivals are coaxed out of retirement to fight one final bout -- 30 years after their last match.	113 min	http://ia.media-imdb.com/images/M/MV5BMTY3NTkxMTgzNV5BMl5BanBnXkFtZTgwNjg0MzE2MDE@._V1_SX214_.jpg	25 December 2013 (USA)	-1	Grudge Match	\N
392	An American girl, Isabella, sets out to make a documentary to understand what happened to her mother who murdered three clergy people. She was not convicted due to insanity and was sent to a mental hospital in Italy. Isabella meets with some priests in Italy who explain that her mother's condition may not be medical, but could be an extra-human possession. Written by Joy	83 min	http://ia.media-imdb.com/images/M/MV5BMTYwOTg1MTk0NF5BMl5BanBnXkFtZTcwMTA5NTI5Ng@@._V1_SY317_CR0,0,214,317_.jpg	6 January 2012 (USA)	4.09999999999999964	The Devil Inside	\N
393	For over 20 years, Jimmy Testagross has lived his childhood dream: being a roadie for his childhood heroes, Blue Oyster Cult. But the band's Arena-Rock glory days are a distant memory. County fairs and club gigs pay the bills. And Jimmy has become a casualty of these leaner times. With no place to go, no job prospects, and no real skills outside of being a roadie, Jimmy needs to regroup. So he returns to his childhood home in Queens, Ny. There, he revisits old relationships: his ailing, widower mom, a high school crush, a former nemesis and, most importantly, his relationship with himself. Jimmy, the middle-aged man-child, has never grown up. He still carries the resentments and frustrations of his youth, and has allowed them to fester and define who and what he is. Confronted with his mother's illness, Jimmy has a choice: let go of the past and take responsibility for both himself and the woman who raised and now needs him. Or continue to live a life of lies and frustration. Written by Gerald Cuesta	95 min	http://ia.media-imdb.com/images/M/MV5BMTA3MDQxNDc4MjheQTJeQWpwZ15BbWU3MDcxNjEzMDc@._V1_SX214_.jpg	6 January 2012 (USA)	5.59999999999999964	Roadie	\N
394	After watching their best friend get murdered, a group of teens struggle to expose a local hero as the vicious killer and keep from becoming his next victims.	96 min	http://ia.media-imdb.com/images/M/MV5BNzY1MjAzNTgzM15BMl5BanBnXkFtZTcwMzU5NzYxNw@@._V1_SY317_CR0,0,214,317_.jpg	22 March 2012 (Kuwait)	4.29999999999999982	Beneath the Darkness	\N
395	In the rural area around the Anatolian town of Keskin, the local prosecutor, police commissar, and doctor lead a search for a victim of a murder to whom a suspect named Kenan and his mentally challenged brother confessed. However, the search is proving more difficult than expected as Kenan is fuzzy as to the body's exact location. As the group continues looking, its members can't help but chat among themselves about both trivia and their deepest concerns in an investigation that is proving more trying than any of them expected. Written by Kenneth Chisholm (kchishol@rogers.com)	150 min	http://ia.media-imdb.com/images/M/MV5BMzg3OTMyODQ1M15BMl5BanBnXkFtZTcwNjMwMTEwNw@@._V1_SX214_.jpg	3 May 2012 (Portugal)	7.59999999999999964	Era Uma Vez na Anatólia	\N
396	Upon hearing the song "Norwegian Wood," Toru (Matsuyama) remembers back to his life in the 1960s, when his friend Kizuki killed himself and he grew close to Naoko, Kizuki's girlfriend. As the two try, in very different ways, to contend with their grief, Toru forms a bond with another woman, Midori. Written by Anonymous	133 min	http://ia.media-imdb.com/images/M/MV5BODQ3NTM0Nzg3OV5BMl5BanBnXkFtZTcwMTE3MDMxNw@@._V1_SX214_.jpg	11 December 2010 (Japan)	6.29999999999999982	Norwegian Wood	\N
397	Chris Faraday once smuggled illegal items or contraband into the country on freighters. He left that life behind, got married has a family and went legit. But when his brother-in-law got involved with Briggs, a drug dealer and when he blew a deal, Briggs demands restitution which he can't deliver. So Chris offers to find a way to pay him but the he threatens Chris' family if he doesn't deliver. So he gets on a freighter destined for Panama and he sets out to bring back some counterfeit currency. Briggs "goes to see" Chris' family. When Chris learns of this he asks his friend Sebastian to take care of them which he does. He tells Chris that it would be better to bring drugs instead of the cash. Written by rcs0411@yahoo.com	109 min	http://ia.media-imdb.com/images/M/MV5BMjE3NzY5NTg0OF5BMl5BanBnXkFtZTcwODk4MzgxNw@@._V1_SX214_.jpg	13 January 2012 (USA)	6.40000000000000036	Contraband	\N
398	"Joyful Noise" is the story of a small town choir out to win a national competition despite overwhelming odds. A story of faith and determination by the choir leaders (Queen Latifah and Dolly Parton) and the young talent who give their all to win God's praise and beat the competition for the grand prize. Written by Farrell Paura Productions	118 min	http://ia.media-imdb.com/images/M/MV5BMjEwNjAzMzUyN15BMl5BanBnXkFtZTcwMDUxNDQxNw@@._V1_SY317_CR0,0,214,317_.jpg	13 January 2012 (USA)	5.20000000000000018	Joyful Noise	\N
399	Elderly and a virtual prisoner in her own home due to her concerned staff and daughter Carol, Margaret Thatcher, Britain's first woman prime minister, looks back on her life as she clears out her late husband Denis's clothes for the Oxfam shop. Denis is seen as being her rock as she first enters parliament and then runs for the leadership of the Conservative Party, culminating in her eventual premiereship. Now his ghost joins her to comment on her successes and failures, sometimes to her annoyance, generally to her comfort until ultimately, as the clothes are sent to the charity shop, Denis departs from Margret's life forever. Written by don @ minifie-1	105 min	http://ia.media-imdb.com/images/M/MV5BODEzNDUyMDE3NF5BMl5BanBnXkFtZTcwMTgzOTg3Ng@@._V1_SX214_.jpg	13 January 2012 (USA)	6.29999999999999982	The Iron Lady	\N
400	Belle is a girl who is dissatisfied with life in a small provincial French town, constantly trying to fend off the misplaced "affections" of conceited Gaston. The Beast is a prince who was placed under a spell because he could not love. A wrong turn taken by Maurice, Belle's father, causes the two to meet. Written by Tim Pickett <quetzal@yoyo.cc.monash.edu.au>	84 min	http://ia.media-imdb.com/images/M/MV5BMTc0MzM1Njk1OV5BMl5BanBnXkFtZTcwNjQxMTkwNw@@._V1_SX214_.jpg	22 November 1991 (USA)	8	Beauty and the Beast	\N
401	Beth, a bookish teenager, befriends Emilia, an aspiring novelist who has just arrived in town. Emilia soon begins an affair with Beth's father that threatens to have devastating consequences.	90 min	http://ia.media-imdb.com/images/M/MV5BMjI3ODY3OTczNF5BMl5BanBnXkFtZTcwODkxNTE0Ng@@._V1_SX214_.jpg	14 October 2011 (UK)	6.09999999999999964	Albatross	\N
435	Four socially troubled 18-year-olds from the south of England go on holiday to Malia.	97 min	http://ia.media-imdb.com/images/M/MV5BMTM3NjcxMDg3NF5BMl5BanBnXkFtZTcwMTMzMDQxNw@@._V1_SX214_.jpg	17 August 2011 (UK)	6.70000000000000018	The Inbetweeners Movie	\N
402	After a nuclear attack, seven dwellers of an apartment building seek refugee in a bunker in the basement of the building where the super, Mickey, lives. He rations water and supplies among the group formed by Eva and her boyfriend Sam; the gays Bobby and Josh and his brother Adrien; Marilyn and her daughter Wendi; and Delvin. When five invaders break into their shelter wearing protective clothing and breathing apparatuses, they abduct Wendi but the survivors succeed in killing two of the men. Josh wears the only clothing that was not damaged and discovers a strange research center where he finds Wendi contained in some kind of stasis device along with other children apparently collected by the unknown men in suits. He is discovered and ends up shoots at three men and returns to the shelter. Soon the group learns that the invaders have welded their access door from outside and they are trapped inside the bunker. Marilyn and Sam get crazy and the tense situation and the lack of water ... Written by Claudio Carvalho, Rio de Janeiro, Brazil	112 min	http://ia.media-imdb.com/images/M/MV5BMjMwNjcxODY5OV5BMl5BanBnXkFtZTcwMDA1OTg4Ng@@._V1_SX214_.jpg	6 September 2012 (Portugal)	5.79999999999999982	Os Humanos	\N
403	A young pickpocket in the New York subways, living a fast, free, lifestyle is confronted by a woman whom he had a one night affair with, she informs him that she is now pregnant with his child, he must now choose between continuing the lifestyle he lead or take responsibility for his actions. Written by Anonymous	89 min	http://ia.media-imdb.com/images/M/MV5BMTcyMzY5MjMxMl5BMl5BanBnXkFtZTcwOTM5MjY2Ng@@._V1_SX214_.jpg	9 November 2011 (USA)	6	Loosies	\N
404	Eva Khatchadourian is trying to piece together her life following the "incident". Once a successful travel writer, she is forced to take whatever job comes her way, which of late is as a clerk in a travel agency. She lives a solitary life as people who know about her situation openly shun her, even to the point of violent actions toward her. She, in turn, fosters that solitary life because of the incident, the aftermath of which has turned her into a meek and scared woman. That incident involved her son Kevin Khatchadourian, who is now approaching his eighteenth birthday. Eva and Kevin have always had a troubled relationship, even when he was an infant. Whatever troubles he saw, Franklin, Eva's complacent husband, just attributed it to Kevin being a typical boy. The incident may be seen by both Kevin and Eva as his ultimate act in defiance against his mother. Written by Huggo	112 min	http://ia.media-imdb.com/images/M/MV5BMjE0NDE0MjYxNF5BMl5BanBnXkFtZTcwNjM2NTY5Ng@@._V1_SY317_CR1,0,214,317_.jpg	3 May 2012 (Portugal)	7.5	We Need to Talk About Kevin	\N
405	A young band heads to the woods in order to focus on writing new songs. Hoping to emerge with new music that will score them their big break, they instead find themselves in the middle of a nightmare beyond comprehension.	83 min	http://ia.media-imdb.com/images/M/MV5BNTQ3MDMwNjQ3OV5BMl5BanBnXkFtZTcwNjA4MzQyNw@@._V1_SX214_.jpg	16 April 2010 (USA)	2.60000000000000009	Don't Go in the Woods	\N
406	Mankind discover the existence of the Vampire and Lycan species and they begin a war to annihilate the races. When Selene meets with Michael in the harbor, they are hit by a grenade and Selene passes out. Twelve years later, Selene awakes from a cryogenic sleep in the Antigen laboratory and meets the Vampire David. She learns that she had been the subject of the scientist Dr. Jacob Lane and the Vampire and Lycan species have been practically eradicated from Earth. But Selene is still connected to Michael and has visions that she believes that belongs to Michael's sight. However she has a surprise and finds that she has a powerful daughter named Eve that has been raised in the laboratory. Now Selene and David have to protect Eve against the Lycans that intend to use her to inoculate their species against silver. Written by Claudio Carvalho, Rio de Janeiro, Brazil	88 min	http://ia.media-imdb.com/images/M/MV5BMjAxMjc0ODk0OF5BMl5BanBnXkFtZTcwMTc5NDQwNw@@._V1_SY317_CR0,0,214,317_.jpg	20 January 2012 (USA)	6.29999999999999982	Underworld: Awakening	\N
407	Freelance covert operative Mallory Kane is hired out by her handler to various global entities to perform jobs which governments can't authorize and heads of state would rather not know about. After a mission to rescue a hostage in Barcelona, Mallory is quickly dispatched on another mission to Dublin. When the operation goes awry and Mallory finds she has been double crossed, she needs to use all of her skills, tricks and abilities to escape an international manhunt, make it back to the United States, protect her family, and exact revenge on those that have betrayed her. Written by Anonymous	93 min	http://ia.media-imdb.com/images/M/MV5BMjI2MjIxOTUwN15BMl5BanBnXkFtZTcwNDM5NjcxNw@@._V1_SX214_.jpg	20 January 2012 (USA)	5.79999999999999982	Haywire	\N
408	The citizens of Rome are hungry. Coriolanus, the hero of Rome, a great soldier and a man of inflexible self-belief despises the people. His extreme views ignite a mass riot. Rome is bloody. Manipulated and out-maneuvered by politicians and even his own mother Volumnia, Coriolanus is banished from Rome. He offers his life or his services to his sworn enemy Tullus Aufidius. Written by Icon Entertainment	123 min	http://ia.media-imdb.com/images/M/MV5BMTcyMjAwMjA2N15BMl5BanBnXkFtZTcwOTI0MjA0Ng@@._V1_SY317_CR0,0,214,317_.jpg	22 March 2012 (Portugal)	6.09999999999999964	Coriolanus	\N
409	Italy, 1944. As the war takes its toll on Allied forces in Europe, a squadron of black pilots known as the Tuskegee Airmen are finally given the chance to prove themselves in the sky - even as they battle discrimination on the ground. It's a tribute to the unsung heroes who rose above extraordinary challenges and ultimately soared into history. Written by 20th Century Fox	125 min	http://ia.media-imdb.com/images/M/MV5BNDQ5MTg2NzI4OF5BMl5BanBnXkFtZTcwMDM2NzQzNg@@._V1_SY317_CR0,0,214,317_.jpg	20 January 2012 (USA)	5.79999999999999982	Red Tails	\N
410	In 1937 China, during the second Sino-Japanese war, a mortician, John (Christian Bale) arrives at a Catholic church in Nanjing to prepare a priest for burial. Upon arrival he finds himself the lone adult among a group of convent girl students and prostitutes from a nearby brothel. When he finds himself in the unwanted position of protector of both groups from the horrors of the invading Japanese army, he discovers the meaning of sacrifice and honor. Written by msmith5484	146 min	http://ia.media-imdb.com/images/M/MV5BMjE3OTUzODA3Ml5BMl5BanBnXkFtZTcwNDk5NTUyNw@@._V1_SY317_CR0,0,214,317_.jpg	2 August 2012 (Portugal)	7.5	As Flores da Guerra	\N
411	At 23, Laura Guerro and her friend Suzu enter the Miss Baja pageant. Both qualify, and while Laura waits at a nightclub for Suzu to break away so they can go shopping, a heavily-armed drug gang murders drug enforcement officials there. Laura escapes unharmed but can't find Suzu, so the next day she looks for her; her dogged behavior brings her to the cartel's attention, and they force her to assist them as they menace her father and younger brother. Lino, the gang's leader, decides Laura should finish the pageant although her only interest is escape. Every day drags her deeper and corruption is pervasive. What alternative is there to death or prison? Written by <jhailey@hotmail.com>	113 min	http://ia.media-imdb.com/images/M/MV5BMjIyMTY1NTg1Nl5BMl5BanBnXkFtZTcwMjU1OTIyNw@@._V1_SX214_.jpg	9 September 2011 (Mexico)	6.40000000000000036	Miss Bala	\N
412	In Crazy Horse, he pulls back the curtain on Le Crazy Horse de Paris, a landmark that has prided itself as "the best nude dancing show in the world" since 1951. Le Crazy Horse sets itself apart from the average strip club by adhering to exacting standards in choreography, lights and physiques. The erotic revue is composed of songs and sequences that blend traits of old-fashioned burlesque, Bob Fosse and Cirque du Soleil, designed not only for the enjoyment of men, but also couples. Written by TIFF	134 min	http://ia.media-imdb.com/images/M/MV5BMjA0NzE0MDM2NF5BMl5BanBnXkFtZTcwMTIwMDUyNw@@._V1_SX214_.jpg	27 October 2011 (Portugal)	6.20000000000000018	Crazy Horse	\N
413	Towards the end of the Korean War an uneasy ceasefire is ordered, but out on the Eastern front line of the Aerok Hills fierce fighting continues. A race to capture a strategic point to determine a new border between the two Koreas is the ultimate prize. A bullet is then found in the body of dead company commander of the South Korean army. The bullet that killed the company commander belongs to the South Korean army. Lieutenant of the Defense Security Command Kang Eun-Pyo is ordered to go out into the Eastern front line and investigate the murder. When Kang Eun-Pyo arrives in the Aerok Hills he is surprised to find his old friend Kim Soo-Hyeok commanding troops in the Aerok Hills. Kang Eun-Pyo believed Kim Soo-Hyeok was dead. In their younger years, Kim Soo-Hyeok was a meek student, but he eventually became the leader of Aerok company as a lieutenant. The situation in the Aerok company raises many flags in the eyes of Kang Eun-Pyo. Soldiers wear North Korean uniforms inside due to the ... Written by Stanislav S, Sochi, Russia	133 min	http://ia.media-imdb.com/images/M/MV5BMzM1NzM2NzM0NF5BMl5BanBnXkFtZTcwMzY0NDUyNw@@._V1_SY317_CR0,0,214,317_.jpg	20 July 2011 (South Korea)	7.09999999999999964	The Front Line	\N
414	If Carol Channing didn't exist, no one could have made her up. One in a billion, Carol , at 89, remains an unstoppable, megawatt dynamo. Broadway diva extraordinaire is just the icing. Carol Channing hovered at the pinnacle of the entertainment world from the late-1950's through the 1960's and beyond, living life sensationally large. As Carol has observed, '...if you're lucky enough to have two hit shows, the world passes through your dressing room'. At 89, she remains irrepressible. Written by Anonymous	87 min	http://ia.media-imdb.com/images/M/MV5BMTk2NTEzMjc0MV5BMl5BanBnXkFtZTcwODAxMTgxNw@@._V1_SX214_.jpg	20 January 2012 (USA)	6.90000000000000036	Carol Channing: Larger Than Life	\N
415	Using archival footage of and interviews about fashion designer and icon Halston (1932-1990), Whitney Smith looks at the 1970s in Manhattan. Smith is interested in the parties and the excess, which contrast with Halston's minimalist lines. There is a rough chronology for Halston: from milliner to couture to an unsuccessful attempt to bring his designs to the customers of J.C. Penney. The principal focus is on the world of Studio 54 and Halston's part in it. Written by <jhailey@hotmail.com>	85 min	http://ia.media-imdb.com/images/M/MV5BOTg5ODQ1MzI0OV5BMl5BanBnXkFtZTcwMzA2NTUxNw@@._V1_SX214_.jpg	23 September 2011 (UK)	5.29999999999999982	Ultrasuede: In Search of Halston	\N
416	In Alaska, a team of oil workers board a flight home; however, they cross a storm and the airplane crashes. Only seven workers survive in the wilderness and John Ottway, who is a huntsman that kills wolves to protect the workers, assumes leadership of the group. Shortly after they learn that they are surrounded by a pack of wolves and Ottway advises that they should seek protection in the woods. But while they walk through the heavy snow, they are chased and attacked by the carnivorous mammals. Written by Claudio Carvalho, Rio de Janeiro, Brazil	117 min	http://ia.media-imdb.com/images/M/MV5BNDY4MTQwMzc1MV5BMl5BanBnXkFtZTcwNzcwNTM5Ng@@._V1_SX214_.jpg	27 January 2012 (USA)	6.79999999999999982	The Grey	\N
417	After losing her job, Jersey girl Stephanie Plum is broke. Needing a job she is told that her cousin, a bail bondsman, needs someone to help out in the office. But the only job openings he has are for skip tracers. She learns that Joe Morelli, a guy she knew intimately years ago, is one of the "skips". She eventually finds him but wasn't really prepared so he gets away. Another bounty hunter, Ranger, tries to teach her. Eventually she finds Morelli again, but he claims he is innocent of the crime he is accused of and he is trying to prove his innocence. Eventually Stephanie thinks he's telling the truth so she stakes out the person who can help him. She only finds herself in trouble and Morelli saves her. She tries to find someone who can prove his innocence, but the problem is that shortly after meeting with them they're killed or attacked. Written by rcs0411@yahoo.com	91 min	http://ia.media-imdb.com/images/M/MV5BMTU2NzMxMDU1NF5BMl5BanBnXkFtZTcwNzYxNTA2Ng@@._V1_SX214_.jpg	27 January 2012 (USA)	5.09999999999999964	One for the Money	\N
418	In 19th century Dublin, Albert Nobbs, an eccentric man in the latter part of middle age, works as a waiter in Morrison's Hotel run by the stingy and controlling Marge Baker. Albert is hard working and saves his money so that one day he will be able to eke out a better life for himself by owning his own business rather than work at the hotel. Beyond his work colleagues, he is all alone in the world. One day, a man named Hubert Page is hired by Mrs. Baker to paint one of the rooms in the hotel. She forces Hubert to share Albert's bed for the one night he is required to stay to complete the work, much to Albert's horror. Hubert discovers the reason Albert did not want to share a room with him. But rather than the issue being a problem, Hubert shows Albert that he can follow a slightly different life path than the one he envisioned for himself - one closer to the life that Hubert leads with his wife Cathleen - which includes getting married and having a wife to support him emotionally. ... Written by Huggo	113 min	http://ia.media-imdb.com/images/M/MV5BMTM1MjU1NTYzMV5BMl5BanBnXkFtZTcwODk2NzAwNw@@._V1_SX214_.jpg	23 February 2012 (Portugal)	6.5	Albert Nobbs	\N
419	An ex-cop turned con threatens to jump to his death from a Manhattan hotel rooftop. The nearest New York Police officer immediately responds to a screaming woman and calls dispatch. More Officers arrive with SWAT and tactical command along with fire-fighters. The police then dispatches a female police psychologist personally requested to talk him down from the ledge. However, things aren't as straightforward and clearcut as they appear to be. Written by Anonymous	102 min	http://ia.media-imdb.com/images/M/MV5BMTc5MTE4MzY2N15BMl5BanBnXkFtZTcwNjMwNDc3Ng@@._V1_SX214_.jpg	27 January 2012 (USA)	6.5	Man on a Ledge	\N
420	Roméo and Juliette are two young actors. They fall in love at first sight, move in together and make a baby. A love story and the founding of a home like millions of others. Except that their little boy, Adam, behaves abnormally. The young parents try hard to persuade themselves that everything is okay but, with the passing of time, they cannot delude themselves anymore : their son has problem. Their fears are unfortunately confirmed : Adam suffers from a malignant brain tumor. From now on, war is declared. A war against illness. A war against Death. A war against despair. Written by Guy Bellinger	100 min	http://ia.media-imdb.com/images/M/MV5BMTU1NjI1Mjg3Ml5BMl5BanBnXkFtZTcwMDk0ODAxNw@@._V1_SX214_.jpg	23 February 2012 (Portugal)	6.90000000000000036	Declaração de Guerra	\N
421	Young Christians Beth and Steve, a gospel singer and her cowboy boyfriend, leave Texas to preach door-to-door in Scotland . When, after initial abuse, they are welcomed with joy and elation to Tressock, the border fiefdom of Sir Lachlan Morrison, they assume their hosts simply want to hear more about Jesus. How innocent and wrong they are. Written by Anonymous	96 min	http://ia.media-imdb.com/images/M/MV5BMTkyNzkyODE5N15BMl5BanBnXkFtZTcwNjUxNzIxNw@@._V1_SX214_.jpg	27 January 2012 (USA)	4	The Wicker Tree	\N
422	Layered romantic drama The Words follows young writer Rory Jansen who finally achieves long sought after literary success after publishing the next great American novel. There's only one catch - he didn't write it. As the past comes back to haunt him and his literary star continues to rise, Jansen is forced to confront the steep price that must be paid for stealing another man's work, and for placing ambition and success above life's most fundamental three words. Written by Anonymous	102 min	http://ia.media-imdb.com/images/M/MV5BMTM2NjgyMjI3OV5BMl5BanBnXkFtZTcwMDkxMjIyOA@@._V1_SX214_.jpg	7 September 2012 (USA)	6.90000000000000036	The Words	\N
425	After his family is kidnapped during their sailing trip in Spain, a young Wall Street trader is confronted by the people responsible: intelligence agents looking to recover a mysterious briefcase.	93 min	http://ia.media-imdb.com/images/M/MV5BMTQzODQ4NjAxMF5BMl5BanBnXkFtZTcwMzAwNjM0Nw@@._V1_SY317_CR0,0,214,317_.jpg	7 September 2012 (USA)	4.79999999999999982	The Cold Light of Day	\N
428	On the night of one of their old high school friend's wedding three irresponsible and capricious bridesmaids reunite for one last bachelorette bacchanal in the Big Apple. They unintentionally create a mess of their best friend Becky's wedding dress, before she marries her sweetheart Dale. They attempt to repair the situation by spending the evening before and morning of the wedding desperate to get the dress to Becky on time before the wedding starts, whilst discovering themselves and what they truly want from their lives along the way. Written by Angel Youles	87 min	http://ia.media-imdb.com/images/M/MV5BNzk3MjA1NzE5OV5BMl5BanBnXkFtZTcwNTQ0NTcxOA@@._V1_SX214_.jpg	6 September 2012 (Russia)	5.20000000000000018	Bachelorette	\N
474	Robert Miller is a successful financial businessman with a loving wife and a smart daughter ready to take over the family business. Professional secrets involving illegal fraudulent activities start coming out at the same time that Robert's personal secrets take a turn for the worse and threaten to derail everything he has achieved. Written by napierslogs	107 min	http://ia.media-imdb.com/images/M/MV5BODU5ODYyNzM1MF5BMl5BanBnXkFtZTcwNDEwNTQwOA@@._V1_SX214_.jpg	14 September 2012 (USA)	6.70000000000000018	Arbitrage	\N
439	It's 1997 and New York City is in a state of intense flux when documentary filmmaker Erik Rothman (Thure Lindhardt) first meets Paul Lucy (Zachary Booth), a handsome but closeted lawyer in the publishing field. What begins as a highly charged first encounter soon becomes something much more, and a relationship quickly develops. As the two men start building a home and life together, each continues to privately battle their own compulsions and addictions. A film about sex, friendship, intimacy and most of all, love, Keep the Lights On takes an honest look at the nature of relationships in our times. Written by Anonymous	101 min	http://ia.media-imdb.com/images/M/MV5BNDU0MDM1MTU0MV5BMl5BanBnXkFtZTcwNjI0MDgxOA@@._V1_SY317_CR0,0,214,317_.jpg	27 July 2012 (Taiwan)	6	Keep the Lights On	\N
443	The action now takes place miles away from the original location and partly in broad daylight, giving the film an entirely fresh yet disturbing new reality. The infection has left the building. In a clever twist that draws together the plots of the first two movies, this third part of the saga also works as a decoder to uncover information hidden in the first two films and leaves the door open for the final installment, the future '[REC] 4 Apocalypse.' Written by www.dreadcentral.com	80 min	http://ia.media-imdb.com/images/M/MV5BNDM3OTUzMTA1OF5BMl5BanBnXkFtZTcwNTkwMTE3Nw@@._V1_SY317_CR4,0,214,317_.jpg	11 October 2012 (Portugal)	5.09999999999999964	[REC]³ Genesis	\N
446	A struggling musician takes an overnight long-distance drive in order to fight his estranged wife for custody of their young daughter.	94 min	http://ia.media-imdb.com/images/M/MV5BMjMxOTg2OTExOF5BMl5BanBnXkFtZTcwMDA0MjYyOA@@._V1_SX214_.jpg	19 September 2012 (France)	5.59999999999999964	For Ellen	\N
448	Set in a dystopian future where corporate brands have created a disillusioned population, one man's effort to unlock the truth behind the conspiracy will lead to an epic battle with hidden forces that control the world.	106 min	http://ia.media-imdb.com/images/M/MV5BMTk1NjI3NzQ5NF5BMl5BanBnXkFtZTcwNjMyNjM5Nw@@._V1_SX214_.jpg	7 September 2012 (USA)	4.5	Branded	\N
451	Raised in the Tennessee mountains, Wayne White started his career as a cartoonist in NYC. He quickly found success as one of the creators of the Pee-wee's Playhouse TV show which soon led to more work design some of the most arresting and iconic images in pop culture. Recently his word paintings featuring pithy and and often sarcastic text statements finely crafted onto vintage landscape paintings have made him a darling of the fine art world. The movie chronicles the vaulted highs and crushing lows of an artist struggling to find peace and balance between his professional work and his personal art. This is especially complicated for a man who struggles with the virtues he most often mocks in his art...Vanity, ego and fame. Written by Neil Berkeley	88 min	http://ia.media-imdb.com/images/M/MV5BMTQwNTM2OTM4NV5BMl5BanBnXkFtZTcwNjUzMjQ4Nw@@._V1_SX214_.jpg	10 March 2012 (USA)	7	Beauty Is Embarrassing	\N
453	A documentary on the modeling industry's 'supply chain' between Siberia, Japan, and the U.S., told through the experiences of the scouts, agencies, and a 13-year-old model.	78 min	http://ia.media-imdb.com/images/M/MV5BMjAyNjAyODcwNV5BMl5BanBnXkFtZTcwNDY4ODQzOA@@._V1_SY317_CR3,0,214,317_.jpg	10 February 2012 (Ireland)	6.5	Girl Model	\N
456	In an attic full of discarded junk, a pretty doll called Buttercup lives in an old trunk together with her friends, the marionette Sir Handsome, the lovable Teddy Bear, a Mechanical Mouse and the plasticine creature, Laurent. When Buttercup is snatched and taken off to the Land of Evil, her pals set out on a wondrous and daring adventure to rescue her from the all-powerful Head of State. Written by Karlovy Vary International Film Festival	80 min	http://ia.media-imdb.com/images/M/MV5BMzg5NjUyODQ5MV5BMl5BanBnXkFtZTcwMTA2OTkzNw@@._V1_SX214_.jpg	5 March 2009 (Czech Republic)	6.20000000000000018	Toys in the Attic	\N
470	Returning from Navy service in World War II, Freddie Quell drifts through a series of breakdowns. Finally he stumbles upon a cult which engages in exercises to clear emotions and he becomes deeply involved with them. Written by Alan Young, edit Hal Issen	144 min	http://ia.media-imdb.com/images/M/MV5BMTgxMjY1OTk4MV5BMl5BanBnXkFtZTcwOTQ3NDMxOQ@@._V1_SY317_CR6,0,214,317_.jpg	21 September 2012 (USA)	7.09999999999999964	The Master	\N
471	Alice awakes at home with her daughter Becky and her husband. But soon she realizes that she is actually in an Umbrella Corporation's underground facility. Out of the blue, the computer security system shuts-down and Alice flees to the central control room of the facility. She meets Ada Wong, who works with Albert Wesker, and she learns that a five-man team has been sent by Wesker to rescue them. However, the Red Queen sends Jill Valentine and Rain to hunt them down. Written by Claudio Carvalho, Rio de Janeiro, Brazil	96 min	http://ia.media-imdb.com/images/M/MV5BMTA2NTkwNjUxNTZeQTJeQWpwZ15BbWU3MDE2OTMxMTg@._V1_SX214_.jpg	14 September 2012 (USA)	5.20000000000000018	Resident Evil: Retaliação	\N
472	A clown fish named Marlin lives in the Great Barrier Reef loses his son, Nemo. After he ventures into the open sea, despite his father's constant warnings about many of the ocean's dangers. Nemo is abducted by a boat and netted up and sent to a dentist's office in Sydney. So, while Marlin ventures off to try to retrieve Nemo, Marlin meets a fish named Dory, a blue tang suffering from short-term memory loss. The companions travel a great distance, encountering various dangerous sea creatures such as sharks, anglerfish and jellyfish, in order to rescue Nemo from the dentist's office, which is situated by Sydney Harbor. While the two are doing this, Nemo and the other sea animals in the dentist's fish tank plot a way to return to Sydney Harbor to live their lives free again. Written by Anonymous	100 min	http://ia.media-imdb.com/images/M/MV5BMTY1MTg1NDAxOV5BMl5BanBnXkFtZTcwMjg1MDI5Nw@@._V1_SY317_CR0,0,214,317_.jpg	30 May 2003 (USA)	8.09999999999999964	Finding Nemo	\N
473	Thirty-five year old Jesse Fisher, an admissions officer at a New York City post-secondary institution he who loves English and literature, has somewhat lost his passion in life, which includes recently being unceremoniously dumped by his latest girlfriend, who could no longer be the person to prop him up emotionally. He has a chance to find that passion again when he is invited to the retirement dinner of his second favorite Ohio University college professor, Peter Hoberg, as his time there was when his life held the most passion. Jesse's encounters with five people there may determine if he does find that passion again. They are: Hoberg, who is resisting the notion of retirement; Judith Fairfield, Jesse's favorite professor, although for a different reason than his like of Hoberg; Nat, a free spirit who navigates life at the institution on his own terms; undergraduate student Dean, who Jesse sees as a younger more destructive version of himself; and nineteen year old undergraduate ... Written by Huggo	97 min	http://ia.media-imdb.com/images/M/MV5BMTY4Njk3MjE2N15BMl5BanBnXkFtZTcwNzg5OTIyOA@@._V1_SY317_CR0,0,214,317_.jpg	5 October 2012 (UK)	6.70000000000000018	Liberal Arts	\N
475	The night before their high school reunion, a group of friends realize they still haven't quite grown up in some ways.	100 min	http://ia.media-imdb.com/images/M/MV5BNTY3NTY3ODAzOF5BMl5BanBnXkFtZTcwMTI4MDQyOA@@._V1_SX214_.jpg	13 December 2012 (Russia)	6	10 Years	\N
486	When Camille accidentally becomes pregnant, 16 of her friends and classmates decide to follow suit, throwing their town and school into chaos.	86 min	http://ia.media-imdb.com/images/M/MV5BMjMxMzAxNDcyNV5BMl5BanBnXkFtZTcwODM4MDQyOA@@._V1_SY317_CR0,0,214,317_.jpg	21 September 2012 (USA)	5.79999999999999982	17 Raparigas	\N
476	In New Orleans, the notorious bank thief and family man Will Montgomery steals $10m with his partners Vincent, Riley Jeffers and Hoyt. However, he has an argument with Vincent in the runaway and Hoyt leaves Will behind. He tries to flee but the FBI agent Tim Harlend organizes a manhunt and Will is captured, but he burns the stolen money to get rid of the evidences against him. Eight years later, Will leaves the prison and he goes to the house of his teenage daughter Alison Loeb, who has issues against him. Alison leaves Will alone in a coffee shop and takes a cab to go to a session with her shrink. However, a couple of minutes later, Will receives a phone call from Vincent, who is presumed dead, telling that he has abducted Alison and will kill her unless he receives the $10m of the last robbery. Now Will has twelve hours to find a way to rescue his daughter from the hands of the psychopath Vincent. Written by Claudio Carvalho, Rio de Janeiro, Brazil	96 min	http://ia.media-imdb.com/images/M/MV5BNzY0ODM1NzU0OV5BMl5BanBnXkFtZTcwNTExNjIyOA@@._V1_SX214_.jpg	6 September 2012 (United Arab Emirates)	5.40000000000000036	Stolen	\N
477	Walter is a professional killer and has messed up a job. He has to leave the city and takes up an offer of crime boss Berger to protect Berger's house in a remote region of the Carpathian Mountains. At his side: old friend Mickey. By accident Berger's young wife Sybille is killed and Walter and Mickey hide her body because they fear Berger's vengeance. What seemed to be a nice holiday trip with little work for Walter and Mickey soon becomes a fight for survival for all parties involved. Written by Anonymous	95 min	http://ia.media-imdb.com/images/M/MV5BMTQzODE4MTcxOF5BMl5BanBnXkFtZTcwMjE4NjMxMw@@._V1_SY317_CR5,0,214,317_.jpg	30 September 2010 (Germany)	6	Snowman's Land	\N
478	The future America is an irradiated waste land. On its East Coast, running from Boston to Washington DC, lies Mega City One - a vast, violent metropolis where criminals rule the chaotic streets. The only force of order lies with the urban cops called "Judges" who possess the combined powers of judge, jury and instant executioner. Known and feared throughout the city, Dredd is the ultimate Judge, challenged with ridding the city of its latest scourge - a dangerous drug epidemic that has users of "Slo-Mo" experiencing reality at a fraction of its normal speed. During a routine day on the job, Dredd is assigned to train and evaluate Cassandra Anderson, a rookie with powerful psychic abilities thanks to a genetic mutation. A heinous crime calls them to a neighborhood where fellow Judges rarely dare to venture - a 200 storey vertical slum controlled by prostitute turned drug lord Ma-Ma and her ruthless clan. When they capture one of the clan's inner circle, Ma-Ma overtakes the compound's ... Written by Production	95 min	http://ia.media-imdb.com/images/M/MV5BODkyNDQzMzUzOF5BMl5BanBnXkFtZTcwODYyMDEyOA@@._V1_SX214_.jpg	21 September 2012 (USA)	7	Dredd	\N
479	In South Central Los Angeles, street cops Brian and Mike are partners - balls-out cowboys patrolling the streets as Latino gangs are in a power struggle with Blacks. Brian and Mike get lucky a couple of times, making big drug and human-trafficking busts, so a Mexican cartel orders their deaths. We meet Mike's pregnant wife (whom he married out of high school) and watch Brian's search for a soul mate. There are internal squabbles within the ranks of the LAPD and lots of squad-car conversation. Can the lads escape the cartel's murderous reach? Written by <jhailey@hotmail.com>	109 min	http://ia.media-imdb.com/images/M/MV5BMjMxNjU0ODU5Ml5BMl5BanBnXkFtZTcwNjI4MzAyOA@@._V1_SX214_.jpg	21 September 2012 (USA)	7.59999999999999964	End of Watch	\N
480	Newly divorced Sarah and her daughter Elissa find the house of their dreams in a small, upscale, rural town. But when startling and unexplainable events begin to happen, Sarah and Elissa learn the town is in the shadows of a chilling secret. Written by Relativity	101 min	http://ia.media-imdb.com/images/M/MV5BMjIxNTUwNTU4N15BMl5BanBnXkFtZTcwNTE0MTI3Nw@@._V1_SX214_.jpg	21 September 2012 (USA)	5.40000000000000036	House at the End of the Street	\N
481	Gus is a baseball scout. The team he works for thinks he should retire. He asks them to let him do one more scouting job to prove himself. His friend, Pete, asks Gus's estranged daughter, Mickey, if she could go with him to make sure he's OK as his eyes are failing. The doctor tells Gus he should get his eyes treated but he insists on doing his scouting assignment, which takes him to North Carolina. Mickey decides to put her work on hold to go with him and she wants him to explain why he pushed her away. Whilst there he runs into Johnny, a scout from another team who was a promising player Gus once scouted. Johnny and Mickey take an interest in each other. Written by rcs0411@yahoo.com	111 min	http://ia.media-imdb.com/images/M/MV5BMTUwNjMyMzQ3M15BMl5BanBnXkFtZTcwMjcwNDMyOA@@._V1_SY317_CR0,0,214,317_.jpg	21 September 2012 (USA)	6.70000000000000018	Trouble with the Curve	\N
482	Based on the novel written by Stephen Chbosky, this is about 15-year-old Charlie (Logan Lerman), an endearing and naive outsider, coping with first love (Emma Watson), the suicide of his best friend, and his own mental illness while struggling to find a group of people with whom he belongs. The introvert freshman is taken under the wings of two seniors, Sam and Patrick, who welcome him to the real world. Written by Anonymous	102 min	http://ia.media-imdb.com/images/M/MV5BMzIxOTQyODU1OV5BMl5BanBnXkFtZTcwMDQ4Mjg4Nw@@._V1_SY317_CR0,0,214,317_.jpg	12 October 2012 (USA)	8	The Perks of Being a Wallflower	\N
483	In the early years of the AIDS epidemic, the disease was considered a death sentence affecting communities, like the LGBT ones, whom many in power felt deserved it. This film tells the story of how militant activists like ACT-UP and TAG pushed for a meaningful response to this serious public health problem. As the activists struggled against political indifference, religious hostility, corporate greed and apparently skewed scientific research priorities with determination and sheer audacity, they produced a political wave that would lead to not only an effective treatment regime, but would advance LGBT rights beyond anyone's expectations. Written by Kenneth Chisholm (kchishol@rogers.com)	110 min	http://ia.media-imdb.com/images/M/MV5BMTg2NTEyNTE3NF5BMl5BanBnXkFtZTcwNjY3NzM0OA@@._V1_SY317_CR0,0,214,317_.jpg	8 November 2013 (UK)	7.29999999999999982	How to Survive a Plague	\N
484	For decades, Diana Vreeland was one of the leading authorities in fashion through eccentric self-taught skill and a bold stylistic audacity. This film guides you through this fashion pioneer's long career from her youth in Paris until she became a leading magazine fashion columnist and editor. In this medium, Vreeland challenged its preconceptions to present a new definition of beauty and vivaciousness where nice clothes were just the beginning for something deeper. Even when that vocation ended, Vreeland managed to gain a new museum profession to present clothing's history in her own inimitable way. Written by Kenneth Chisholm (kchishol@rogers.com)	86 min	http://ia.media-imdb.com/images/M/MV5BMzM5NTY3Mzg2NF5BMl5BanBnXkFtZTcwMzczOTU0OA@@._V1_SX214_.jpg	21 September 2012 (UK)	6.5	Diana Vreeland: The Eye Has to Travel	\N
485	A drama centered on a troubled young woman who moves to San Francisco, where she gets involved in pornography and aligns herself with a cocaine-addicted lawyer.	98 min	http://ia.media-imdb.com/images/M/MV5BMTM4MTA3MTk0MF5BMl5BanBnXkFtZTcwNDI0NjAyOA@@._V1_SY317_CR0,0,214,317_.jpg	21 December 2012 (Turkey)	4.70000000000000018	About Cherry	\N
488	When a fiercely competitive 30 year old rower fails to make the Olympic boat for the second time, she takes a coaching job at a school but struggles to adjust to life off the race course.	89 min	http://ia.media-imdb.com/images/M/MV5BMTM1MzI2OTA5MV5BMl5BanBnXkFtZTcwMjkxMjIyOA@@._V1_SX214_.jpg	21 September 2012 (USA)	4.90000000000000036	Backwards	\N
489	A woman's idyllic life is shattered when her husband is killed in a senseless act of violence. As she prepares to take matters into her own hands, two unexpected encounters begin to change everything.	92 min	http://ia.media-imdb.com/images/M/MV5BMjcyNjY1NzYzOV5BMl5BanBnXkFtZTcwMzQyOTUzOA@@._V1_SY317_CR0,0,214,317_.jpg	21 September 2012 (USA)	6.5	Unconditional	\N
490	In the year 2044, a man working for a group of killers called "Loopers" (they work for the mob and kill people who are sent blindfolded back in time from the year 2074 by their bosses) recognizes a victim as himself. He hesitates resulting in the escape of his older self. Written by malachmcfreak	119 min	http://ia.media-imdb.com/images/M/MV5BMTY3NTY0MjEwNV5BMl5BanBnXkFtZTcwNTE3NDA1OA@@._V1_SY317_CR15,0,214,317_.jpg	28 September 2012 (USA)	7.5	Looper	\N
491	In 1895, Dracula builds a resort in Transylvania, hidden from the humans, to raise his beloved daughter Mavis in a safe environment. In the present days, the place is the Hotel Transylvania, where monsters bring their families to spend vacation far from the frightening humans. Dracula invites his friends - Frankenstein and his wife Eunice; Wayne and Wanda, the werewolves; Griffin, the invisible man; Murray, the mummy; the Bigfoot, among others - to celebrate the 118th birthday of Mavis. When the party is ready to start, the 21-year-old Jonathan is walking through the forest and stumbles at the hotel. Dracula sees Jonathan and disguises him as a monster to hide Jonathan from the guests. But Mavis also sees Jonathan and Dracula forces him to pose of a monster. Soon Mavis believes that Jonathan is the "zing" of her life despite the advices of her father about the humans. Written by Claudio Carvalho, Rio de Janeiro, Brazil	91 min	http://ia.media-imdb.com/images/M/MV5BMTM3NjQyODI3M15BMl5BanBnXkFtZTcwMDM4NjM0OA@@._V1_SX214_.jpg	28 September 2012 (USA)	7	Hotel Transylvania	\N
492	Two determined mothers with children who are failing in an inner city school in Pittsburgh join forces to take back the school, and turn it into a place of learning. But before they can change the school for the better, they must first battle the parents, the school board, and the teachers union. Because this is for their children, they won't back down from this enormous challenge. Written by Douglas Young (the-movie-guy)	121 min	http://ia.media-imdb.com/images/M/MV5BMTg2NzUyMzYxOF5BMl5BanBnXkFtZTcwOTc4NzY5Nw@@._V1_SY317_CR0,0,214,317_.jpg	28 September 2012 (USA)	5.90000000000000036	Won't Back Down	\N
493	The Barden Bellas are a collegiate, all-girls a cappella singing group thriving on female pop songs and their perfect looks. After a disastrous failing at last year's finals, they are forced to regroup. Among the new recruits is freshman Beca, an independent, aspiring DJ with no interest in the college life. But after she meets Jesse, from the rival all-male a cappella group, Beca has a new outlook and takes it upon herself to help the Bellas find their new look and sound and get back into the competition. Written by napierslogs	112 min	http://ia.media-imdb.com/images/M/MV5BMTcyMTMzNzE5N15BMl5BanBnXkFtZTcwNzg5NjM5Nw@@._V1_SX214_.jpg	5 October 2012 (USA)	7.09999999999999964	Pitch Perfect	\N
494	The incredible story of the 1992 Lithuanian basketball team, whose athletes struggled under Soviet rule, became symbols of Lithuania's independence movement, and - with help from the Grateful Dead - triumphed at the Barcelona Olympics.	89 min	http://ia.media-imdb.com/images/M/MV5BODg5MzQ3NTA5OV5BMl5BanBnXkFtZTcwNTYxMTEzOA@@._V1_SX214_.jpg	28 September 2012 (USA)	7.79999999999999982	The Other Dream Team	\N
495	Once a mercenary of Queen Elizabeth I fighting Spaniards in Africa, Solomon met the Devil's Reaper and discovered he was bound for hell. Barely escaping, he soon renounced violence to atone for his past sins, seeking out redemption in a life of peace. That is until the followers of sorcerer Malachi kidnap a Puritan girl, Meredith Crowthorn, and brutally slaughter her family before his very eyes, forcing Solomon to take up arms and return to his violent ways once more to rescue her. Written by corsos, corrected by Pike84	104 min	http://ia.media-imdb.com/images/M/MV5BMTU5NDMwOTkxMV5BMl5BanBnXkFtZTcwMTg5OTM1OA@@._V1_SY317_CR13,0,214,317_.jpg	18 March 2010 (Portugal)	6	Solomon Kane	\N
496	This Thai crime noir tells the story of Tul, a hitman who wakes up from a coma to realize that he's now seeing everything upside down. Tul wants to quit but is instead recruited to join a secret organization that gets rid of crooked politicians untouched by the law. Written by CJ	105 min	http://ia.media-imdb.com/images/M/MV5BMTYwMDA5MTU1MF5BMl5BanBnXkFtZTcwNTMyNDA1OA@@._V1_SY317_CR5,0,214,317_.jpg	28 September 2012 (USA)	6.09999999999999964	Headshot	\N
497	The Waiting Room is a character-driven documentary film that uses extraordinary access to go behind the doors of an American public hospital struggling to care for a community of largely uninsured patients. The film - using a blend of cinema verité and characters' voice over - offers a raw, intimate, and even uplifting look at how patients, executive staff and caregivers each cope with disease, bureaucracy and hard choices. It is a film about fighting for survival when the odds are stacked against you. Written by Anonymous	81 min	http://ia.media-imdb.com/images/M/MV5BMTQxMDYwMDM2OF5BMl5BanBnXkFtZTcwMzI3MzcyOA@@._V1_SX214_.jpg	19 June 2012 (USA)	6.59999999999999964	The Waiting Room	\N
498	Bringing Up Bobby is the story of a European con-artist and her son Bobby, who find themselves in Oklahoma in an effort to escape her past and build a better future. Olive and Bobby blithely charm their way from one adventure to another until Olive's criminal past catches up with her. Consequently, she must make a choice: continue with a life of crime or leave the person she loves most in an effort to give Bobby a proper chance in life. Written by FJ	93 min	http://ia.media-imdb.com/images/M/MV5BMTAyNzEzMDMzNDNeQTJeQWpwZ15BbWU3MDU5MDY2MDc@._V1_SX214_.jpg	2011 (UK)	4.90000000000000036	Bringing Up Bobby	\N
499	In London, lawyer Arthur Kipps still grieves the death of his beloved wife Stella on the delivery of their son Joseph four years ago. His employer gives him a last chance to keep his job, and he is assigned to travel to the remote village of Cryphin Gifford to examine the documentation of the Eel Marsh House that belonged to the recently deceased Mrs. Drablow. Arthur befriends Daily on the train and the man offers a ride to him to the Gifford Arms inn. Arthur has a cold reception and the owner of the inn tells that he did not receive the request of reservation and there is no available room. The next morning, Arthur meets solicitor Jerome who advises him to return to London. However, Arthur goes to the isolated manor and soon he finds that Eel Marsh House is haunted by the vengeful ghost of a woman dressed in black. He also learns that the woman lost her son drowned in the marsh and she seeks revenge, taking the children of the scared locals. Written by Claudio Carvalho, Rio de Janeiro, Brazil	95 min	http://ia.media-imdb.com/images/M/MV5BMjEwMzIxOTg3N15BMl5BanBnXkFtZTcwMjI4ODUzNw@@._V1_SX214_.jpg	3 February 2012 (USA)	6.40000000000000036	The Woman in Black	\N
500	The shy, lonely and outcast teenager Andrew Detmer is bullied and has no friends at high-school and lives with his abusive and alcoholic father Richard Detmer and his terminal mother Karen. Matt buys a camera to film his everyday. His cousin Matt Garetty drives him to school and invites Andrew to go to a party at night. They meet their schoolmate Steve Montgomery in the party and they overhear a noise and find a hole in a field. They decide to explore the underground and they acquire powers. Soon the trio learns how to control their telekinetic abilities and Andrew becomes the most powerful. But he easily loses his temper and becomes dangerous while Matt tries to control him. When his mother needs a medicine and Andrew does not have enough money to buy it, his darker side overcomes and he becomes a menace. Written by Claudio Carvalho, Rio de Janeiro, Brazil	84 min	http://ia.media-imdb.com/images/M/MV5BMjEzMjYzMDQ0MV5BMl5BanBnXkFtZTcwNzE1OTM5Ng@@._V1_SX214_.jpg	3 February 2012 (USA)	7	Chronicle	\N
501	An animal-loving volunteer and a small-town news reporter are joined by a native Alaskan boy to rally an entire community - and eventually rival world superpowers - to save a family of majestic gray whales trapped by rapidly forming ice in the Arctic Circle. Written by Universal Pictures	107 min	http://ia.media-imdb.com/images/M/MV5BMjEzNTg5MjA5NV5BMl5BanBnXkFtZTcwNjk0MTk5Ng@@._V1_SX214_.jpg	3 February 2012 (USA)	6.29999999999999982	Big Miracle	\N
502	During the final days at the Yankee Pedlar Inn, two employees determined to reveal the hotel's haunted past begin to experience disturbing events as old guests check in for a stay.	101 min	http://ia.media-imdb.com/images/M/MV5BNDYwMTUxNjk5NV5BMl5BanBnXkFtZTcwMTM5NDc5Ng@@._V1_SX214_.jpg	1 August 2013 (Portugal)	5.5	The Innkeepers	\N
503	Nearly a year after a botched job, a hitman takes a new assignment with the promise of a big payoff for three killings. What starts off as an easy task soon unravels, sending the killer into the heart of darkness.	95 min	http://ia.media-imdb.com/images/M/MV5BNzM3NzU2NzUzMV5BMl5BanBnXkFtZTcwNjY2OTUxNw@@._V1_SX214_.jpg	8 March 2012 (Portugal)	6.20000000000000018	Kill List	\N
504	In 1998, an auction of the estate of the Duke and Duchess of Windsor causes great excitement. For one woman, Wally Winthrop, it has much more meaning. Wally becomes obsessed by their historic love story. As she learns more about the sacrifices involved, Wally gains her own courage to find happiness. Written by Anonymous	119 min	http://ia.media-imdb.com/images/M/MV5BMTQyMzMyMjkwM15BMl5BanBnXkFtZTcwNzIyODkxNw@@._V1_SY317_CR0,0,214,317_.jpg	20 January 2012 (UK)	5.59999999999999964	W.E.	\N
505	Wind power... It's green... It's good... It reduces our dependency on foreign oil... That's what the people of Meredith, in upstate New York first thought when a wind developer looked to supplement this farm town's failing economy with a farm of their own -- that of 40 industrial wind turbines. Attracted at first to the financial incentives, residents grow increasingly alarmed as they discover side effects they never dreamed of, as well as the potential for disturbing financial scams. With wind development growing rapidly at 39% annually in the US, WINDFALL is an eye-opener for anyone concerned about the future of renewable energy. Written by Anonymous	83 min	http://ia.media-imdb.com/images/M/MV5BMTU5MTAwNjI3NV5BMl5BanBnXkFtZTcwOTExNTUzNw@@._V1_SX214_.jpg	7 May 2010 (USA)	4.59999999999999964	Windfall	\N
506	Matt Weston (Ryan Reynolds) is a CIA rookie who is manning a safe house in Cape Town, South Africa, when Tobin Frost (Denzel Washington) the CIA's most wanted rogue agent is captured and taken to the safe house. During Frost's interrogation, the safe house is overtaken by mercenaries who want Frost. Weston and Frost escape and must stay out of the gunmen's sight until they can get to another safe house. Written by Douglas Young (the-movie-guy)	115 min	http://ia.media-imdb.com/images/M/MV5BMjI5ODkyMjA2Nl5BMl5BanBnXkFtZTcwNTcyNTgzNw@@._V1_SX214_.jpg	10 February 2012 (USA)	6.70000000000000018	Safe House	\N
507	The 17-year-old Sean Anderson receives a coded signal and his stepfather Hank helps him to decipher the message. They find that Sean's grandfather Alexander Anderson has found the mysterious island in the Pacific described by Jules Verne and two other writers in their novels. The stubborn Sean wants to travel to the coordinates and Hank decides to buy the tickets and travel with the teenager to a small island nearby the location. They rent an old helicopter owned by the locals Gabato and his teenage daughter Kailani and the group heads to the unknown spot. Along their journey, they cross a hurricane and crash in the island. They find a beautiful and dangerous place, surrounded by forests, volcanoes with lava of gold and menacing life forms. The meet also the old Alexander and Hank discovers that the island is sinking. Now their only chance to survive is to find the legendary Nautilus. Written by Claudio Carvalho, Rio de Janeiro, Brazil	94 min	http://ia.media-imdb.com/images/M/MV5BMjA5MTE1MjQyNV5BMl5BanBnXkFtZTcwODI4NDMwNw@@._V1_SX214_.jpg	10 February 2012 (USA)	5.70000000000000018	Journey 2: The Mysterious Island	\N
508	Leo and Paige are a couple who just got married. After an accident, Paige is left unconscious, and when she awakes she doesn't remember Leo. Her parents, whom she hasn't seen since she and Leo got together, come and visit her. She can't believe that she hasn't seen them for such a long time. Leo wants to bring her home with him but her parents want her to go with them. She goes with Leo but when she doesn't recognize anything, she goes to her parents. And she wonders why did she cut off contact with her family. She also runs into her ex and wonders why they broke up. Leo tries to win her back by courting her again. Written by rcs0411@yahoo.com	104 min	http://ia.media-imdb.com/images/M/MV5BMjE1OTU5MjU0N15BMl5BanBnXkFtZTcwMzI3OTU5Ng@@._V1_SX214_.jpg	10 February 2012 (USA)	6.70000000000000018	The Vow	\N
509	The evil Trade Federation, led by Nute Gunray is planning to take over the peaceful world of Naboo. Jedi Knights Qui-Gon Jinn and Obi-Wan Kenobi are sent to confront the leaders. But not everything goes to plan. The two Jedi escape, and along with their new Gungan friend, Jar Jar Binks head to Naboo to warn Queen Amidala, but droids have already started to capture Naboo and the Queen is not safe there. Eventually, they land on Tatooine, where they become friends with a young boy known as Anakin Skywalker. Qui-Gon is curious about the boy, and sees a bright future for him. The group must now find a way of getting to Coruscant and to finally solve this trade dispute, but there is someone else hiding in the shadows. Are the Sith really extinct? Is the Queen really who she says she is? And what's so special about this young boy? Written by simon	136 min	http://ia.media-imdb.com/images/M/MV5BMTQ4NjEwNDA2Nl5BMl5BanBnXkFtZTcwNDUyNDQzNw@@._V1_SX214_.jpg	19 May 1999 (USA)	6.5	Star Wars: Episode I - The Phantom Menace	\N
510	Dave Brown is a Los Angeles police officer who works out of the Rampart Division. Dave is misogynistic, racist, brutally violent, egotistical and a womanizer, although he defends himself against many of these accusations as he says that his hate is equal opportunity. However unlawful, he uses intimidation and brutal force to defend his ideals. The most notorious of his actions is purportedly murdering a suspected serial date rapist, which is why he has been given the nickname "Date Rape Dave". He lives with two of his ex-wives - sisters Barbara and Catherine - in an effort to keep family together, namely his two daughters, Helen and Margaret, who each have a different sister as their mother. Dave still maintains a sexual relationship with both sisters - whenever the mood suits any of them - while he openly has other sexual relationships. His life is put under a microscope after he is caught on video brutally beating a person with who he got into an automobile crash. This situation is ... Written by Huggo	108 min	http://ia.media-imdb.com/images/M/MV5BMTk4MjAxNzU2MV5BMl5BanBnXkFtZTcwMDA5NTAwNw@@._V1_SY317_CR0,0,214,317_.jpg	7 June 2012 (Portugal)	5.79999999999999982	Rampart	\N
511	IN DARKNESS tells the true story of Leopold Socha who risks his own life to save a dozen people from certain death. Initially only interested in his own good, the thief and burglar hides Jewish refugees for 14 months in the sewers of the Nazi-occupied town of Lvov (former Poland). Written by Anonymous	145 min	http://ia.media-imdb.com/images/M/MV5BMTk3NDg2OTU3N15BMl5BanBnXkFtZTcwMDM3ODkwNw@@._V1_SY317_CR1,0,214,317_.jpg	5 January 2012 (Poland)	7.09999999999999964	In Darkness	\N
512	An odd epidemic appears across the globe: people suddenly lose one of their senses. At first, it's an outbreak of loss of smell. It's often presaged by a destructive temper tantrum. In this mix are a scientist and a chef - she's Susan, one of a team trying to understand the epidemic; he's Michael, charming and engaging. Susan and Michael begin a relationship in the middle of increasing chaos, as the loss of other senses plagues more people and as civil authorities try to maintain order. Susan's voice-over reflections provide insight. Is love possible in such a changed world? Can anything make perfect sense? Written by <jhailey@hotmail.com>	92 min	http://ia.media-imdb.com/images/M/MV5BMTk3MjYwMjkzOF5BMl5BanBnXkFtZTcwMTE1NjIxNw@@._V1_SX214_.jpg	10 October 2013 (Portugal)	7	Perfect Sense	\N
513	1889. German philosopher Friedrich Nietzsche witnessed the whipping of a horse while traveling in Turin, Italy. He tossed his arms around the horse's neck to protect it then collapsed to the ground. In less than one month, Nietzsche would be diagnosed with a serious mental illness that would make him bed-ridden and speechless for the next eleven years until his death. But whatever did happen to the horse? This film, which is Tarr's last, follows up this question in a fictionalized story of what occurred. The man who whipped the horse is a rural farmer who makes his living taking on carting jobs into the city with his horse-drawn cart. The horse is old and in very poor health, but does its best to obey its master's commands. The farmer and his daughter must come to the understanding that it will be unable to go on sustaining their livelihoods. The dying of the horse is the foundation of this tragic tale. Written by Anonymous	146 min	http://ia.media-imdb.com/images/M/MV5BMTMyNzg1MzM2Ml5BMl5BanBnXkFtZTcwMzQ5NjcxNw@@._V1_SX214_.jpg	14 June 2012 (Portugal)	7.5	O Cavalo de Turim	\N
514	Cuba, 1948. Chico is a young piano player with big dreams. Rita is a beautiful singer with an extraordinary voice. Music and romantic desire unites them, but their journey - in the tradition of the Latin ballad, the bolero - brings heartache and torment. From Havana to New York, Paris, Hollywood and Las Vegas, two passionate individuals battle impossible odds to unite in music and love. Written by Anonymous	94 min	http://ia.media-imdb.com/images/M/MV5BOTcwMzk5MzYwN15BMl5BanBnXkFtZTcwMDQ5OTUzNw@@._V1_SY317_CR0,0,214,317_.jpg	19 November 2010 (UK)	7	Chico e Rita	\N
515	Back from a tour of duty, Kelli can't wait to rejoin her old life in the rust belt town she's always lived in. She's ready to experience the old feelings of everyday life- the carpet under her bare feet, a cold beer in front of the television, the smell of her baby's head. Slowly, though, she realizes that her everyday life doesn't resemble the one she left. Struggling to find her place in her family and the rust-belt town she no longer recognizes, what can she reclaim of her share of the way of life she's been fighting to protect? Written by NMH	97 min	http://ia.media-imdb.com/images/M/MV5BMTY5MTM4NzUwMl5BMl5BanBnXkFtZTcwMzMwNTIyNw@@._V1_SX214_.jpg	10 February 2012 (USA)	5.79999999999999982	Return	\N
516	Johnny Blaze, a man who made a deal with the Devil who called himself Mephistopheles at the time (now Roarke), is on the run trying to make sure no-one is harmed by his alter ego, The Ghost Rider. He is approached by a Monk named Moreau who tells him that he can help be him free of the Rider, but first, he needs Johnny's help to protect a boy, whom Roarke has plans for, to help him take human form. Written by rcs0411@yahoo.com	96 min	http://ia.media-imdb.com/images/M/MV5BMTkwNDM5MDEzOF5BMl5BanBnXkFtZTcwNDEyNTUxNw@@._V1_SX214_.jpg	17 February 2012 (USA)	4.29999999999999982	Ghost Rider: Spirit of Vengeance	\N
517	Two CIA agents, Tuck and Frank who are also best friends, have been benched because someone's after them. Tuck is divorced with a son whom he's not close to and Frank is a ladies man. Tuck decides to try and find someone so he places his profile on a dating website. Lauren, a woman also looking for a guy sees tuck's profile and goes with him. She later bumps into Frank and he hits on her and she goes out with him. she's intrigued by both of them. When they learn that they're dating the same girl, they agree to let her choose. But both can't help but use their skills to keep tabs on her and each other. And also sabotage each others dates with her. Written by rcs0411@yahoo.com	97 min	http://ia.media-imdb.com/images/M/MV5BMTYyOTQ4MDE2MV5BMl5BanBnXkFtZTcwOTE0MTgwNw@@._V1_SY317_CR0,0,214,317_.jpg	17 February 2012 (USA)	6.20000000000000018	This Means War	\N
518	A documentary that follows the Manassas Tigers football team, a severely underfunded and underprivileged football team -- who were even hired out as a practice team for more successful schools -- as they reverse their fortunes, thanks to coach Bill Courtney. Written by Kevin Jagernauth	113 min	http://ia.media-imdb.com/images/M/MV5BOTE1ODE2NDc5Ml5BMl5BanBnXkFtZTcwNDU1NjQxOA@@._V1_SY317_CR0,0,214,317_.jpg	3 August 2012 (UK)	7.5	Undefeated	\N
519	14-year-old Arrietty and the rest of the Clock family live in peaceful anonymity as they make their own home from items that they borrow from the house's human inhabitants. However, life changes for the Clocks when a human boy discovers Arrietty. Written by ANN	94 min	http://ia.media-imdb.com/images/M/MV5BMTAxNjk3OTYyODReQTJeQWpwZ15BbWU3MDgyODY2OTY@._V1_SX214_.jpg	17 February 2012 (USA)	7.59999999999999964	The Secret World of Arrietty	\N
520	A dishonest insurance salesman's life quickly disintegrates during a Wisconsin winter when he teams up with a psychopath to steal a rare violin at the home of a reclusive farmer.	93 min	http://ia.media-imdb.com/images/M/MV5BOTExNDMxMzAyOV5BMl5BanBnXkFtZTcwNjQ1OTIyNw@@._V1_SX214_.jpg	25 January 2011 (USA)	6.09999999999999964	Thin Ice	\N
521	In the isolated, frozen town of Barrow, Alaska, Iñupiaq teenagers Qalli and Aivaaq have grown up like brothers in a tight-knit community defined as much by ancient traditions as by hip-hop and snowmobiles. Early one morning, on a seal hunt with their friend James, a tussle turns violent, and James is killed. Panic stricken, terrified, and with no one to blame but themselves, Qalli and Aivaaq lie and declare the death a tragic accident. As Barrow roils with grief and his protective father becomes suspicious, Qalli stumbles through guilt-filled days, wrestling with his part in the death. For the first time in his life, he's treading alone on existential ice. Written by Anonymous	96 min	http://ia.media-imdb.com/images/M/MV5BMzkzNzQyMDgzM15BMl5BanBnXkFtZTcwNjY0ODQyNw@@._V1_SY317_CR0,0,214,317_.jpg	14 December 2011 (France)	6	On the Ice	\N
522	The young Limburg cattle farmer Jacky Vanmarsenille is approached by an unscrupulous veterinarian to make a shady deal with a notorious West-Flemish beef trader. But the assassination of a federal policeman, and an unexpected confrontation with a mysterious secret from Jacky's past, set in motion a chain of events with farreaching consequences. BULLHEAD is an exciting tragedy about fate, lost innocence and friendship, about crime and punishment, but also about conflicting desires and the irreversibility of a man's destiny. Written by Anonymous	129 min	http://ia.media-imdb.com/images/M/MV5BMjIyODk5MjQ3OF5BMl5BanBnXkFtZTcwNjQwNDUzNw@@._V1_SY317_CR0,0,214,317_.jpg	17 February 2012 (USA)	7.29999999999999982	Bullhead	\N
523	A drama focused on five months in the life of pedophile who keeps a 10-year-old boy locked in his basement.	96 min	http://ia.media-imdb.com/images/M/MV5BMTA4OTMwNTE5ODZeQTJeQWpwZ15BbWU3MDk5MjIwNDc@._V1_SX214_.jpg	15 February 2012 (USA)	6.90000000000000036	Michael	\N
524	A story set in the former Yugoslavia and centered on a guy who returns to Herzegovina from Germany with plenty of cash and hopes for a good new life.	113 min	http://ia.media-imdb.com/images/M/MV5BMjI1MDQ4NzM5OV5BMl5BanBnXkFtZTcwMzE2NTkyNw@@._V1_SY317_CR5,0,214,317_.jpg	17 February 2012 (USA)	7	Cirkus Columbia	\N
525	After George is downsized from his financial firm and Linda's depressing documentary is cancelled, they can no longer afford their overpriced 'micro-loft' in New York. They find themselves with just one option - to pack up their lives and head south to move in with George's brother and his wife. George and Linda stumble upon Elysium, an idyllic community where the only rule is to be yourself. Written by Universal Pictures	98 min	http://ia.media-imdb.com/images/M/MV5BMjA5NjIyOTY1Nl5BMl5BanBnXkFtZTcwMDY3NjQ0Nw@@._V1_SX214_.jpg	24 February 2012 (USA)	5.59999999999999964	Wanderlust	\N
526	Businessman Wesley Deeds is jolted out of his scripted life when he meets Lindsey, a single mother who works on the cleaning crew in his office building.	110 min	http://ia.media-imdb.com/images/M/MV5BMjI0ODcxMzk3N15BMl5BanBnXkFtZTcwNjAzMTMwNw@@._V1_SX214_.jpg	24 February 2012 (USA)	4.70000000000000018	Good Deeds	\N
527	When her sister disappears, Jill is convinced the serial killer who kidnapped her two years ago has returned, and she sets out to once again face her abductor. Written by Anonymous	94 min	http://ia.media-imdb.com/images/M/MV5BMTgzMTEyOTgyOF5BMl5BanBnXkFtZTcwOTY1ODkxNw@@._V1_SY317_CR0,0,214,317_.jpg	24 February 2012 (USA)	5.70000000000000018	Gone	\N
528	An unprecedented blend of real-life heroism and original filmmaking, Act of Valor stars a group of active-duty Navy SEALs in a powerful story of contemporary global anti-terrorism. Inspired by true events, the film combines stunning combat sequences, up-to-the minute battlefield technology and heart-pumping emotion for the ultimate action adventure. Act of Valor takes audiences deep into the secretive world of the most elite, highly trained group of warriors in the modern world. When the rescue of a kidnapped CIA operative leads to the discovery of a deadly terrorist plot against the U.S., a team of SEALs is dispatched on a worldwide manhunt. As the valiant men of Bandito Platoon race to stop a coordinated attack that could kill and wound thousands of American civilians, they must balance their commitment to country, team and their families back home. Each time they accomplish their mission, a new piece of intelligence reveals another shocking twist to the deadly terror plot, which ... Written by Relativity Media	110 min	http://ia.media-imdb.com/images/M/MV5BMTY3NDQxMDAzM15BMl5BanBnXkFtZTcwNzEyNjgzNw@@._V1_SX214_.jpg	24 February 2012 (USA)	6.29999999999999982	Act of Valor	\N
529	This film's center is a family in Albania. The main characters are Rudina, the oldest daughter, and Nik, the oldest son. Both have a pretty normal life. Rudina is an A-student in high-school and Nik very popular. He just fell in love with one of his fellow students. Their father earns the families income with a little bread delivery service. For that he uses a short cut through the neighbours ground, but the neighbour doesn't necessarily like that. But the ground had actually belonged to Rudina's and Nik's family once. One day the conflict escalates and the neighbour gets killed by Rudina's and Nik's father and their uncle. Because only their uncle gets caught by the police and their father is able to hide, the old law of blood feud is against the family. They cannot leave their house. Only the women of the family are allowed to leave the house. So Rudina has to quit school and continue the bread delivery service of the father, so the family can survive. The situation is tense as ... Written by Anonymous	109 min	http://ia.media-imdb.com/images/M/MV5BMTQxMDcxNjU5NV5BMl5BanBnXkFtZTcwNDI5MjgyNw@@._V1_SX214_.jpg	17 September 2011 (Albania)	6.70000000000000018	The Forgiveness of Blood	\N
530	Dom works the night shift in a small hotel near the industrial sea port of Le Havre. One night, a woman arrives with no luggage and no shoes. Her name is Fiona and she tells Dom that she is a fairy that can grant him three wishes. Fiona makes two of his wishes come true then mysteriously disappears. Dom. who has fallen in love with her by then, searches for her everywhere. Written by Anonymous	93 min	http://ia.media-imdb.com/images/M/MV5BMTk4Njg0NDg5OV5BMl5BanBnXkFtZTcwNTc2NjgyNw@@._V1_SY317_CR4,0,214,317_.jpg	24 February 2012 (USA)	6	The Fairy	\N
531	Seven Australian teenage friends from a small town go on a camping trip to be with nature. During their trip, they see military aircraft fly overhead. What they didn't know was their country was being invaded by another country. Returning home, they discover that they are at war. With no training, they band together to fight the enemy. Written by Douglas Young (the-movie-guy)	103 min	http://ia.media-imdb.com/images/M/MV5BMTM4MDEyNDE1OV5BMl5BanBnXkFtZTcwOTA4NjA0Nw@@._V1_SY317_CR5,0,214,317_.jpg	24 February 2012 (USA)	6.09999999999999964	Guerreiros do Amanhã	\N
541	When Bond's latest assignment goes gravely wrong and agents around the world are exposed, MI6 is attacked forcing M to relocate the agency. These events cause her authority and position to be challenged by Gareth Mallory (Ralph Fiennes), the new Chairman of the Intelligence and Security Committee. With MI6 now compromised from both inside and out, M is left with one ally she can trust: Bond. 007 takes to the shadows - aided only by field agent, Eve (Naomie Harris) - following a trail to the mysterious Silva (Javier Bardem), whose lethal and hidden motives have yet to reveal themselves. Written by JoaoBond	143 min	http://ia.media-imdb.com/images/M/MV5BMjM1MzMzOTA3MV5BMl5BanBnXkFtZTcwOTE3NzA1OA@@._V1_SX214_.jpg	9 November 2012 (USA)	7.79999999999999982	Skyfall	\N
532	Wreck-It Ralph longs to be as beloved as his game's perfect Good Guy, Fix-It Felix. Problem is, nobody loves a Bad Guy. But they do love heroes... so when a modern, first-person shooter game arrives featuring tough-as-nails Sergeant Calhoun, Ralph sees it as his ticket to heroism and happiness. He sneaks into the game with a simple plan -- win a medal -- but soon wrecks everything, and accidentally unleashes a deadly enemy that threatens every game in the arcade. Ralph's only hope? Vanellope von Schweetz, a young troublemaking "glitch" from a candy-coated cart racing game who might just be the one to teach Ralph what it means to be a Good Guy. But will he realize he is good enough to become a hero before it's "Game Over" for the entire arcade? Written by Walt Disney Studios Motion Pictures	108 min	http://ia.media-imdb.com/images/M/MV5BNzMxNTExOTkyMF5BMl5BanBnXkFtZTcwMzEyNDc0OA@@._V1_SX214_.jpg	2 November 2012 (USA)	7.79999999999999982	Wreck-It Ralph	\N
533	In Jungle Village, the leader of the Lion's clan Gold Lion is summoned by the Governor and assigned to protect his gold that will be transported through the village. However he is betrayed and murdered by the greedy Silver Lion and Bronze Lion. Gold Lion's favorite son Zen Yi, a.k.a. The X-Blade, seeks revenge and heads to Jungle Village, but he is defeated by Brass Body and rescued by the local Blacksmith Thaddeus. Meanwhile the Gemini Female and the Gemini Male protect the Governor's gold, but they are vanquished by the army of Silver and Bronze Lion. The Blacksmith is abducted by the Lions and has his arms severed by Brass Body. However he is saved by the British Jack Knife, who is the emissary of the Emperor, and he manufactures iron arms for Thaddeus. Meanwhile the Governor sends the Jackal army to fight against the Lions and they hide the gold in the brothel of Madam Blossom. However, Madam Blossom and his girls form an army of black widows and together with Jack, Zen Yi and The... Written by Claudio Carvalho, Rio de Janeiro, Brazil	95 min	http://ia.media-imdb.com/images/M/MV5BMTg5ODI3ODkzOV5BMl5BanBnXkFtZTcwMTQxNjUwOA@@._V1_SX214_.jpg	2 November 2012 (USA)	5.40000000000000036	The Man with the Iron Fists	\N
534	Whip Whitaker is a commuter airline pilot. While on a flight from Orlando to Atlanta something goes wrong and the plane starts to fly erratically. With little choice Whip crashes the plane and saves almost all on board. When he wakes up in the hospital, his friend from the airline union introduces him to a lawyer who tells him there's a chance he could face criminal charges because his blood test reveals that he is intoxicated with alcohol and cocaine. He denies being impaired, so while an investigation is underway, he is told to keep his act together. However, letting go of his addiction is not as easy as it seems... Written by Immanuel Ambhara	138 min	http://ia.media-imdb.com/images/M/MV5BMTUxMjI1OTMxNl5BMl5BanBnXkFtZTcwNjc3NTY1OA@@._V1_SY317_CR0,0,214,317_.jpg	2 November 2012 (USA)	7.29999999999999982	Flight	\N
535	Cheyenne, a wealthy former rock star (Penn), now bored and jaded in his retirement embarks on a quest to find his father's persecutor, an ex-Nazi war criminal now hiding out in the U.S. Learning his father is close to death, he travels to New York in the hope of being reconciled with him during his final hours, only to arrive too late. Having been estranged for over 30 years, it is only now in death that he learns the true extent of his father's humiliation in Auschwitz at the hands of former SS Officer Aloise Lange - an event he is determined to avenge. So begins a life-altering journey across the heartland of America to track down and confront his father's nemesis. As his quest unfolds, Cheyenne is reawakened by the people he encounters and his journey is transformed into one of reconciliation and self discovery. As his date with destiny arrives and he tracks down Lange, Cheyenne must finally decide if it is redemption he seeks ....or revenge. Starring two time Academy Award winner ... Written by Anonymous	118 min	http://ia.media-imdb.com/images/M/MV5BMTUzMDg5NjM3Nl5BMl5BanBnXkFtZTcwOTQ3NTI2OA@@._V1_SX214_.jpg	25 April 2012 (Portugal)	6.59999999999999964	Este é o Meu Lugar	\N
536	After a classical string quartet's 25 years of success, Peter, the cellist and oldest member, decides that he must retire when he learns he has Parkinson's Disease. For the others, that announcement proves a catalyst for letting their hidden resentments come to the surface while the married members' daughter has disruptive desires of her own. All this threatens to tear the group apart even as they are famous for playing Beethoven's String Quartet No. 14, opus 131, a piece that is played non-stop no matter how life interferes. Written by Kenneth Chisholm (kchishol@rogers.com)	105 min	http://ia.media-imdb.com/images/M/MV5BMTM3MDc3MzIzNV5BMl5BanBnXkFtZTcwNjkwNTU0OA@@._V1_SX214_.jpg	10 October 2013 (Portugal)	6.90000000000000036	A Late Quartet	\N
537	When a family of raccoons discover worms living underneath the sod in Jeff and Nealy's backyard, this pest problem begins a darkly comic and wild chain reaction of domestic tension, infidelity and murder.	91 min	http://ia.media-imdb.com/images/M/MV5BMTQ1MDcyNDIyNl5BMl5BanBnXkFtZTcwNzc3MTc1OA@@._V1_SX214_.jpg	January 2011 (USA)	6.09999999999999964	The Details	\N
538	Jack and Diane, two teenage girls, meet in New York City and spend the night kissing ferociously. Diane's charming innocence quickly begins to open Jack's tough skinned heart. But, when Jack discovers that Diane is leaving the country in a week she tries to push her away. Diane must struggle to keep their love alive while hiding the secret that her newly awakened sexual desire is giving her werewolf-like visions. Written by filmsalt.com	110 min	http://ia.media-imdb.com/images/M/MV5BMTQ5MDEyNDk5MF5BMl5BanBnXkFtZTcwNjMxODk2Nw@@._V1_SX214_.jpg	20 April 2012 (USA)	4.20000000000000018	Jack and Diane	\N
539	In Manhattan, the vampires Goody and Stacy share an apartment and work and study in the night-shift. Goody was turned in vampire in 1840 by the evil Cisserus, who turned Stacy in the 90s, and they became best friends but Goody never told her real age to her friend. They only drink mice blood and refuse to drink human blood, and they go together to the Vampire Anonymous. Stacy falls in love with her classmate Joey, and soon she learns that he is the son of the vampire slayer Dr. Van Helsing. Meanwhile, Goody meets her former passion, Danny, in the hospital where his wife is terminal. When Stacy gets pregnant, Goody knows that the only way that the child can survive is killing Cisserus, since they would revert to their human ages. But nobody knows here her lair is. Written by Claudio Carvalho, Rio de Janeiro, Brazil	92 min	http://ia.media-imdb.com/images/M/MV5BMTg0ODkwMzI0NV5BMl5BanBnXkFtZTcwMDc4OTc2OA@@._V1_SY317_CR6,0,214,317_.jpg	2 November 2012 (USA)	4.90000000000000036	Vamps	\N
540	Eleven veterans returning from Iraq and Afghanistan join an expedition to climb the 20,000 foot Himalayan giant Mount Lobuche. With blind adventurer Erik Weihenmayer and a team of Everest summiteers as their guides, they set out on an emotional and gripping climb to reach the top in an attempt to heal the emotional and physical wounds of the longest war in U.S. history. Representing nearly every branch of the military, the veterans, and the Gold Star Mom who joins their trek, bring humor and deep emotion to this hero's journey all captured with breathtaking, vertigo-inducing cinematography. Written by Khumbu Pictures, LLC	92 min	http://ia.media-imdb.com/images/M/MV5BMjE4MDI2Nzg0Ml5BMl5BanBnXkFtZTcwMTQ2NjU2OA@@._V1_SY317_CR0,0,214,317_.jpg	April 2012 (USA)	4.29999999999999982	High Ground	\N
542	In 1865, as the American Civil War winds inexorably toward conclusion, U.S. president Abraham Lincoln endeavors to achieve passage of the landmark constitutional amendment which will forever ban slavery from the United States. However, his task is a race against time, for peace may come at any time, and if it comes before the amendment is passed, the returning southern states will stop it before it can become law. Lincoln must, by almost any means possible, obtain enough votes from a recalcitrant Congress before peace arrives and it is too late. Yet the president is torn, as an early peace would save thousands of lives. As the nation confronts its conscience over the freedom of its entire population, Lincoln faces his own crisis of conscience -- end slavery or end the war. Written by Jim Beaver <jumblejim@prodigy.net>	150 min	http://ia.media-imdb.com/images/M/MV5BMTQzNzczMDUyNV5BMl5BanBnXkFtZTcwNjM2ODEzOA@@._V1_SY317_CR0,0,214,317_.jpg	16 November 2012 (USA)	7.5	Lincoln	\N
543	Indifferent to the notion of inheriting his father's estate, a Williamsburg guy passes the time with his friends, playing games of mock sincerity and irreverence.	95 min	http://ia.media-imdb.com/images/M/MV5BMjA0OTA3ODU4M15BMl5BanBnXkFtZTcwNDY3NTM1OA@@._V1_SX214_.jpg	21 January 2012 (USA)	6.09999999999999964	The Comedy	\N
544	In Shanghai, an aging socialite's infatuation with her ex-boyfriend manifests itself as a risky game, where her former lover agrees to seduce, then abandon a naive young woman.	110 min	http://ia.media-imdb.com/images/M/MV5BMTY0MDA5NDE4Ml5BMl5BanBnXkFtZTcwMjM3MjMxOA@@._V1_SY317_CR5,0,214,317_.jpg	27 September 2012 (China)	5.40000000000000036	Dangerous Liaisons	\N
545	In 1767, the British Princess Caroline is betrothed to the mad King Christian VII of Denmark, but her life with the erratic monarch in the oppressive country becomes an isolating misery. However, Christian soon gains a fast companion with the German Dr. Johann Struensee, a quietly idealistic man of the Enlightenment. As the only one who can influence the King, Struensee is able to begin sweeping enlightened reforms of Denmark through Christian even as Caroline falls for the doctor. However, their secret affair proves a tragic mistake that their conservative enemies use to their advantage in a conflict that threatens to claim more than just the lovers as their victims. Written by Kenneth Chisholm (kchishol@rogers.com)	137 min	http://ia.media-imdb.com/images/M/MV5BMTg3MDE4MTQ4NF5BMl5BanBnXkFtZTcwNDgwNDYyOA@@._V1_SX214_.jpg	21 March 2013 (Portugal)	7.5	A Royal Affair	\N
546	Polar-opposite brothers Randy and Kirk never saw eye-to-eye, but their rivalry is taken to a new level when Randy hijacks Kirk's son's sleepover, taking the boys on a Scout Trip to remember.	79 min	http://ia.media-imdb.com/images/M/MV5BMTM1NDE0NTI5OF5BMl5BanBnXkFtZTcwOTY1MTY0OA@@._V1_SY317_CR0,0,214,317_.jpg	9 November 2012 (USA)	3.79999999999999982	Nature Calls	\N
547	After the accidental death of their six-year-old daughter, the Hughes family escape their busy upscale suburban life and head to their isolated cottage for some quality time. An evening with their friendly neighbors is suddenly interrupted when one mans obsession with perfection escalates into a violent struggle, forcing the families to go beyond what they ever thought they were capable of in order to survive. Written by Anonymous	97 min	http://ia.media-imdb.com/images/M/MV5BMTU3ODczMTcwMF5BMl5BanBnXkFtZTcwMzg1MTA3OA@@._V1_SX214_.jpg	9 November 2012 (USA)	5.20000000000000018	In Their Skin	\N
548	STARLET explores the unlikely cross-generational friendship between 21 year-old Jane (Dree Hemingway), and the elderly Sadie (Besedka Johnson), two women whose worlds collide in California's San Fernando Valley. Jane, an aspiring actress, spends her time getting high with her dysfunctional roommates, Melissa and Mikey (Stella Maeve and James Ransone), while caring for her Chihuahua, Starlet. Sadie, a widow, passes her days alone, tending to her flower garden. After a confrontation between the women at Sadie's yard sale, Jane uncovers a hidden stash of money inside a relic from Sadie's past. Jane attempts to befriend the caustic older woman in an effort to solve her dilemma and secrets emerge as their relationship grows. Director Sean Baker continues in the naturalistic style of his previous films, the award-winning and Spirit Award nominees PRINCE OF BROADWAY and TAKE OUT, capturing the rhythms of everyday life with an authenticity rarely seen in cinema. Featuring a pair of ... Written by anonymous	103 min	http://ia.media-imdb.com/images/M/MV5BMzI5NTI3MjYyNl5BMl5BanBnXkFtZTcwNTg1NjQ2OA@@._V1_SX214_.jpg	2 May 2013 (Hong Kong)	6.5	Starlet	\N
549	The final Twilight Saga begins with Bella now a vampire learning to use her abilities. And happy to see her daughter, Renesmee is flourishing. But when someone sees Renesmee do something that makes them think that she was turned. This person goes to the Volturi, because it is a violation to turn a child. And the penalty is death for both who turned the child into a vampire and the child, cause they deem a turned child too dangerous. Alice gets a vision of the Volturi coming after them. So the Cullens try to convince them that Renesmee is not a threat. So they ask friends and family to come stand with them. But when someone who has it in for the Volturi shows up and tells them they should be ready for a fight. And they get ready. Written by rcs0411@yahoo.com	115 min	http://ia.media-imdb.com/images/M/MV5BMTcyMzUyMzY1OF5BMl5BanBnXkFtZTcwNDQ4ODk1OA@@._V1_SX214_.jpg	16 November 2012 (USA)	5.5	The Twilight Saga: Breaking Dawn - Part 2	\N
550	In 1874, in the Imperial Russia, the aristocratic Anna Karenina travels from Saint Petersburg to Moscow to save the marriage of her brother Prince Oblonsky, who had had a love affair with his housemaid. Anna Karenina has a cold marriage with her husband, Count Alexei Karenin, and they have a son. Anna meets the cavalry officer Count Vronsky at the train station and they feel attracted by each other. Soon she learns that Vronsky will propose Kitty, who is the younger sister of her sister-in-law Dolly. Anna satisfactorily resolves the infidelity case of her brother and Kitty invites her to stay for the ball. However, Anna Karenina and Vronsky dance in the ball, calling the attention of the conservative society. Soon they have a love affair that will lead Anna Karenina to a tragic fate. Written by Claudio Carvalho, Rio de Janeiro, Brazil	129 min	http://ia.media-imdb.com/images/M/MV5BMTU0NDgxNDg0NV5BMl5BanBnXkFtZTcwMjE4MzkwOA@@._V1_SY317_CR0,0,214,317_.jpg	6 December 2012 (Portugal)	6.59999999999999964	Anna Karenina	\N
562	Arkin escapes with his life from the vicious grips of "The Collector" during an entrapment party where he adds beautiful Elena to his "Collection." Instead of recovering from the trauma, Arkin is suddenly abducted from the hospital by mercenaries hired by Elena's wealthy father. Arkin is blackmailed to team up with the mercenaries and track down The Collector's booby trapped warehouse and save Elena. Written by Ryan Rodriguez	82 min	http://ia.media-imdb.com/images/M/MV5BODQ0MDgzNDA0NV5BMl5BanBnXkFtZTcwNDM4MDQ1OA@@._V1_SX214_.jpg	30 November 2012 (USA)	6	The Collection	\N
551	Against medical advice and without the knowledge of her husband Pat Solatano Sr., caring Dolores Solatano discharges her adult son, Pat Solatano Jr., from a Maryland mental health institution after his minimum eight month court ordered stint. The condition of the release includes Pat Jr. moving back in with his parents in their Philadelphia home. Although Pat Jr.'s institutionalization was due to him beating up the lover of his wife Nikki, he was diagnosed with bipolar disorder. Nikki has since left him and has received a restraining order against him. Although he is on medication (which he doesn't take because of the way it makes him feel) and has mandatory therapy sessions, Pat Jr. feels like he can manage on the outside solely by healthy living and looking for the "silver linings" in his life. His goals are to get his old job back as a substitute teacher, but more importantly reunite with Nikki. He finds there are certain instances where he doesn't cope well, however no less so ... Written by Huggo	122 min	http://ia.media-imdb.com/images/M/MV5BMTM2MTI5NzA3MF5BMl5BanBnXkFtZTcwODExNTc0OA@@._V1_SX214_.jpg	25 December 2012 (USA)	7.90000000000000036	Silver Linings Playbook	\N
552	A young immigrant falls in love with a NRI who wanted to marry any British person, not a typical brown Indian. But she falls in love with that young musician, but this love story ends with a breakup. Then that man, fed up with life with vast emotion joins Indian army bomb squad, where he flirts with death everyday. A young discovery channel journalist approaches his team to cover bomb squad story but falls in love with him. Written by dwa	176 min	http://ia.media-imdb.com/images/M/MV5BMTUyMzM5OTM5NF5BMl5BanBnXkFtZTcwNTIwMjA3OA@@._V1_SX214_.jpg	13 November 2012 (India)	6.90000000000000036	Jab Tak Hai Jaan	\N
553	Pete Cozy is having trouble resolving a happy marriage and family life with rising debt and a job he hates. When his new boss, Susan, a human dynamo, shows up, Pete is pulled into the maelstrom that is her life and made to work harder than he ever has before. Suddenly, money and opportunities come his way, but at what price? Written by CA	92 min	http://ia.media-imdb.com/images/M/MV5BODI3NjkxNTEyN15BMl5BanBnXkFtZTcwNzEwOTE2OA@@._V1_SX214_.jpg	25 January 2012 (USA)	5.40000000000000036	Price Check	\N
554	Tommy Cowley is a young father inflicted with chronic agoraphobia since his wife was brutally attacked by a gang of a twisted feral children. Trapped in the dilapidated suburbia of Edenstown, he finds himself terrorised by the same gang, who now seem intent on taking his baby daughter. Torn between the help of an understanding nurse and a vigilante priest, Tommy sets out to learn the nightmarish truth surrounding these hooded children. He also discovers that to be free of his fears, he must finally face the demons of his past and enter the one place that he fears the most - the abandoned tower block known as the Citadel. Written by Anonymous	84 min	http://ia.media-imdb.com/images/M/MV5BMzIwMTQ2NTAyM15BMl5BanBnXkFtZTcwNDIzMjQ0OA@@._V1_SX214_.jpg	1 March 2013 (UK)	5.29999999999999982	Citadel	\N
555	In Canada, a writer visits the Indian storyteller Pi Patel and asks him to tell his life story. Pi tells the story of his childhood in Pondicherry, India, and the origin of his nickname. One day, his father, a zoo owner, explains that the municipality is no longer supporting the zoo and he has hence decided to move to Canada, where the animals the family owns would also be sold. They board on a Japanese cargo ship with the animals and out of the blue, there is a storm, followed by a shipwrecking. Pi survives in a lifeboat with a zebra, an orangutan, a hyena and a male Bengal tiger nicknamed Richard Parker. They are adrift in the Pacific Ocean, with aggressive hyena and Rickard Parker getting hungry. Pi needs to find a way to survive. Written by Claudio Carvalho, Rio de Janeiro, Brazil	127 min	http://ia.media-imdb.com/images/M/MV5BNTg2OTY2ODg5OF5BMl5BanBnXkFtZTcwODM5MTYxOA@@._V1_SX214_.jpg	21 November 2012 (USA)	8	Life of Pi	\N
556	In Spokane, Washington, the population is awake by a North Korean invasion with paratroopers. The marine Jed Eckert and his brother Matt Eckert escape with a group of friends to an isolated cabin in the woods. They witness the cruel Captain Cho executing their father and they decide to form a resistance group named Wolverines fighting against the invaders. Written by Claudio Carvalho, Rio de Janeiro, Brazil	93 min	http://ia.media-imdb.com/images/M/MV5BMjI0MDAwMzA1M15BMl5BanBnXkFtZTcwNzIxMjY3OA@@._V1_SY317_SX214_.jpg	21 November 2012 (USA)	5.29999999999999982	Red Dawn	\N
557	When an evil spirit known as Pitch lays down the gauntlet to take over the world, the immortal Guardians must join forces for the first time to protect the hopes, beliefs, and imaginations of children all over the world. Written by DreamWorks Animation	97 min	http://ia.media-imdb.com/images/M/MV5BMTkzMjgwMDg1M15BMl5BanBnXkFtZTcwMTgzNTI1OA@@._V1_SX214_.jpg	21 November 2012 (USA)	7.20000000000000018	Rise of the Guardians	\N
558	In 1959, Alfred Hitchcock and his wife, Alma, are at the top of their creative game as filmmakers amid disquieting insinuations about it being time to retire. To recapture his youth's artistic daring, Alfred decides his next film will adapt the lurid horror novel, Psycho, over everyone's misgivings. Unfortunately, as Alfred self-finances and labors on this film, Alma finally loses patience with his roving eye and controlling habits with his actresses. When an ambitious friend lures her to collaborate on a work of their own, the resulting marital tension colors Alfred's work even as the novel's inspiration haunts his dreams. Written by Kenneth Chisholm (kchishol@rogers.com)	98 min	http://ia.media-imdb.com/images/M/MV5BODAwNDI5NjIwN15BMl5BanBnXkFtZTcwNjc4ODc2OA@@._V1_SX214_.jpg	14 December 2012 (USA)	6.90000000000000036	Hitchcock	\N
559	Put in charge of his young son, Alain leaves Belgium for Antibes to live with his sister and her husband as a family. Alain's bond with Stephanie, a killer whale trainer, grows deeper after Stephanie suffers a horrible accident.	120 min	http://ia.media-imdb.com/images/M/MV5BMTczMTU4NDUyMl5BMl5BanBnXkFtZTcwOTM5NDY0OA@@._V1_SY317_CR0,0,214,317_.jpg	7 March 2013 (Portugal)	7.5	Rust and Bone	\N
560	In 1989, five black and Latino teenagers from Harlem were arrested and later convicted of raping a white woman in New York City's Central Park. They spent between 6 and 13 years in prison before a serial rapist confessed that he alone had committed the crime, leading to their convictions being overturned. Set against a backdrop of a decaying city beset by violence and racial tension, THE CENTRAL PARK FIVE tells the story of that horrific crime, the rush to judgment by the police, a media clamoring for sensational stories and an outraged public, and the five lives upended by this miscarriage of justice. Written by CP5	119 min	http://ia.media-imdb.com/images/M/MV5BMjMxMDMyNzI1M15BMl5BanBnXkFtZTcwOTIxMDQ2OA@@._V1_SX214_.jpg	23 November 2012 (USA)	7.59999999999999964	The Central Park Five	\N
561	Three amateurs stickup a Mob protected card game, causing the local criminal economy to collapse. Brad Pitt plays the hitman hired to track them down and restore order. Killing Them Softly also features Richard Jenkins , James Gandolfini, Ray Liotta, Scoot McNairy, Ben Mendelsohn, and Vincent Curatola. Max Casella, Trevor Long, Slaine and Sam Shepard also make appearances. Written by Anonymous	97 min	http://ia.media-imdb.com/images/M/MV5BODk3MDg2NDk5M15BMl5BanBnXkFtZTcwMjcxMjMzOA@@._V1_SY317_CR1,0,214,317_.jpg	30 November 2012 (USA)	6.29999999999999982	Killing Them Softly	\N
563	John awakens from a coma to discover his wife and daughter were slaughtered in a brutal home invasion. Haunted by images of the attack, he vows to kill the man responsible: Luc Deveraux. While John tries to piece his reality back together, things get more complicated when he is pursued by a relentless UniSol named Magnus. Meanwhile, Deveraux and surviving UniSol Andrew Scott are preparing to battle anarchy and build a new order ruled by Unisols without government oversight. They are weeding out the weak and constantly testing their strongest warriors in brutal, life-and-death combat. Luc has emerged operating the Unisol Church of Eventualism, taking in wayward Unisols whom the government has been secretly operating as remote-controlled sleeper agents. His mission is to liberate these Unisols from the implanted memories and the lies the government has inserted in them. As John gets closer to Deveraux and the rogue army of genetically enhanced warriors, he discovers more about himself ... Written by Anonymous	114 min	http://ia.media-imdb.com/images/M/MV5BMTM3ODMxMDY0MF5BMl5BanBnXkFtZTcwNDc3MTY0OA@@._V1_SY317_CR1,0,214,317_.jpg	25 October 2012 (USA)	5.09999999999999964	Universal Soldier: Day of Reckoning	\N
564	The film opens with a car driving by the sea drive, which all of a sudden, screeches to a halt and turns randomly, to break the sidewalk, and fall into the sea. Next day, enter Inspector Surjan Singh Sekhawat, who is the investigating officer. A simultaneous plot reveals that he and his wife are coping with some personal loss of losing their only child, Karan. They have moved to their new home in Mumbai, where, his wife, Roshni is finishing with the unpacking. The doorbell rings, and she find out that it is an elderly lady, who introduces herself as Franny. She asks for some tea, and while Roshni is away into the kitchen, she rummages through the yet unpacked boxes, and finds a family photograph, where she addresses the dead child by his name, and seems happy. Meanwhile, Surjan encounters a sex worker named Rosie, who can shed some light upon the entire mystery. Written by debasree	131 min	http://ia.media-imdb.com/images/M/MV5BNTg5NzI3NzQzNl5BMl5BanBnXkFtZTcwMjM3MDU2OA@@._V1_SY317_CR2,0,214,317_.jpg	30 November 2012 (India)	7.29999999999999982	Talaash	\N
565	A sinful martial arts expert wants to start a new tranquil life, only to be hunted by a determined detective and his former master.	115 min	http://ia.media-imdb.com/images/M/MV5BMTc4OTUxMDQ1NF5BMl5BanBnXkFtZTcwOTczMDI2OA@@._V1_SX214_.jpg	31 October 2013 (Portugal)	7	Dragon	\N
566	A former Britpop rocker who now works on a farm gets caught driving drunk and faces deportation after living in Los Angeles for many years. His efforts to stay in the U.S. force him to confront the past and current demons in his life.	94 min	http://ia.media-imdb.com/images/M/MV5BMTk3MzQxMjExNl5BMl5BanBnXkFtZTcwNTY0NTE2OA@@._V1_SY317_CR1,0,214,317_.jpg	25 January 2012 (USA)	5.40000000000000036	California Solo	\N
567	A documentary on some of contemporary Mexico's most iconic artists and performers.	98 min	http://ia.media-imdb.com/images/M/MV5BMjI1NTQ4MjkwMl5BMl5BanBnXkFtZTcwMDE4NTQ2OA@@._V1_SX214_.jpg	30 November 2012 (USA)	5.90000000000000036	Hecho en México	\N
568	Ginger Baker looks back on his musical career with Cream and Blind Faith; his introduction to Fela Kuti; his self-destructive patterns and losses of fortune; and his current life inside a fortified South African compound.	100 min	http://ia.media-imdb.com/images/M/MV5BMjIwNDE5NjE2MV5BMl5BanBnXkFtZTcwNjY2ODc3OA@@._V1_SY317_CR0,0,214,317_.jpg	17 May 2013 (UK)	7	Beware of Mr. Baker	\N
569	A deadly drought in 1942 takes its toll on central China's Henan province during the war against Japan.	145 min	http://ia.media-imdb.com/images/M/MV5BNjc2OTA3Mjc1Nl5BMl5BanBnXkFtZTcwMjQyNzU3OA@@._V1_SY317_CR6,0,214,317_.jpg	29 November 2012 (China)	6.79999999999999982	Back to 1942	\N
570	The hilarious, outrageous, and ultimately tragic true story of one filmmaker's seduction into moral blindness in the glare of the media spotlight. What begins innocently is a film that seems nothing more than a "Behind-the-Scenes" tell-all, but Filmmaker David Giancola has larger issues in mind and the film quickly takes a dark turn. Giancola uses his tale as a modern parable about the dangers of celebrity and it's debilitating effect upon our society. Back in 2005, he wanted to break out by making a "Movie that mocked B-Movies". He thought he could manipulate the media by casting Anna Nicole Smith. In the end the media manipulated him instead as his star and one of his producers died in a media feeding frenzy. The film bombed, but the story was one of the most reported events of 2007, behind only coverage of the Iraq war. The truth is always stranger and more unbelievable than fiction... Filmmaker Giancola spent over three years in editing from over 80 Hours of never-before seen ... Written by Susan Potter Publicity	89 min	http://ia.media-imdb.com/images/M/MV5BMTkxOTk1NTIwNl5BMl5BanBnXkFtZTcwODAzNjQ1OA@@._V1._CR75,74.16667175292969,1014,1502.9999542236328_SX214_.jpg	19 March 2012 (USA)	2.79999999999999982	Addicted to Fame	\N
\.


--
-- TOC entry 1982 (class 0 OID 16445)
-- Dependencies: 172 1985
-- Data for Name: movie_actor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY movie_actor (movies_id, actors_id) FROM stdin;
1	1
1	3
1	2
2	5
2	6
2	4
3	9
3	8
3	7
4	11
4	10
4	12
5	15
5	13
5	14
6	17
6	18
6	16
7	20
7	21
7	19
8	22
8	23
8	24
9	25
10	27
10	28
10	26
11	31
11	30
11	29
12	33
12	34
12	32
13	35
13	37
13	36
14	35
14	38
14	39
15	42
15	40
15	41
16	43
16	45
16	44
17	48
17	46
17	47
18	51
18	50
18	49
19	54
19	53
19	52
20	57
20	56
20	55
21	58
21	9
21	59
22	62
22	60
22	61
23	64
23	63
23	65
24	67
24	66
24	68
25	69
26	72
26	71
26	70
27	74
27	75
27	73
28	77
28	78
28	76
29	81
29	79
29	80
30	82
30	84
30	83
31	25
32	85
32	86
32	87
33	90
33	89
33	88
34	25
35	92
35	93
35	91
36	96
36	95
36	94
37	99
37	98
37	97
38	101
38	102
38	100
39	104
39	105
39	103
40	108
40	107
40	106
41	110
41	111
41	109
42	112
42	114
42	113
43	117
43	116
43	115
44	119
44	118
44	120
45	122
45	121
45	123
46	81
46	124
46	84
47	125
47	127
47	126
48	128
48	129
48	130
49	133
49	132
49	131
50	135
50	136
50	134
51	139
51	138
51	137
52	76
52	141
52	140
53	142
53	144
53	143
54	145
54	146
54	147
55	149
55	148
55	150
56	151
56	152
56	153
57	25
58	155
58	156
58	154
59	159
59	157
59	158
60	160
60	161
60	62
61	162
61	163
61	164
62	167
62	166
62	165
63	169
63	168
63	170
64	172
64	173
64	171
65	176
65	174
65	175
66	179
66	178
66	177
67	25
68	182
68	180
68	181
69	185
69	184
69	183
70	186
70	187
70	188
71	190
71	191
71	189
72	192
72	193
72	106
73	196
73	194
73	195
74	199
74	197
74	198
75	200
75	201
75	202
76	204
76	205
76	203
77	207
77	206
77	208
78	25
79	211
79	209
79	210
80	25
81	214
81	212
81	213
82	215
82	216
82	9
83	218
83	217
83	219
84	221
84	222
84	220
85	223
85	224
85	225
86	228
86	226
86	227
87	77
87	229
87	230
88	232
88	231
88	233
89	234
89	235
89	236
90	238
90	239
90	237
91	241
91	242
91	240
92	245
92	243
92	244
93	247
93	246
93	248
94	251
94	249
94	250
95	95
95	125
95	252
96	254
96	255
96	253
97	256
97	258
97	257
98	260
98	8
98	259
99	25
100	262
100	263
100	261
101	265
101	266
101	264
102	268
102	267
102	269
103	270
103	271
103	272
104	242
104	274
104	273
105	277
105	275
105	276
106	279
106	278
106	280
107	261
107	281
107	282
108	140
108	284
108	283
109	287
109	286
109	285
110	288
110	290
110	289
111	25
112	293
112	292
112	291
113	294
113	295
113	296
114	299
114	298
114	297
115	300
115	302
115	301
116	303
116	304
116	115
117	306
117	307
117	305
118	309
118	308
118	310
119	313
119	312
119	311
120	316
120	315
120	314
121	91
121	318
121	317
122	319
122	320
122	321
123	324
123	322
123	323
124	214
124	263
124	100
125	326
125	325
125	327
126	328
126	329
126	330
127	332
127	333
127	331
128	125
128	43
128	334
129	337
129	336
129	335
130	340
130	339
130	338
131	343
131	342
131	341
132	346
132	344
132	345
133	347
133	349
133	348
134	350
134	351
134	272
135	352
135	354
135	353
136	357
136	356
136	355
137	358
137	359
137	360
138	361
138	363
138	362
139	168
139	364
139	365
140	367
140	368
140	366
141	369
141	297
141	370
142	371
142	373
142	372
143	374
143	376
143	375
144	378
144	379
144	377
145	382
145	380
145	381
146	385
146	383
146	384
147	388
147	386
147	387
148	390
148	389
148	36
149	392
149	393
149	391
150	394
150	395
150	396
151	25
152	398
152	397
152	399
153	400
153	379
153	401
154	25
155	404
155	403
155	402
156	406
156	407
156	405
157	408
157	409
157	410
158	412
158	413
158	411
159	415
159	414
159	213
160	416
160	297
160	292
161	418
161	419
161	417
162	421
162	422
162	420
163	424
163	423
163	425
164	426
164	427
164	125
165	428
165	429
165	259
166	432
166	431
166	430
167	435
167	433
167	434
168	438
168	437
168	436
169	439
169	441
169	440
170	443
170	444
170	442
171	446
171	46
171	445
172	447
172	448
172	449
173	369
173	284
173	450
174	451
174	452
174	263
175	455
175	454
175	453
176	457
176	456
176	458
177	460
177	461
177	459
178	463
178	462
178	433
179	464
179	465
179	466
180	293
180	467
180	253
181	468
181	470
181	469
182	471
182	36
182	77
183	276
183	472
183	402
184	474
184	475
184	473
185	476
185	477
185	364
186	478
186	479
186	168
187	481
187	480
187	482
188	25
189	483
189	485
189	484
190	486
190	488
190	487
191	188
191	489
191	490
192	53
192	491
192	492
193	494
193	495
193	493
194	496
194	497
194	498
195	499
195	501
195	500
196	503
196	502
196	504
197	506
197	95
197	505
198	92
198	507
198	508
199	510
199	511
199	509
200	53
200	512
200	253
201	514
201	513
201	55
202	515
202	516
202	517
203	518
203	519
203	520
204	25
205	521
205	126
205	522
206	523
206	525
206	524
207	526
207	186
207	527
208	25
209	186
209	270
209	528
210	530
210	370
210	529
211	25
212	532
212	531
212	533
213	534
213	535
213	536
214	537
214	538
214	539
215	542
215	540
215	541
216	545
216	543
216	544
217	546
217	548
217	547
218	551
218	550
218	549
219	553
219	554
219	552
220	555
220	557
220	556
221	560
221	559
221	558
222	562
222	563
222	561
223	566
223	565
223	564
224	25
225	568
225	567
225	569
226	572
226	571
226	570
227	573
227	372
227	335
228	493
228	427
228	574
229	575
229	103
229	78
230	577
230	216
230	576
231	65
231	578
231	216
232	580
232	581
232	579
233	526
233	582
233	193
234	584
234	583
234	8
235	585
235	586
235	587
236	25
237	588
237	590
237	589
238	593
238	591
238	592
239	596
239	595
239	594
240	597
240	598
240	599
241	602
241	601
241	600
242	603
242	604
242	605
243	607
243	606
243	608
244	611
244	609
244	610
245	613
245	612
245	614
246	43
246	616
246	615
247	617
247	618
247	619
248	621
248	142
248	620
249	623
249	622
249	244
250	626
250	625
250	624
251	628
251	629
251	627
252	624
252	631
252	630
253	632
253	1
253	633
254	636
254	635
254	634
255	637
255	639
255	638
256	218
256	641
256	640
257	643
257	642
257	644
258	168
258	430
258	602
259	421
259	555
259	645
260	647
260	646
260	461
261	25
262	650
262	648
262	649
263	652
263	651
263	41
264	302
264	653
264	229
265	655
265	654
265	656
266	657
266	658
266	94
267	659
267	128
267	660
268	25
269	661
269	663
269	662
270	666
270	665
270	664
271	668
271	669
271	667
272	671
272	672
272	670
273	674
273	673
273	675
274	678
274	676
274	677
275	679
275	680
275	110
276	25
277	681
277	433
277	204
278	683
278	682
278	684
279	172
279	685
279	686
280	688
280	689
280	687
281	691
281	690
281	519
282	693
282	694
282	692
283	87
283	695
283	426
284	25
285	138
285	589
285	696
286	697
286	699
286	698
287	450
287	701
287	700
288	702
288	704
288	703
289	706
289	707
289	705
290	579
290	461
290	708
291	709
291	335
291	710
292	711
292	712
292	713
293	716
293	714
293	715
294	719
294	717
294	718
295	25
296	720
296	722
296	721
297	25
298	723
298	724
298	725
299	594
299	107
299	726
300	729
300	728
300	727
301	730
301	731
301	467
302	357
302	446
302	101
303	734
303	732
303	733
304	737
304	736
304	735
305	739
305	740
305	738
306	741
306	673
306	742
307	599
307	744
307	743
308	746
308	745
308	616
309	297
309	748
309	747
310	25
311	146
311	749
311	750
312	25
313	751
313	151
313	507
314	305
314	752
314	53
315	755
315	753
315	754
316	756
316	589
316	757
317	759
317	760
317	758
318	762
318	763
318	761
319	766
319	765
319	764
320	767
320	348
320	22
321	768
321	769
321	770
322	65
322	218
322	771
323	25
324	773
324	774
324	772
325	775
325	777
325	776
326	778
326	780
326	779
327	783
327	781
327	782
328	786
328	784
328	785
329	789
329	788
329	787
330	790
330	791
330	792
331	794
331	793
331	472
332	796
332	795
332	797
333	798
333	151
333	799
334	802
334	800
334	801
335	297
335	649
335	803
336	741
336	804
336	805
337	806
337	808
337	807
338	40
338	809
338	79
339	283
340	811
340	812
340	810
341	813
341	814
341	808
342	816
342	815
342	42
343	817
343	819
343	818
344	821
344	820
344	822
345	824
345	825
345	823
346	826
346	417
346	827
347	784
347	302
347	828
348	214
348	335
348	829
349	460
349	679
349	830
350	831
350	832
350	685
351	833
351	338
351	834
352	835
352	837
352	836
353	838
353	839
353	834
354	842
354	840
354	841
355	844
355	843
355	422
356	846
356	845
356	742
357	849
357	847
357	848
358	851
358	850
358	852
359	253
359	853
359	854
360	857
360	855
360	856
361	859
361	860
361	858
362	861
362	863
362	862
363	744
363	864
363	865
364	866
364	868
364	867
365	546
365	869
365	870
366	25
367	873
367	871
367	872
368	25
369	876
369	874
369	875
370	877
370	229
370	431
371	37
371	459
371	111
372	656
372	519
372	878
373	880
373	881
373	879
374	883
374	882
374	41
375	537
375	885
375	884
376	887
376	888
376	886
377	407
377	889
377	657
378	490
378	890
378	390
379	892
379	891
379	666
380	893
380	894
380	86
381	218
381	895
381	896
382	259
382	477
382	889
383	171
383	778
383	108
384	898
384	861
384	897
385	748
385	477
385	899
386	900
386	761
386	526
387	658
387	43
387	682
388	902
388	389
388	901
389	904
389	903
389	655
390	905
390	906
390	377
391	907
391	335
391	79
392	908
392	909
392	910
393	913
393	911
393	912
394	230
394	347
394	914
395	915
395	916
395	917
396	539
396	918
396	919
397	43
397	921
397	920
398	924
398	923
398	922
399	903
399	684
399	383
400	925
400	927
400	926
401	105
401	928
401	929
402	931
402	930
402	372
403	932
403	933
403	934
404	935
404	937
404	936
405	938
405	939
405	940
406	942
406	941
406	921
407	943
407	141
407	808
408	212
408	944
408	945
409	948
409	947
409	946
410	950
410	949
410	889
411	952
411	951
411	953
412	25
413	955
413	954
413	956
414	959
414	958
414	957
415	25
416	655
416	961
416	960
417	337
417	963
417	962
418	648
418	148
418	964
419	629
419	965
419	966
420	967
420	968
420	969
421	971
421	972
421	970
422	347
422	673
422	259
425	977
425	103
425	476
428	983
428	198
428	981
432	993
432	988
432	991
435	995
435	997
435	1000
439	1007
439	294
439	1004
443	1012
443	1013
443	1014
446	1018
446	1020
446	1021
448	1025
448	1024
448	1023
451	1032
451	1029
451	1030
453	25
456	1037
456	41
456	1036
470	899
470	1041
470	477
471	1068
471	245
471	1067
472	1071
472	1070
472	1069
473	1072
473	880
473	348
474	126
474	59
474	284
475	37
475	281
475	95
476	796
476	215
476	844
477	1073
477	1074
477	1075
478	695
478	462
478	1076
479	1077
479	675
479	726
480	877
480	1078
480	1079
481	1080
481	477
481	490
482	632
482	504
482	937
483	1081
483	1082
483	1083
484	1085
484	1086
484	1084
485	168
485	1087
485	1088
486	1091
486	1089
486	1090
487	1094
487	1093
487	1092
488	1095
488	1096
488	1097
489	1098
489	1099
489	941
490	747
490	345
490	103
491	1100
491	540
491	541
492	1101
492	506
492	107
493	1102
493	17
493	675
494	1105
494	1104
494	1103
495	1107
495	1106
495	1108
496	1111
496	1110
496	1109
497	25
498	1113
498	1112
498	1067
499	455
499	1114
499	810
500	1115
500	543
500	811
501	1116
501	1117
501	1118
502	102
502	1119
502	1120
503	1123
503	1122
503	1121
504	1124
504	263
504	1125
505	25
506	1126
506	615
506	216
507	1127
507	125
507	431
508	278
508	95
508	685
509	960
509	141
509	845
510	658
510	830
510	977
511	1129
511	1128
511	1130
512	1132
512	141
512	1131
513	1134
513	1135
513	1133
514	1137
514	1138
514	1136
515	1139
515	364
515	1140
516	537
516	1114
516	215
517	1141
517	405
517	1142
518	25
519	1143
519	1145
519	1144
520	1146
520	416
520	83
521	1149
521	1148
521	1147
522	1151
522	1150
522	1152
523	1155
523	1153
523	1154
524	1156
524	1157
524	1158
525	635
525	218
525	796
526	1160
526	1159
526	893
527	604
527	1161
527	430
528	1163
528	1162
528	1164
529	1165
529	1166
529	1167
530	1168
530	1169
530	1170
531	1108
531	1172
531	1171
532	1173
532	936
532	1174
533	1176
533	44
533	1175
534	1178
534	615
534	1177
535	1179
535	7
535	1180
536	84
536	1041
536	731
537	1182
537	965
537	1181
538	291
538	1183
538	1184
539	1187
539	1185
539	1186
540	1189
540	1188
540	1190
541	307
541	884
541	1191
542	1192
542	1193
542	1194
543	1196
543	1197
543	1195
544	1198
544	1199
544	671
545	546
545	1200
545	1201
546	42
546	1202
546	1203
547	1205
547	1125
547	1204
548	1207
548	1206
548	1208
549	1210
549	1209
549	1211
550	648
550	96
550	1212
551	335
551	259
551	877
552	643
552	1213
552	28
553	1216
553	1214
553	1215
554	1218
554	1217
554	1219
555	1220
555	588
555	1221
556	431
556	1222
556	742
557	594
557	601
557	981
558	575
558	1223
558	748
559	1224
559	1225
559	1150
560	1228
560	1227
560	1226
561	1229
561	762
561	486
562	1231
562	1232
562	1230
563	1234
563	1233
563	1235
564	1236
564	1238
564	1237
565	1239
565	1240
565	1241
566	1244
566	1242
566	1243
567	25
568	1247
568	1246
568	1245
569	1250
569	1249
569	1248
570	1253
570	1252
570	1251
\.


--
-- TOC entry 1983 (class 0 OID 16450)
-- Dependencies: 173 1985
-- Data for Name: movie_director; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY movie_director (movies_id, directors_id) FROM stdin;
1	1
2	2
3	3
4	4
5	5
6	6
7	7
8	8
9	9
10	10
11	11
12	12
13	13
14	14
15	15
16	16
17	17
18	18
19	19
20	20
21	21
22	22
23	23
24	24
25	25
26	26
27	27
28	28
29	29
30	30
31	31
32	32
33	33
34	34
35	35
36	36
37	37
38	38
39	39
40	40
41	41
42	42
43	43
44	44
45	45
46	46
47	47
48	48
49	49
50	50
51	51
52	52
53	53
54	54
55	55
56	56
57	57
58	58
59	59
60	60
61	61
62	62
63	63
64	64
65	65
66	66
67	67
68	68
69	69
70	70
71	71
72	72
73	73
74	74
75	75
76	76
77	77
78	78
79	79
80	80
81	81
82	82
83	83
84	84
85	85
86	86
87	87
88	88
89	89
90	90
91	91
92	92
93	93
94	94
95	95
96	96
97	97
98	98
99	99
100	100
101	101
102	102
103	103
104	104
105	105
106	106
107	107
108	108
109	109
110	110
111	111
112	112
113	113
114	114
115	115
116	116
117	117
118	118
119	119
120	120
121	121
122	122
123	123
124	124
125	125
126	126
127	127
128	128
129	129
130	130
131	131
132	132
133	133
134	134
135	135
136	136
137	137
138	138
139	139
140	140
141	141
142	142
143	143
144	144
145	145
146	146
147	147
148	148
149	149
150	150
151	151
152	152
153	153
154	154
155	155
156	156
157	157
158	158
159	159
160	160
161	161
162	162
163	163
164	164
165	165
166	166
167	167
168	168
169	169
170	170
171	171
172	172
173	173
174	174
175	175
176	176
177	177
178	178
179	179
180	180
181	181
182	182
183	183
184	184
185	185
186	186
187	187
188	188
189	189
190	190
191	191
192	192
193	193
194	194
195	195
196	196
197	197
198	198
199	199
200	200
201	201
202	202
203	203
204	204
205	205
206	206
207	207
208	208
209	209
210	210
211	211
212	212
213	213
214	214
215	215
216	216
217	217
218	218
219	219
220	220
221	221
222	222
223	223
224	224
225	225
226	226
227	227
228	228
229	229
230	230
231	231
232	232
233	233
234	234
235	235
236	236
237	237
238	238
239	239
240	240
241	241
242	242
243	243
244	244
245	245
246	223
247	246
248	247
249	248
250	249
251	250
252	251
253	252
254	253
255	254
256	255
257	256
258	257
259	258
260	259
261	260
262	261
263	262
264	263
265	264
266	265
267	266
268	267
269	268
270	269
271	270
272	271
273	272
274	273
275	274
276	275
277	276
278	277
279	278
280	279
281	280
282	281
283	282
284	283
285	284
286	285
287	286
288	287
289	288
290	232
291	289
292	290
293	291
294	292
295	293
296	294
297	295
298	296
299	297
300	298
301	299
302	300
303	301
304	302
305	303
306	304
307	305
308	306
309	307
310	308
311	309
312	310
313	311
314	312
315	313
316	314
317	315
318	316
319	317
320	318
321	319
322	320
323	321
324	322
325	323
326	324
327	325
328	326
329	327
330	328
331	28
332	329
333	330
334	331
335	332
336	333
337	334
338	335
339	336
340	337
341	338
342	339
343	340
344	341
345	342
346	343
347	344
348	345
349	346
350	347
351	348
352	349
353	350
354	351
355	352
356	353
357	354
358	169
359	355
360	356
361	357
362	358
363	359
364	116
365	360
366	361
367	362
368	363
369	364
370	365
371	85
372	366
373	367
374	368
375	369
376	370
377	371
378	372
379	373
380	97
381	374
382	375
383	376
384	377
385	378
386	379
387	380
388	381
389	382
390	383
391	384
392	385
393	386
394	387
395	388
396	389
397	223
398	390
399	391
400	392
401	393
402	394
403	395
404	396
405	397
406	114
407	36
408	398
409	399
410	400
411	401
412	402
413	403
414	404
415	405
416	406
417	407
418	408
419	409
420	410
421	411
422	414
425	415
428	418
432	421
435	425
439	427
443	431
446	435
448	438
451	439
453	441
456	444
470	447
471	459
472	460
473	461
474	462
475	463
476	464
477	465
478	466
479	467
480	468
481	469
482	470
483	471
484	472
485	473
486	474
487	475
488	476
489	477
490	478
491	479
492	480
493	481
494	482
495	483
496	484
497	485
498	486
499	487
500	488
501	489
502	490
503	150
504	491
505	492
506	493
507	494
508	495
509	496
510	497
511	498
512	499
513	500
514	501
515	502
516	503
517	504
518	505
519	506
520	507
521	508
522	509
523	510
524	511
525	512
526	97
527	513
528	514
529	515
530	516
531	517
532	518
533	519
534	520
535	521
536	522
537	523
538	524
539	525
540	526
541	527
542	106
543	528
544	529
545	530
546	531
547	532
548	533
549	333
550	534
551	375
552	535
553	536
554	537
555	538
556	539
557	540
558	541
559	542
560	543
561	544
562	545
563	546
564	547
565	548
566	549
567	550
568	551
569	552
570	553
\.


--
-- TOC entry 1984 (class 0 OID 16455)
-- Dependencies: 174 1985
-- Data for Name: movie_genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY movie_genre (movies_id, genres_id) FROM stdin;
1	2
1	1
2	2
2	3
3	4
3	3
3	5
4	6
4	1
5	5
5	6
6	5
6	6
7	5
7	6
8	4
8	3
8	6
9	7
10	5
10	6
11	3
11	5
12	8
12	1
13	2
13	5
13	9
14	2
14	1
15	4
15	2
15	3
16	4
16	2
16	5
17	4
17	5
18	5
19	10
19	3
19	1
20	4
20	2
20	3
21	6
22	4
22	3
22	5
23	10
23	6
23	1
24	11
24	5
25	7
26	5
28	1
28	11
28	6
29	3
29	4
29	2
30	4
30	6
31	7
32	1
32	2
32	5
33	7
33	12
34	9
34	13
34	7
35	4
35	6
36	4
36	2
36	5
37	14
37	2
37	5
38	3
38	11
38	5
39	3
39	4
39	2
40	11
40	10
40	5
41	11
41	15
41	5
42	9
42	5
43	6
44	16
44	17
44	6
45	5
46	3
46	4
46	5
47	2
47	5
48	1
48	8
48	2
49	11
49	15
49	5
50	14
50	5
51	5
52	17
52	10
53	6
54	1
54	5
54	2
55	15
55	5
55	2
56	2
57	7
58	5
59	7
59	9
59	6
60	5
61	5
61	13
62	18
62	17
62	10
63	18
63	17
63	10
64	3
64	4
64	5
65	5
66	1
67	7
68	9
68	5
68	14
69	4
69	5
69	2
70	6
71	4
71	2
72	5
73	18
73	16
73	5
74	5
74	10
74	11
75	6
75	5
76	4
76	5
77	6
77	5
78	7
78	12
79	5
80	7
81	3
81	2
82	17
82	16
82	6
83	6
83	5
83	11
84	6
84	5
84	13
85	6
86	4
86	6
86	5
87	5
87	14
87	11
88	7
88	14
89	5
90	5
90	12
91	1
92	6
93	7
94	6
94	5
94	11
95	3
95	17
95	8
96	17
96	11
96	8
97	5
98	4
98	5
99	7
100	3
100	17
100	4
101	15
101	6
102	3
102	6
103	6
103	5
104	5
104	10
105	1
106	17
106	8
107	5
107	4
107	15
108	5
108	2
109	5
110	5
110	8
111	7
112	6
112	2
112	10
113	6
113	1
114	1
114	2
114	15
115	13
115	5
115	19
116	6
117	5
117	11
118	1
118	2
118	8
119	5
119	6
120	5
120	6
120	4
121	5
121	2
122	5
122	3
122	14
123	5
124	3
124	17
124	15
125	1
125	2
126	5
126	12
127	5
127	6
127	15
128	6
128	3
128	4
129	6
130	5
131	9
131	17
132	5
132	6
133	5
133	2
134	2
135	4
135	2
136	10
136	3
136	17
137	6
137	11
138	7
139	4
139	5
139	13
140	5
141	5
142	1
142	5
142	11
143	5
144	5
145	20
145	5
146	21
146	6
146	11
147	9
147	14
147	5
148	5
148	11
149	6
149	11
150	6
150	4
150	17
151	7
152	2
152	1
153	2
153	1
154	12
154	7
154	13
155	4
155	5
155	3
156	8
156	3
156	17
157	6
157	5
158	7
159	2
159	3
160	6
160	5
161	5
162	2
162	1
163	7
164	2
164	4
164	3
165	6
166	18
166	16
166	17
167	5
167	11
168	5
169	7
170	8
170	3
170	17
171	15
171	2
171	4
172	6
172	5
173	4
173	5
173	3
174	2
174	5
175	5
175	13
176	6
176	12
176	8
177	6
178	8
178	2
178	1
179	6
179	11
179	5
180	4
180	6
180	3
181	7
181	5
182	15
182	5
183	6
183	11
183	5
184	7
185	10
185	3
185	17
186	6
186	10
187	6
187	11
187	5
188	12
188	9
188	7
189	5
189	2
189	1
190	3
190	17
190	1
191	16
191	6
191	17
192	12
192	6
192	5
193	2
193	1
194	5
194	2
195	7
196	4
196	13
196	5
197	5
197	3
197	2
198	4
198	6
198	3
199	6
200	10
200	5
200	1
201	4
201	5
201	3
202	11
202	5
203	6
203	5
204	7
205	7
206	17
206	3
206	20
207	16
207	6
207	17
208	7
208	6
209	6
209	5
210	13
210	6
210	5
211	7
212	17
212	9
212	3
213	5
214	8
214	17
214	3
215	6
216	13
216	5
217	5
218	2
218	1
219	6
219	17
220	6
221	13
221	9
221	5
222	5
223	5
224	7
224	22
225	6
226	5
227	2
227	5
227	3
228	6
228	5
228	4
229	6
229	3
229	4
230	6
230	3
230	4
231	16
231	6
231	17
232	13
232	2
232	1
233	6
234	2
234	5
234	4
235	7
236	7
236	9
236	4
237	2
237	3
238	5
239	10
239	17
239	3
240	6
241	6
241	5
242	15
243	11
243	5
244	5
244	3
244	4
245	2
245	4
246	3
246	6
246	4
247	6
247	18
247	16
248	11
248	5
248	6
249	5
249	2
250	8
250	2
250	1
251	19
251	5
252	5
252	8
252	3
253	17
253	18
253	10
254	6
254	4
255	17
255	6
255	16
256	5
256	6
257	11
257	3
257	6
258	5
258	13
259	6
260	11
260	6
261	5
261	7
261	9
262	3
262	6
262	4
263	5
263	13
264	5
264	2
265	5
265	13
266	11
266	5
266	4
267	11
267	6
268	7
269	5
269	17
269	3
270	8
270	3
270	6
271	2
271	6
271	1
272	5
272	13
272	3
273	11
273	5
273	6
274	5
275	5
275	2
276	12
276	7
277	3
277	4
278	5
278	15
278	4
279	5
279	15
279	4
280	5
280	6
281	11
281	5
282	5
282	3
282	6
283	2
283	8
283	3
284	7
285	11
285	5
285	6
286	5
287	5
288	6
289	13
289	7
289	9
290	2
290	1
291	2
291	6
291	4
292	11
292	5
292	6
293	5
294	5
294	4
295	22
295	13
295	7
296	7
297	7
298	5
299	2
299	5
299	4
300	12
301	6
302	5
302	6
303	5
303	6
304	2
304	5
304	4
305	18
305	17
305	10
306	13
306	5
306	3
307	18
307	16
307	6
308	6
309	11
309	5
309	6
310	13
310	7
310	9
311	2
311	1
311	5
312	7
313	5
313	8
313	2
314	5
314	4
314	2
315	11
315	6
316	11
316	6
317	5
317	12
318	6
319	5
320	15
320	5
320	2
321	7
322	5
322	6
323	5
323	9
323	7
324	7
325	6
325	1
326	13
326	17
326	3
327	4
327	2
327	3
328	5
328	11
329	5
329	1
329	10
330	5
331	15
331	1
331	2
332	5
332	12
333	20
333	2
334	1
334	2
335	5
335	1
336	5
336	13
336	2
337	5
337	13
337	9
338	15
338	2
338	3
339	5
339	17
339	3
340	5
340	13
340	11
341	5
341	4
341	2
342	6
343	5
343	11
344	5
345	7
346	5
347	17
347	3
347	8
348	6
349	6
349	16
350	5
350	6
350	8
351	13
351	5
351	9
352	13
352	5
352	11
353	10
353	5
353	11
354	12
354	5
355	5
356	17
356	10
356	3
357	14
357	5
358	7
359	3
359	5
359	2
360	6
361	5
361	2
361	4
362	5
362	6
363	17
363	5
364	6
365	3
365	6
365	11
366	7
367	10
367	5
368	7
369	5
370	17
370	3
370	8
371	6
372	17
372	6
372	16
373	3
373	5
373	15
374	21
374	5
375	13
375	5
375	9
376	13
376	5
376	11
377	2
377	4
377	5
378	12
378	5
379	10
379	17
379	5
380	6
381	6
382	4
382	5
383	6
383	13
383	5
384	3
384	16
384	18
385	11
385	6
385	5
386	17
386	6
386	5
387	2
387	3
387	5
388	4
388	13
388	5
389	6
389	5
390	10
390	17
390	3
391	19
391	6
392	1
393	12
393	6
393	5
394	1
394	2
395	5
395	4
396	11
396	5
397	3
397	5
397	4
398	12
398	6
399	9
399	13
399	5
400	10
400	16
400	18
401	5
402	5
402	2
402	8
403	3
403	6
403	4
404	5
404	2
405	21
405	1
406	10
406	3
406	1
407	3
407	2
408	5
408	14
408	2
409	3
409	5
409	17
410	9
410	5
410	14
411	5
411	2
411	4
412	7
413	9
413	5
413	14
414	7
414	13
414	6
415	7
416	3
416	5
416	17
417	3
417	6
417	4
418	5
419	3
419	2
419	4
420	5
421	5
421	1
422	15
422	5
422	11
425	3
425	2
428	6
428	11
432	6
432	5
432	11
435	6
439	5
443	6
443	1
446	5
448	15
448	10
448	5
451	6
451	7
451	13
453	7
453	2
456	18
456	10
456	16
470	5
471	3
471	8
471	1
472	6
472	16
472	17
473	6
473	5
474	5
474	2
475	6
475	5
475	11
476	4
476	3
476	5
477	4
477	6
478	4
478	3
478	8
479	4
479	5
479	2
480	15
480	2
480	1
481	5
481	19
482	5
482	11
483	22
483	7
483	9
484	7
484	13
485	5
486	5
487	6
487	12
488	11
488	19
489	5
490	4
490	3
490	8
491	6
491	18
491	16
492	5
493	6
493	11
493	12
494	7
494	19
495	3
495	10
495	17
496	4
496	5
496	2
497	7
498	6
499	5
499	2
499	1
500	5
500	8
500	2
501	5
501	11
502	2
502	1
503	4
503	2
503	1
504	9
504	5
504	11
505	5
505	7
506	15
506	4
506	3
507	17
507	3
507	6
508	5
508	11
509	17
509	3
509	10
510	5
510	4
511	5
511	14
512	5
512	8
512	11
513	5
514	11
514	16
514	12
515	5
516	2
516	3
516	10
517	11
517	3
517	6
518	19
518	7
519	17
519	16
519	18
520	5
520	4
520	6
521	5
521	2
522	5
522	4
523	5
523	2
524	5
524	6
525	6
526	5
526	11
526	6
527	15
527	5
527	2
528	14
528	2
528	3
529	5
530	5
530	6
531	17
531	14
531	3
532	16
532	6
532	17
533	3
534	2
534	5
535	6
535	5
536	12
536	5
537	6
537	5
538	1
538	11
538	5
539	1
539	6
539	11
540	7
541	3
541	17
541	2
542	9
542	13
542	5
543	5
544	15
544	11
544	5
545	9
545	11
545	5
546	6
547	1
547	2
548	5
549	17
549	10
549	5
550	5
551	6
551	5
551	11
552	11
552	5
553	6
553	5
554	1
554	2
554	5
555	17
555	10
555	5
556	3
556	14
557	16
557	18
557	17
558	13
558	5
559	11
559	5
560	7
561	4
561	2
562	3
562	1
562	2
563	3
563	2
563	8
564	4
564	15
564	5
565	3
565	5
566	5
567	9
567	12
567	7
568	7
569	5
570	6
570	13
570	7
\.


--
-- TOC entry 2003 (class 0 OID 0)
-- Dependencies: 170
-- Name: movie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('movie_id_seq', 570, true);


--
-- TOC entry 1835 (class 2606 OID 16396)
-- Dependencies: 162 162 1986
-- Name: account_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY account
    ADD CONSTRAINT account_email_key UNIQUE (email);


--
-- TOC entry 1837 (class 2606 OID 16394)
-- Dependencies: 162 162 1986
-- Name: account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);


--
-- TOC entry 1839 (class 2606 OID 16398)
-- Dependencies: 162 162 1986
-- Name: account_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY account
    ADD CONSTRAINT account_username_key UNIQUE (username);


--
-- TOC entry 1841 (class 2606 OID 16411)
-- Dependencies: 165 165 1986
-- Name: actor_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY actor
    ADD CONSTRAINT actor_name_key UNIQUE (name);


--
-- TOC entry 1843 (class 2606 OID 16409)
-- Dependencies: 165 165 1986
-- Name: actor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY actor
    ADD CONSTRAINT actor_pkey PRIMARY KEY (id);


--
-- TOC entry 1845 (class 2606 OID 16421)
-- Dependencies: 167 167 1986
-- Name: director_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY director
    ADD CONSTRAINT director_name_key UNIQUE (name);


--
-- TOC entry 1847 (class 2606 OID 16419)
-- Dependencies: 167 167 1986
-- Name: director_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY director
    ADD CONSTRAINT director_pkey PRIMARY KEY (id);


--
-- TOC entry 1849 (class 2606 OID 16431)
-- Dependencies: 169 169 1986
-- Name: genre_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY genre
    ADD CONSTRAINT genre_name_key UNIQUE (name);


--
-- TOC entry 1851 (class 2606 OID 16429)
-- Dependencies: 169 169 1986
-- Name: genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (id);


--
-- TOC entry 1857 (class 2606 OID 16449)
-- Dependencies: 172 172 172 1986
-- Name: movie_actor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY movie_actor
    ADD CONSTRAINT movie_actor_pkey PRIMARY KEY (movies_id, actors_id);


--
-- TOC entry 1859 (class 2606 OID 16454)
-- Dependencies: 173 173 173 1986
-- Name: movie_director_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY movie_director
    ADD CONSTRAINT movie_director_pkey PRIMARY KEY (movies_id, directors_id);


--
-- TOC entry 1861 (class 2606 OID 16459)
-- Dependencies: 174 174 174 1986
-- Name: movie_genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY movie_genre
    ADD CONSTRAINT movie_genre_pkey PRIMARY KEY (movies_id, genres_id);


--
-- TOC entry 1853 (class 2606 OID 16442)
-- Dependencies: 171 171 1986
-- Name: movie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY movie
    ADD CONSTRAINT movie_pkey PRIMARY KEY (id);


--
-- TOC entry 1855 (class 2606 OID 16444)
-- Dependencies: 171 171 1986
-- Name: movie_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY movie
    ADD CONSTRAINT movie_title_key UNIQUE (title);


--
-- TOC entry 1865 (class 2606 OID 16475)
-- Dependencies: 1842 172 165 1986
-- Name: fk2c3cdfe6c065792d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movie_actor
    ADD CONSTRAINT fk2c3cdfe6c065792d FOREIGN KEY (actors_id) REFERENCES actor(id);


--
-- TOC entry 1864 (class 2606 OID 16470)
-- Dependencies: 172 1852 171 1986
-- Name: fk2c3cdfe6f1af8e23; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movie_actor
    ADD CONSTRAINT fk2c3cdfe6f1af8e23 FOREIGN KEY (movies_id) REFERENCES movie(id);


--
-- TOC entry 1869 (class 2606 OID 16495)
-- Dependencies: 174 169 1850 1986
-- Name: fk2c923f74d119c149; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movie_genre
    ADD CONSTRAINT fk2c923f74d119c149 FOREIGN KEY (genres_id) REFERENCES genre(id);


--
-- TOC entry 1868 (class 2606 OID 16490)
-- Dependencies: 174 171 1852 1986
-- Name: fk2c923f74f1af8e23; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movie_genre
    ADD CONSTRAINT fk2c923f74f1af8e23 FOREIGN KEY (movies_id) REFERENCES movie(id);


--
-- TOC entry 1867 (class 2606 OID 16485)
-- Dependencies: 173 167 1846 1986
-- Name: fk71188bfbed58bca3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movie_director
    ADD CONSTRAINT fk71188bfbed58bca3 FOREIGN KEY (directors_id) REFERENCES director(id);


--
-- TOC entry 1866 (class 2606 OID 16480)
-- Dependencies: 173 171 1852 1986
-- Name: fk71188bfbf1af8e23; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movie_director
    ADD CONSTRAINT fk71188bfbf1af8e23 FOREIGN KEY (movies_id) REFERENCES movie(id);


--
-- TOC entry 1863 (class 2606 OID 16465)
-- Dependencies: 1836 162 163 1986
-- Name: fkdd020b1b745593b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY account_genre
    ADD CONSTRAINT fkdd020b1b745593b FOREIGN KEY (users_id) REFERENCES account(id);


--
-- TOC entry 1862 (class 2606 OID 16460)
-- Dependencies: 163 1850 169 1986
-- Name: fkdd020b1c9e0cce2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY account_genre
    ADD CONSTRAINT fkdd020b1c9e0cce2 FOREIGN KEY (favorites_id) REFERENCES genre(id);


--
-- TOC entry 1992 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2013-12-10 21:28:00 WET

--
-- PostgreSQL database dump complete
--

