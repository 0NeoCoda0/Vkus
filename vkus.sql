--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)

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
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: neocoda
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO neocoda;

--
-- Name: carts; Type: TABLE; Schema: public; Owner: neocoda
--

CREATE TABLE public.carts (
    cart_id integer NOT NULL,
    user_id integer,
    order_price numeric(10,2),
    delivery_duration numeric(10,0),
    creation_date timestamp without time zone,
    delivery_date timestamp without time zone
);


ALTER TABLE public.carts OWNER TO neocoda;

--
-- Name: carts_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: neocoda
--

CREATE SEQUENCE public.carts_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carts_cart_id_seq OWNER TO neocoda;

--
-- Name: carts_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neocoda
--

ALTER SEQUENCE public.carts_cart_id_seq OWNED BY public.carts.cart_id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: neocoda
--

CREATE TABLE public.products (
    product_id integer NOT NULL,
    name character varying(255) NOT NULL,
    price numeric(10,2) NOT NULL,
    weight numeric(10,2),
    quantity integer,
    image character varying(255),
    category character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    composition character varying[],
    calories integer
);


ALTER TABLE public.products OWNER TO neocoda;

--
-- Name: products_in_cart; Type: TABLE; Schema: public; Owner: neocoda
--

CREATE TABLE public.products_in_cart (
    id integer NOT NULL,
    product_id integer,
    cart_id integer,
    quantity integer
);


ALTER TABLE public.products_in_cart OWNER TO neocoda;

--
-- Name: products_in_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: neocoda
--

CREATE SEQUENCE public.products_in_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_in_cart_id_seq OWNER TO neocoda;

--
-- Name: products_in_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neocoda
--

ALTER SEQUENCE public.products_in_cart_id_seq OWNED BY public.products_in_cart.id;


--
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: neocoda
--

CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_product_id_seq OWNER TO neocoda;

--
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neocoda
--

ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: neocoda
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    cart_id integer,
    nick_name character varying(50) NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    password character varying(50) NOT NULL,
    mail character varying(50),
    delivery_adress character varying(255),
    phone character varying(30)
);


ALTER TABLE public.users OWNER TO neocoda;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: neocoda
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO neocoda;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neocoda
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: carts cart_id; Type: DEFAULT; Schema: public; Owner: neocoda
--

ALTER TABLE ONLY public.carts ALTER COLUMN cart_id SET DEFAULT nextval('public.carts_cart_id_seq'::regclass);


--
-- Name: products product_id; Type: DEFAULT; Schema: public; Owner: neocoda
--

ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


--
-- Name: products_in_cart id; Type: DEFAULT; Schema: public; Owner: neocoda
--

ALTER TABLE ONLY public.products_in_cart ALTER COLUMN id SET DEFAULT nextval('public.products_in_cart_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: neocoda
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: neocoda
--

COPY public.alembic_version (version_num) FROM stdin;
eeff8d35f2fb
\.


--
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: neocoda
--

COPY public.carts (cart_id, user_id, order_price, delivery_duration, creation_date, delivery_date) FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: neocoda
--

COPY public.products (product_id, name, price, weight, quantity, image, category, type, composition, calories) FROM stdin;
1	Хингал	250.00	\N	\N		НАЦИОНАЛЬНАЯ КУХНЯ	hot-food	\N	\N
2	Чьепалг	250.00	\N	\N		НАЦИОНАЛЬНАЯ КУХНЯ	hot-food	\N	\N
3	Далнаш	400.00	\N	\N		НАЦИОНАЛЬНАЯ КУХНЯ	hot-food	\N	\N
4	Галушки	800.00	\N	\N	static/images/menu/кукурузные галушки.jpg	НАЦИОНАЛЬНАЯ КУХНЯ	hot-food	\N	\N
5	Голубцы	500.00	\N	\N	static/images/menu/голубцы.jpg	ГОРЯЧИЕ ВТОРЫЕ БЛЮДА	hot-food	\N	\N
6	Перцы фаршированные	500.00	\N	\N	static/images/menu/перцы.jpg	ГОРЯЧИЕ ВТОРЫЕ БЛЮДА	hot-food	\N	\N
7	Котлета с пюре	500.00	\N	\N	static/images/menu/котлета из курицы.jpg	ГОРЯЧИЕ ВТОРЫЕ БЛЮДА	hot-food	\N	\N
8	Зраза куриная с сыром	200.00	\N	\N	static/images/menu/зраза с сыром.jpg	ГОРЯЧИЕ ВТОРЫЕ БЛЮДА	hot-food	\N	\N
9	Зраза куриная с грибами	250.00	\N	\N	static/images/menu/	ГОРЯЧИЕ ВТОРЫЕ БЛЮДА	hot-food	\N	\N
10	Плов мясной	2000.00	\N	\N	static/images/menu/	ГОРЯЧИЕ ВТОРЫЕ БЛЮДА	hot-food	\N	\N
11	Плов сладкий	2500.00	\N	\N	static/images/menu/	ГОРЯЧИЕ ВТОРЫЕ БЛЮДА	hot-food	\N	\N
12	Cтейк лосося с овощами	1200.00	\N	\N	static/images/menu/	ГОРЯЧИЕ ВТОРЫЕ БЛЮДА	hot-food	\N	\N
13	Хинкали 10шт.	1000.00	\N	\N	static/images/menu/хинкали.jpg	ГОРЯЧИЕ ВТОРЫЕ БЛЮДА	hot-food	\N	\N
14	Манты 10шт.	700.00	\N	\N	static/images/menu/манты.jpg	ГОРЯЧИЕ ВТОРЫЕ БЛЮДА	hot-food	\N	\N
15	Манты с рублёным мясом 10шт.	900.00	\N	\N	static/images/menu/	ГОРЯЧИЕ ВТОРЫЕ БЛЮДА	hot-food	\N	\N
16	Пельмени 300гр.	500.00	\N	\N	static/images/menu/пельмени.jpg	ГОРЯЧИЕ ВТОРЫЕ БЛЮДА	hot-food	\N	\N
17	Вареники 300гр.	500.00	\N	\N	static/images/menu/вареники с вишней.jpg	ГОРЯЧИЕ ВТОРЫЕ БЛЮДА	hot-food	\N	\N
18	Сырники	500.00	\N	\N	static/images/menu/сырники.jpg	ГОРЯЧИЕ ВТОРЫЕ БЛЮДА	hot-food	\N	\N
19	Куриный суп с лапшой	500.00	\N	\N		ПЕРВЫЕ БЛЮДА	hot-food	\N	\N
20	Борщ с мясом	500.00	\N	\N		ПЕРВЫЕ БЛЮДА	hot-food	\N	\N
21	Суп с фрикадельками	500.00	\N	\N		ПЕРВЫЕ БЛЮДА	hot-food	\N	\N
22	Нохри чоьрп	600.00	\N	\N		ПЕРВЫЕ БЛЮДА	hot-food	\N	\N
23	Лагман	500.00	\N	\N		ПЕРВЫЕ БЛЮДА	hot-food	\N	\N
24	Гуляш	500.00	\N	\N		ПЕРВЫЕ БЛЮДА	hot-food	\N	\N
25	Мясной бульон	300.00	\N	\N		ПЕРВЫЕ БЛЮДА	hot-food	\N	\N
26	Куриный бульон	1200.00	\N	\N		ПЕРВЫЕ БЛЮДА	hot-food	\N	\N
27	Блинчики с мясом 10 шт.	1000.00	\N	\N		ЗАКУСКИ	hot-food	\N	\N
28	Блинчики с творогом 10 шт.	700.00	\N	\N		ЗАКУСКИ	hot-food	\N	\N
29	Блинчики	500.00	\N	\N		ЗАКУСКИ	hot-food	\N	\N
30	Рулет из баклажанов 10 шт	1000.00	\N	\N		ЗАКУСКИ	hot-food	\N	\N
31	Фаршированные шампиньоны	2000.00	\N	\N		ЗАКУСКИ	hot-food	\N	\N
32	Пхали из свеклы 10 шт.	1000.00	\N	\N		ЗАКУСКИ	hot-food	\N	\N
33	Пхали из шпината 10 шт.	1500.00	\N	\N		ЗАКУСКИ	hot-food	\N	\N
34	Пхали из перца 10шт.	1500.00	\N	\N		ЗАКУСКИ	hot-food	\N	\N
35	Холодец	750.00	\N	\N		ЗАКУСКИ	hot-food	\N	\N
36	Рубленый салат 1 кг.	1300.00	\N	\N		ЛЮБОЙ САЛАТ НА ЗАКАЗ	hot-food	\N	\N
37	Слоёный салат 1 кг.	1500.00	\N	\N		ЛЮБОЙ САЛАТ НА ЗАКАЗ	hot-food	\N	\N
38	Любой вид запеченого мяса 1 кг.	1700.00	\N	\N		ГОРЯЧЕЕ НА КОМПАНИЮ	hot-food	\N	\N
39	Отварная баранья голова и ноги	2000.00	\N	\N		ГОРЯЧЕЕ НА КОМПАНИЮ	hot-food	\N	\N
40	Запеченая курица с овощами 2 кг.	2500.00	\N	\N		ГОРЯЧЕЕ НА КОМПАНИЮ	hot-food	\N	\N
41	Жаренная курица с луком 2кг.	2000.00	\N	\N		ГОРЯЧЕЕ НА КОМПАНИЮ	hot-food	\N	\N
42	классические	500.00	\N	\N	static/images/menu/freeze/галушки м.jpg	ГАЛУШКИ	freeze-food	\N	\N
43	кукурузные	500.00	\N	\N	static/images/menu/freeze/галушки кукурузные.jpg	ГАЛУШКИ	freeze-food	\N	\N
44	ракушки	600.00	\N	\N	static/images/menu/freeze/ракушки с мясом.jpg	ГАЛУШКИ	freeze-food	\N	\N
45	с тыквой	800.00	\N	\N	static/images/menu/freeze/манты м.jpg	МАНТЫ	freeze-food	\N	\N
46	с бараниной	1000.00	\N	\N	static/images/menu/freeze/манты с бараниной.jpg	МАНТЫ	freeze-food	\N	\N
47	с говядиной	1000.00	\N	\N	static/images/menu/freeze/манты с говядиной.jpg	МАНТЫ	freeze-food	\N	\N
48	с рубленным мясом	1200.00	\N	\N	static/images/menu/freeze/манты с рубленым мясом.jpg	МАНТЫ	freeze-food	\N	\N
49	с творогом	700.00	\N	\N	static/images/menu/freeze/вареники с творогом.jpg	ВАРЕНИКИ	freeze-food	\N	\N
50	с творогом и луком	700.00	\N	\N	static/images/menu/freeze/вареники с луком.jpg	ВАРЕНИКИ	freeze-food	\N	\N
51	с вишней	800.00	\N	\N	static/images/menu/freeze/вареники с вишней.jpg	ВАРЕНИКИ	freeze-food	\N	\N
52	с картошкой	600.00	\N	\N	static/images/menu/freeze/вареники с картошкой.jpg	ВАРЕНИКИ	freeze-food	\N	\N
53	с картошкой и грибами	700.00	\N	\N	static/images/menu/freeze/вареники с грибами и картошкой.jpg	ВАРЕНИКИ	freeze-food	\N	\N
54	говядина	800.00	\N	\N	static/images/menu/freeze/пельмени_говядина_индейка_баранина_детские.jpg	ПЕЛЬМЕНИ	freeze-food	\N	\N
55	индейка	800.00	\N	\N	static/images/menu/freeze/пельмени с индейкой.jpg	ПЕЛЬМЕНИ	freeze-food	\N	\N
56	баранина	800.00	\N	\N	static/images/menu/freeze/пельмени с бараниной.jpg	ПЕЛЬМЕНИ	freeze-food	\N	\N
57	детские	1200.00	\N	\N	static/images/menu/freeze/пельмени детские.jpg	ПЕЛЬМЕНИ	freeze-food	\N	\N
58	с мясом	1000.00	\N	\N	static/images/menu/freeze/курзе м.jpg	КУРЗЕ	freeze-food	\N	\N
59	с творогом	800.00	\N	\N	static/images/menu/freeze/курзе с творогом.jpg	КУРЗЕ	freeze-food	\N	\N
60	с картошкой	700.00	\N	\N	static/images/menu/freeze/курзе с картошкой.jpg	КУРЗЕ	freeze-food	\N	\N
61	с капустой	700.00	\N	\N	static/images/menu/freeze/курзе с капустой.jpg	КУРЗЕ	freeze-food	\N	\N
62	Долма	1000.00	\N	\N	static/images/menu/freeze/долма м.jpg	ДРУГОЕ	freeze-food	\N	\N
63	Фаршированный перец	1000.00	\N	\N	static/images/menu/freeze/перцы м.jpg	ДРУГОЕ	freeze-food	\N	\N
64	Фрикадельки	1000.00	\N	\N	static/images/menu/freeze/фрикадельки_инд_слэш_кур_слэш_гов.jpg	ДРУГОЕ	freeze-food	\N	\N
65	Голубцы	800.00	\N	\N	static/images/menu/freeze/голубцы м.jpg	ДРУГОЕ	freeze-food	\N	\N
66	Тефтели	800.00	\N	\N	static/images/menu/freeze/	ДРУГОЕ	freeze-food	\N	\N
67	Домашняя курица 1 кг	600.00	\N	\N		ФЕРМЕРСКИЕ ПРОДУКТЫ	freeze-food	\N	\N
68	Отварная баранья голова и ноги	1000.00	\N	\N		ФЕРМЕРСКИЕ ПРОДУКТЫ	freeze-food	\N	\N
69	Куриный фарш 1кг.	700.00	\N	\N		ФЕРМЕРСКИЕ ПРОДУКТЫ	freeze-food	\N	\N
70	Фарш из говядины 1кг.	800.00	\N	\N		ФЕРМЕРСКИЕ ПРОДУКТЫ	freeze-food	\N	\N
71	Сушеное мясо 1кг.	1600.00	\N	\N		ФЕРМЕРСКИЕ ПРОДУКТЫ	freeze-food	\N	\N
72	Сушеная конина 1кг.	2000.00	\N	\N		ФЕРМЕРСКИЕ ПРОДУКТЫ	freeze-food	\N	\N
73	Колбасы с рубленым мясом 1 кг.	1500.00	\N	\N	static/images/menu/колбаса.jpg	ФЕРМЕРСКИЕ ПРОДУКТЫ	freeze-food	\N	\N
74	Колбасы с фаршем 1кг.	1200.00	\N	\N		ФЕРМЕРСКИЕ ПРОДУКТЫ	freeze-food	\N	\N
75	Говяжий язык 1кг	800.00	\N	\N		ФЕРМЕРСКИЕ ПРОДУКТЫ	freeze-food	\N	\N
76	1 баар в заморозке 0.5кг.	600.00	\N	\N		ФЕРМЕРСКИЕ ПРОДУКТЫ	freeze-food	\N	\N
\.


--
-- Data for Name: products_in_cart; Type: TABLE DATA; Schema: public; Owner: neocoda
--

COPY public.products_in_cart (id, product_id, cart_id, quantity) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: neocoda
--

COPY public.users (user_id, cart_id, nick_name, first_name, last_name, password, mail, delivery_adress, phone) FROM stdin;
\.


--
-- Name: carts_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neocoda
--

SELECT pg_catalog.setval('public.carts_cart_id_seq', 1, false);


--
-- Name: products_in_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neocoda
--

SELECT pg_catalog.setval('public.products_in_cart_id_seq', 1, false);


--
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neocoda
--

SELECT pg_catalog.setval('public.products_product_id_seq', 76, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neocoda
--

SELECT pg_catalog.setval('public.users_user_id_seq', 1, false);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: neocoda
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: neocoda
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (cart_id);


--
-- Name: products_in_cart products_in_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: neocoda
--

ALTER TABLE ONLY public.products_in_cart
    ADD CONSTRAINT products_in_cart_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: neocoda
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: neocoda
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

