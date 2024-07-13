--
-- PostgreSQL database dump
--

-- Dumped from database version 14.12 (Ubuntu 14.12-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.12 (Ubuntu 14.12-0ubuntu0.22.04.1)

-- Started on 2024-07-13 21:01:15 WIB

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
-- TOC entry 217 (class 1259 OID 16702)
-- Name: OrderItems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."OrderItems" (
    id integer NOT NULL,
    "productName" character varying(255),
    "totalItemPrice" bigint,
    qty integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "orderId" integer
);


ALTER TABLE public."OrderItems" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16701)
-- Name: OrderItems_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."OrderItems_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."OrderItems_id_seq" OWNER TO postgres;

--
-- TOC entry 3393 (class 0 OID 0)
-- Dependencies: 216
-- Name: OrderItems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."OrderItems_id_seq" OWNED BY public."OrderItems".id;


--
-- TOC entry 215 (class 1259 OID 16695)
-- Name: Orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Orders" (
    id integer NOT NULL,
    "customerName" character varying(255),
    "totalPrice" bigint,
    discount integer,
    freeongkir boolean,
    "userId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Orders" OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16694)
-- Name: Orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Orders_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Orders_id_seq" OWNER TO postgres;

--
-- TOC entry 3394 (class 0 OID 0)
-- Dependencies: 214
-- Name: Orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Orders_id_seq" OWNED BY public."Orders".id;


--
-- TOC entry 213 (class 1259 OID 16688)
-- Name: Products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Products" (
    id integer NOT NULL,
    "itemName" character varying(255),
    price integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Products" OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16687)
-- Name: Products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Products_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Products_id_seq" OWNER TO postgres;

--
-- TOC entry 3395 (class 0 OID 0)
-- Dependencies: 212
-- Name: Products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Products_id_seq" OWNED BY public."Products".id;


--
-- TOC entry 209 (class 1259 OID 16673)
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);


ALTER TABLE public."SequelizeMeta" OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16679)
-- Name: Users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Users" (
    id integer NOT NULL,
    username character varying(255),
    password character varying(255),
    role character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    name character varying(255)
);


ALTER TABLE public."Users" OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16678)
-- Name: Users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Users_id_seq" OWNER TO postgres;

--
-- TOC entry 3396 (class 0 OID 0)
-- Dependencies: 210
-- Name: Users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Users_id_seq" OWNED BY public."Users".id;


--
-- TOC entry 3229 (class 2604 OID 16705)
-- Name: OrderItems id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderItems" ALTER COLUMN id SET DEFAULT nextval('public."OrderItems_id_seq"'::regclass);


--
-- TOC entry 3228 (class 2604 OID 16698)
-- Name: Orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders" ALTER COLUMN id SET DEFAULT nextval('public."Orders_id_seq"'::regclass);


--
-- TOC entry 3227 (class 2604 OID 16691)
-- Name: Products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products" ALTER COLUMN id SET DEFAULT nextval('public."Products_id_seq"'::regclass);


--
-- TOC entry 3226 (class 2604 OID 16682)
-- Name: Users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users" ALTER COLUMN id SET DEFAULT nextval('public."Users_id_seq"'::regclass);


--
-- TOC entry 3387 (class 0 OID 16702)
-- Dependencies: 217
-- Data for Name: OrderItems; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."OrderItems" (id, "productName", "totalItemPrice", qty, "createdAt", "updatedAt", "orderId") FROM stdin;
12	Sosis Frozen	15000	3	2024-07-13 20:08:54.449+07	2024-07-13 20:08:54.449+07	5
13	Ice Cream	6000	2	2024-07-13 20:08:54.45+07	2024-07-13 20:08:54.45+07	5
14	Parfum Pria	30000	1	2024-07-13 20:08:54.45+07	2024-07-13 20:08:54.45+07	5
15	Shampoo	25000	1	2024-07-13 20:08:54.45+07	2024-07-13 20:08:54.45+07	5
16	Sosis Frozen	15000	3	2024-07-13 20:09:35.99+07	2024-07-13 20:09:35.99+07	5
17	Ice Cream	6000	2	2024-07-13 20:09:35.99+07	2024-07-13 20:09:35.99+07	5
18	Parfum Pria	30000	1	2024-07-13 20:09:35.99+07	2024-07-13 20:09:35.99+07	5
19	Shampoo	25000	1	2024-07-13 20:09:35.99+07	2024-07-13 20:09:35.99+07	5
20	Ice Cream	12000	4	2024-07-13 20:12:08.114+07	2024-07-13 20:12:08.114+07	5
21	Sosis Frozen	5000	1	2024-07-13 20:14:45.082+07	2024-07-13 20:14:45.082+07	8
22	Bakso Frozen	7000	1	2024-07-13 20:14:45.082+07	2024-07-13 20:14:45.082+07	8
23	Ice Cream	3000	1	2024-07-13 20:14:45.082+07	2024-07-13 20:14:45.082+07	8
24	Kaos Katun	45000	1	2024-07-13 20:15:40.685+07	2024-07-13 20:15:40.685+07	8
25	Shampoo	25000	1	2024-07-13 20:15:40.685+07	2024-07-13 20:15:40.685+07	8
26	Sabun Cair	10000	1	2024-07-13 20:15:40.686+07	2024-07-13 20:15:40.686+07	8
27	Parfum Wanita	35000	1	2024-07-13 20:15:40.686+07	2024-07-13 20:15:40.686+07	8
28	Susu UHT 1L	80000	4	2024-07-13 20:15:40.686+07	2024-07-13 20:15:40.686+07	8
\.


--
-- TOC entry 3385 (class 0 OID 16695)
-- Dependencies: 215
-- Data for Name: Orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Orders" (id, "customerName", "totalPrice", discount, freeongkir, "userId", "createdAt", "updatedAt") FROM stdin;
5	Jack	68400	7600	t	3	2024-07-13 20:08:54.436+07	2024-07-13 20:08:54.436+07
6	Jack	68400	7600	t	3	2024-07-13 20:09:35.974+07	2024-07-13 20:09:35.974+07
7	Jack	12000	0	f	3	2024-07-13 20:12:08.088+07	2024-07-13 20:12:08.088+07
8	Jhon	15000	0	f	1	2024-07-13 20:14:45.072+07	2024-07-13 20:14:45.072+07
9	Jhon	175500	19500	t	1	2024-07-13 20:15:40.677+07	2024-07-13 20:15:40.677+07
\.


--
-- TOC entry 3383 (class 0 OID 16688)
-- Dependencies: 213
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Products" (id, "itemName", price, "createdAt", "updatedAt") FROM stdin;
1	Sosis Frozen	5000	2024-07-13 13:45:37.305+07	2024-07-13 13:45:37.305+07
2	Bakso Frozen	7000	2024-07-13 13:46:01.916+07	2024-07-13 13:46:01.916+07
3	Ice Cream	3000	2024-07-13 13:46:19.105+07	2024-07-13 13:46:19.105+07
4	Susu UHT 125ml	3000	2024-07-13 13:46:53.964+07	2024-07-13 13:46:53.964+07
5	Susu UHT 1L	20000	2024-07-13 13:47:03.557+07	2024-07-13 13:47:03.557+07
6	Parfum Pria	30000	2024-07-13 13:47:20.969+07	2024-07-13 13:47:20.969+07
7	Parfum Wanita	35000	2024-07-13 13:47:30.177+07	2024-07-13 13:47:30.177+07
9	Sabun Cair	10000	2024-07-13 17:13:57.035+07	2024-07-13 17:13:57.035+07
10	Shampoo	25000	2024-07-13 17:14:17.331+07	2024-07-13 17:14:17.331+07
12	Kaos Katun	45000	2024-07-13 19:55:36.639+07	2024-07-13 19:55:36.639+07
\.


--
-- TOC entry 3379 (class 0 OID 16673)
-- Dependencies: 209
-- Data for Name: SequelizeMeta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SequelizeMeta" (name) FROM stdin;
20240713030356-create-user.js
20240713030445-create-product.js
20240713030456-create-order.js
20240713030505-create-order-item.js
\.


--
-- TOC entry 3381 (class 0 OID 16679)
-- Dependencies: 211
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Users" (id, username, password, role, "createdAt", "updatedAt", name) FROM stdin;
1	customer1	$2b$10$IijQgbyWDtYRL7egME3HFO.3iHlG9HhDxZaDUyZHQ8NaRjR8kkAWq	customer	2024-07-13 13:03:15.821+07	2024-07-13 13:03:15.821+07	Jhon
2	merchant1	$2b$10$yZV2nTp8rac3ViD.8naUCuMnjCgSxBivomvHj1VKm48VodEgdp.KC	merchant	2024-07-13 13:10:58.863+07	2024-07-13 13:10:58.863+07	Toko Hijau
3	customer2	$2b$10$ZSCB6ywt4aon47HkMIDy4.kvhUvp1aiYU0PiIQKXX/mZCqYy5OP0K	customer	2024-07-13 13:11:24.24+07	2024-07-13 13:11:24.24+07	Jack
4	customer3	$2b$10$Esr2Jrn40zEuTI.HuUXS1.vBaCkg9aUCUmH0z7.Tb5P9I3b7Ekijm	customer	2024-07-13 13:11:31.034+07	2024-07-13 13:11:31.034+07	Lili
\.


--
-- TOC entry 3397 (class 0 OID 0)
-- Dependencies: 216
-- Name: OrderItems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."OrderItems_id_seq"', 28, true);


--
-- TOC entry 3398 (class 0 OID 0)
-- Dependencies: 214
-- Name: Orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Orders_id_seq"', 9, true);


--
-- TOC entry 3399 (class 0 OID 0)
-- Dependencies: 212
-- Name: Products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Products_id_seq"', 12, true);


--
-- TOC entry 3400 (class 0 OID 0)
-- Dependencies: 210
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Users_id_seq"', 5, true);


--
-- TOC entry 3239 (class 2606 OID 16707)
-- Name: OrderItems OrderItems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderItems"
    ADD CONSTRAINT "OrderItems_pkey" PRIMARY KEY (id);


--
-- TOC entry 3237 (class 2606 OID 16700)
-- Name: Orders Orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_pkey" PRIMARY KEY (id);


--
-- TOC entry 3235 (class 2606 OID 16693)
-- Name: Products Products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_pkey" PRIMARY KEY (id);


--
-- TOC entry 3231 (class 2606 OID 16677)
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- TOC entry 3233 (class 2606 OID 16686)
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


-- Completed on 2024-07-13 21:01:15 WIB

--
-- PostgreSQL database dump complete
--

