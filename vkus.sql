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
    composition character varying(255)[],
    calories integer
);


ALTER TABLE public.products OWNER TO neocoda;

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
-- Name: products product_id; Type: DEFAULT; Schema: public; Owner: neocoda
--

ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: neocoda
--

COPY public.products (product_id, name, price, weight, quantity, image, category, type, composition, calories) FROM stdin;
1	классические	500.00	\N	\N	static/images/menu/freeze/галушки м.jpg	ГАЛУШКИ	freeze-food	\N	\N
2	кукурузные	500.00	\N	\N	static/images/menu/freeze/галушки кукурузные.jpg	ГАЛУШКИ	freeze-food	\N	\N
3	ракушки	600.00	\N	\N	static/images/menu/freeze/ракушки с мясом.jpg	ГАЛУШКИ	freeze-food	\N	\N
4	с тыквой	800.00	\N	\N	static/images/menu/freeze/манты м.jpg	МАНТЫ	freeze-food	\N	\N
5	с бараниной	1000.00	\N	\N	static/images/menu/freeze/манты с бараниной.jpg	МАНТЫ	freeze-food	\N	\N
6	с говядиной	1000.00	\N	\N	static/images/menu/freeze/манты с говядиной.jpg	МАНТЫ	freeze-food	\N	\N
7	с рубленным мясом	1200.00	\N	\N	static/images/menu/freeze/манты с рубленым мясом.jpg	МАНТЫ	freeze-food	\N	\N
8	с творогом	700.00	\N	\N	static/images/menu/freeze/вареники с творогом.jpg	ВАРЕНИКИ	freeze-food	\N	\N
9	с творогом и луком	700.00	\N	\N	static/images/menu/freeze/вареники с луком.jpg	ВАРЕНИКИ	freeze-food	\N	\N
10	с вишней	800.00	\N	\N	static/images/menu/freeze/вареники с вишней.jpg	ВАРЕНИКИ	freeze-food	\N	\N
11	с картошкой	600.00	\N	\N	static/images/menu/freeze/вареники с картошкой.jpg	ВАРЕНИКИ	freeze-food	\N	\N
12	с картошкой и грибами	700.00	\N	\N	static/images/menu/freeze/вареники с грибами и картошкой.jpg	ВАРЕНИКИ	freeze-food	\N	\N
13	говядина	800.00	\N	\N	static/images/menu/freeze/пельмени_говядина_индейка_баранина_детские.jpg	ПЕЛЬМЕНИ	freeze-food	\N	\N
14	индейка	800.00	\N	\N	static/images/menu/freeze/пельмени с индейкой.jpg	ПЕЛЬМЕНИ	freeze-food	\N	\N
15	баранина	800.00	\N	\N	static/images/menu/freeze/пельмени с бараниной.jpg	ПЕЛЬМЕНИ	freeze-food	\N	\N
16	детские	1200.00	\N	\N	static/images/menu/freeze/пельмени детские.jpg	ПЕЛЬМЕНИ	freeze-food	\N	\N
17	с мясом	1000.00	\N	\N	static/images/menu/freeze/курзе м.jpg	КУРЗЕ	freeze-food	\N	\N
18	с творогом	800.00	\N	\N	static/images/menu/freeze/курзе с творогом.jpg	КУРЗЕ	freeze-food	\N	\N
19	с картошкой	700.00	\N	\N	static/images/menu/freeze/курзе с картошкой.jpg	КУРЗЕ	freeze-food	\N	\N
20	с капустой	700.00	\N	\N	static/images/menu/freeze/курзе с капустой.jpg	КУРЗЕ	freeze-food	\N	\N
21	Долма	1000.00	\N	\N	static/images/menu/freeze/долма м.jpg	ДРУГОЕ	freeze-food	\N	\N
22	Фаршированный перец	1000.00	\N	\N	static/images/menu/freeze/перцы м.jpg	ДРУГОЕ	freeze-food	\N	\N
23	Фрикадельки	1000.00	\N	\N	static/images/menu/freeze/фрикадельки_инд_слэш_кур_слэш_гов.jpg	ДРУГОЕ	freeze-food	\N	\N
24	Голубцы	800.00	\N	\N	static/images/menu/freeze/голубцы м.jpg	ДРУГОЕ	freeze-food	\N	\N
25	Тефтели	800.00	\N	\N	static/images/menu/freeze/	ДРУГОЕ	freeze-food	\N	\N
26	Домашняя курица 1 кг	600.00	\N	\N		ФЕРМЕРСКИЕ ПРОДУКТЫ	freeze-food	\N	\N
27	Отварная баранья голова и ноги	1000.00	\N	\N		ФЕРМЕРСКИЕ ПРОДУКТЫ	freeze-food	\N	\N
28	Куриный фарш 1кг.	700.00	\N	\N		ФЕРМЕРСКИЕ ПРОДУКТЫ	freeze-food	\N	\N
29	Фарш из говядины 1кг.	800.00	\N	\N		ФЕРМЕРСКИЕ ПРОДУКТЫ	freeze-food	\N	\N
30	Сушеное мясо 1кг.	1600.00	\N	\N		ФЕРМЕРСКИЕ ПРОДУКТЫ	freeze-food	\N	\N
31	Сушеная конина 1кг.	2000.00	\N	\N		ФЕРМЕРСКИЕ ПРОДУКТЫ	freeze-food	\N	\N
32	Колбасы с рубленым мясом 1 кг.	1500.00	\N	\N	static/images/menu/колбаса.jpg	ФЕРМЕРСКИЕ ПРОДУКТЫ	freeze-food	\N	\N
33	Колбасы с фаршем 1кг.	1200.00	\N	\N		ФЕРМЕРСКИЕ ПРОДУКТЫ	freeze-food	\N	\N
34	Говяжий язык 1кг	800.00	\N	\N		ФЕРМЕРСКИЕ ПРОДУКТЫ	freeze-food	\N	\N
35	1 баар в заморозке 0.5кг.	600.00	\N	\N		ФЕРМЕРСКИЕ ПРОДУКТЫ	freeze-food	\N	\N
36	Хингал	250.00	\N	\N		НАЦИОНАЛЬНАЯ КУХНЯ	hot-food	\N	\N
37	Чьепалг	250.00	\N	\N		НАЦИОНАЛЬНАЯ КУХНЯ	hot-food	\N	\N
38	Далнаш	400.00	\N	\N		НАЦИОНАЛЬНАЯ КУХНЯ	hot-food	\N	\N
39	Галушки	800.00	\N	\N	static/images/menu/кукурузные галушки.jpg	НАЦИОНАЛЬНАЯ КУХНЯ	hot-food	\N	\N
40	Голубцы	500.00	\N	\N	static/images/menu/голубцы.jpg	ГОРЯЧИЕ ВТОРЫЕ БЛЮДА	hot-food	\N	\N
41	Перцы фаршированные	500.00	\N	\N	static/images/menu/перцы.jpg	ГОРЯЧИЕ ВТОРЫЕ БЛЮДА	hot-food	\N	\N
42	Котлета с пюре	500.00	\N	\N	static/images/menu/котлета из курицы.jpg	ГОРЯЧИЕ ВТОРЫЕ БЛЮДА	hot-food	\N	\N
43	Зраза куриная с сыром	200.00	\N	\N	static/images/menu/зраза с сыром.jpg	ГОРЯЧИЕ ВТОРЫЕ БЛЮДА	hot-food	\N	\N
44	Зраза куриная с грибами	250.00	\N	\N	static/images/menu/	ГОРЯЧИЕ ВТОРЫЕ БЛЮДА	hot-food	\N	\N
45	Плов мясной	2000.00	\N	\N	static/images/menu/	ГОРЯЧИЕ ВТОРЫЕ БЛЮДА	hot-food	\N	\N
46	Плов сладкий	2500.00	\N	\N	static/images/menu/	ГОРЯЧИЕ ВТОРЫЕ БЛЮДА	hot-food	\N	\N
47	Cтейк лосося с овощами	1200.00	\N	\N	static/images/menu/	ГОРЯЧИЕ ВТОРЫЕ БЛЮДА	hot-food	\N	\N
48	Хинкали 10шт.	1000.00	\N	\N	static/images/menu/хинкали.jpg	ГОРЯЧИЕ ВТОРЫЕ БЛЮДА	hot-food	\N	\N
51	Пельмени 300гр.	500.00	\N	\N	static/images/menu/пельмени.jpg	ГОРЯЧИЕ ВТОРЫЕ БЛЮДА	hot-food	\N	\N
52	Вареники 300гр.	500.00	\N	\N	static/images/menu/вареники с вишней.jpg	ГОРЯЧИЕ ВТОРЫЕ БЛЮДА	hot-food	\N	\N
53	Сырники	500.00	\N	\N	static/images/menu/сырники.jpg	ГОРЯЧИЕ ВТОРЫЕ БЛЮДА	hot-food	\N	\N
49	Манты	700.00	0.00	10	static/images/menu/манты.jpg	ГОРЯЧИЕ ВТОРЫЕ БЛЮДА	hot-food	{}	0
54	Куриный суп с лапшой	500.00	\N	\N		ПЕРВЫЕ БЛЮДА	hot-food	\N	\N
55	Борщ с мясом	500.00	\N	\N		ПЕРВЫЕ БЛЮДА	hot-food	\N	\N
56	Суп с фрикадельками	500.00	\N	\N		ПЕРВЫЕ БЛЮДА	hot-food	\N	\N
57	Нохри чоьрп	600.00	\N	\N		ПЕРВЫЕ БЛЮДА	hot-food	\N	\N
58	Лагман	500.00	\N	\N		ПЕРВЫЕ БЛЮДА	hot-food	\N	\N
59	Гуляш	500.00	\N	\N		ПЕРВЫЕ БЛЮДА	hot-food	\N	\N
60	Мясной бульон	300.00	\N	\N		ПЕРВЫЕ БЛЮДА	hot-food	\N	\N
61	Куриный бульон	1200.00	\N	\N		ПЕРВЫЕ БЛЮДА	hot-food	\N	\N
62	Блинчики с мясом 10 шт.	1000.00	\N	\N		ЗАКУСКИ	hot-food	\N	\N
63	Блинчики с творогом 10 шт.	700.00	\N	\N		ЗАКУСКИ	hot-food	\N	\N
64	Блинчики	500.00	\N	\N		ЗАКУСКИ	hot-food	\N	\N
65	Рулет из баклажанов 10 шт	1000.00	\N	\N		ЗАКУСКИ	hot-food	\N	\N
66	Фаршированные шампиньоны	2000.00	\N	\N		ЗАКУСКИ	hot-food	\N	\N
67	Пхали из свеклы 10 шт.	1000.00	\N	\N		ЗАКУСКИ	hot-food	\N	\N
68	Пхали из шпината 10 шт.	1500.00	\N	\N		ЗАКУСКИ	hot-food	\N	\N
69	Пхали из перца 10шт.	1500.00	\N	\N		ЗАКУСКИ	hot-food	\N	\N
70	Холодец	750.00	\N	\N		ЗАКУСКИ	hot-food	\N	\N
71	Рубленый салат 1 кг.	1300.00	\N	\N		ЛЮБОЙ САЛАТ НА ЗАКАЗ	hot-food	\N	\N
72	Слоёный салат 1 кг.	1500.00	\N	\N		ЛЮБОЙ САЛАТ НА ЗАКАЗ	hot-food	\N	\N
73	Любой вид запеченого мяса 1 кг.	1700.00	\N	\N		ГОРЯЧЕЕ НА КОМПАНИЮ	hot-food	\N	\N
74	Отварная баранья голова и ноги	2000.00	\N	\N		ГОРЯЧЕЕ НА КОМПАНИЮ	hot-food	\N	\N
75	Запеченая курица с овощами 2 кг.	2500.00	\N	\N		ГОРЯЧЕЕ НА КОМПАНИЮ	hot-food	\N	\N
76	Жаренная курица с луком 2кг.	2000.00	\N	\N		ГОРЯЧЕЕ НА КОМПАНИЮ	hot-food	\N	\N
50	Манты с рублёным мясом	900.00	0.00	0	static/images/menu/	ГОРЯЧИЕ ВТОРЫЕ БЛЮДА	hot-food	{}	0
\.


--
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neocoda
--

SELECT pg_catalog.setval('public.products_product_id_seq', 76, true);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: neocoda
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- PostgreSQL database dump complete
--

