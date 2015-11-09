--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.5
-- Dumped by pg_dump version 9.4.4
-- Started on 2015-11-09 10:20:43 EST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 199 (class 3079 OID 11893)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2222 (class 0 OID 0)
-- Dependencies: 199
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 179 (class 1259 OID 5812934)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


--
-- TOC entry 178 (class 1259 OID 5812932)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2223 (class 0 OID 0)
-- Dependencies: 178
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- TOC entry 181 (class 1259 OID 5812944)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- TOC entry 180 (class 1259 OID 5812942)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2224 (class 0 OID 0)
-- Dependencies: 180
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- TOC entry 177 (class 1259 OID 5812924)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 5812922)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2225 (class 0 OID 0)
-- Dependencies: 176
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- TOC entry 183 (class 1259 OID 5812954)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


--
-- TOC entry 185 (class 1259 OID 5812964)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- TOC entry 184 (class 1259 OID 5812962)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2226 (class 0 OID 0)
-- Dependencies: 184
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- TOC entry 182 (class 1259 OID 5812952)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2227 (class 0 OID 0)
-- Dependencies: 182
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- TOC entry 187 (class 1259 OID 5812974)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- TOC entry 186 (class 1259 OID 5812972)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2228 (class 0 OID 0)
-- Dependencies: 186
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- TOC entry 189 (class 1259 OID 5813028)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


--
-- TOC entry 188 (class 1259 OID 5813026)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2229 (class 0 OID 0)
-- Dependencies: 188
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- TOC entry 175 (class 1259 OID 5812914)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- TOC entry 174 (class 1259 OID 5812912)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2230 (class 0 OID 0)
-- Dependencies: 174
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- TOC entry 173 (class 1259 OID 5812903)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- TOC entry 172 (class 1259 OID 5812901)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2231 (class 0 OID 0)
-- Dependencies: 172
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- TOC entry 190 (class 1259 OID 5813050)
-- Name: django_session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- TOC entry 192 (class 1259 OID 5813062)
-- Name: store_customer; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE store_customer (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    birthdate date
);


--
-- TOC entry 191 (class 1259 OID 5813060)
-- Name: store_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE store_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2232 (class 0 OID 0)
-- Dependencies: 191
-- Name: store_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE store_customer_id_seq OWNED BY store_customer.id;


--
-- TOC entry 194 (class 1259 OID 5813070)
-- Name: store_lineitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE store_lineitem (
    id integer NOT NULL,
    quantity integer NOT NULL,
    product_id integer NOT NULL,
    sale_id integer NOT NULL
);


--
-- TOC entry 193 (class 1259 OID 5813068)
-- Name: store_lineitem_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE store_lineitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2233 (class 0 OID 0)
-- Dependencies: 193
-- Name: store_lineitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE store_lineitem_id_seq OWNED BY store_lineitem.id;


--
-- TOC entry 196 (class 1259 OID 5813078)
-- Name: store_product; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE store_product (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    price numeric(10,2) NOT NULL
);


--
-- TOC entry 195 (class 1259 OID 5813076)
-- Name: store_product_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE store_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2234 (class 0 OID 0)
-- Dependencies: 195
-- Name: store_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE store_product_id_seq OWNED BY store_product.id;


--
-- TOC entry 198 (class 1259 OID 5813086)
-- Name: store_sale; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE store_sale (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    order_date date NOT NULL
);


--
-- TOC entry 197 (class 1259 OID 5813084)
-- Name: store_sale_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE store_sale_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2235 (class 0 OID 0)
-- Dependencies: 197
-- Name: store_sale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE store_sale_id_seq OWNED BY store_sale.id;


--
-- TOC entry 1999 (class 2604 OID 5812937)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- TOC entry 2000 (class 2604 OID 5812947)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 1998 (class 2604 OID 5812927)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- TOC entry 2001 (class 2604 OID 5812957)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- TOC entry 2002 (class 2604 OID 5812967)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- TOC entry 2003 (class 2604 OID 5812977)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 2004 (class 2604 OID 5813031)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- TOC entry 1997 (class 2604 OID 5812917)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- TOC entry 1996 (class 2604 OID 5812906)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- TOC entry 2006 (class 2604 OID 5813065)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY store_customer ALTER COLUMN id SET DEFAULT nextval('store_customer_id_seq'::regclass);


--
-- TOC entry 2007 (class 2604 OID 5813073)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY store_lineitem ALTER COLUMN id SET DEFAULT nextval('store_lineitem_id_seq'::regclass);


--
-- TOC entry 2008 (class 2604 OID 5813081)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY store_product ALTER COLUMN id SET DEFAULT nextval('store_product_id_seq'::regclass);


--
-- TOC entry 2009 (class 2604 OID 5813089)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY store_sale ALTER COLUMN id SET DEFAULT nextval('store_sale_id_seq'::regclass);


--
-- TOC entry 2196 (class 0 OID 5812934)
-- Dependencies: 179
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 2236 (class 0 OID 0)
-- Dependencies: 178
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- TOC entry 2198 (class 0 OID 5812944)
-- Dependencies: 181
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 2237 (class 0 OID 0)
-- Dependencies: 180
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 2194 (class 0 OID 5812924)
-- Dependencies: 177
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add customer	7	add_customer
20	Can change customer	7	change_customer
21	Can delete customer	7	delete_customer
22	Can add product	8	add_product
23	Can change product	8	change_product
24	Can delete product	8	delete_product
25	Can add sale	9	add_sale
26	Can change sale	9	change_sale
27	Can delete sale	9	delete_sale
28	Can add line item	10	add_lineitem
29	Can change line item	10	change_lineitem
30	Can delete line item	10	delete_lineitem
\.


--
-- TOC entry 2238 (class 0 OID 0)
-- Dependencies: 176
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_permission_id_seq', 30, true);


--
-- TOC entry 2200 (class 0 OID 5812954)
-- Dependencies: 183
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$20000$hjsJaveEsdeD$oc7u0SnQKIbl42774tephuRGFldI9QF+9tgqjmWeLSE=	\N	t	chris			chris@chriscurvey.com	t	t	2015-08-19 17:42:30.52725-04
\.


--
-- TOC entry 2202 (class 0 OID 5812964)
-- Dependencies: 185
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 2239 (class 0 OID 0)
-- Dependencies: 184
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- TOC entry 2240 (class 0 OID 0)
-- Dependencies: 182
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- TOC entry 2204 (class 0 OID 5812974)
-- Dependencies: 187
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 2241 (class 0 OID 0)
-- Dependencies: 186
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 2206 (class 0 OID 5813028)
-- Dependencies: 189
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- TOC entry 2242 (class 0 OID 0)
-- Dependencies: 188
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- TOC entry 2192 (class 0 OID 5812914)
-- Dependencies: 175
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	store	customer
8	store	product
9	store	sale
10	store	lineitem
\.


--
-- TOC entry 2243 (class 0 OID 0)
-- Dependencies: 174
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_content_type_id_seq', 10, true);


--
-- TOC entry 2190 (class 0 OID 5812903)
-- Dependencies: 173
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2015-08-19 17:42:19.700058-04
2	auth	0001_initial	2015-08-19 17:42:20.449358-04
3	admin	0001_initial	2015-08-19 17:42:20.649408-04
4	contenttypes	0002_remove_content_type_name	2015-08-19 17:42:20.69959-04
5	auth	0002_alter_permission_name_max_length	2015-08-19 17:42:20.72455-04
6	auth	0003_alter_user_email_max_length	2015-08-19 17:42:20.749486-04
7	auth	0004_alter_user_username_opts	2015-08-19 17:42:20.77023-04
8	auth	0005_alter_user_last_login_null	2015-08-19 17:42:20.791151-04
9	auth	0006_require_contenttypes_0002	2015-08-19 17:42:20.7994-04
10	sessions	0001_initial	2015-08-19 17:42:20.924924-04
11	store	0001_initial	2015-08-19 17:47:25.413716-04
12	store	0002_auto_20150819_2225	2015-08-19 18:25:50.484637-04
13	store	0003_auto_20151104_1349	2015-11-04 08:51:26.022767-05
14	store	0004_auto_20151104_1352	2015-11-04 08:54:41.049483-05
\.


--
-- TOC entry 2244 (class 0 OID 0)
-- Dependencies: 172
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_migrations_id_seq', 14, true);


--
-- TOC entry 2207 (class 0 OID 5813050)
-- Dependencies: 190
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- TOC entry 2209 (class 0 OID 5813062)
-- Dependencies: 192
-- Data for Name: store_customer; Type: TABLE DATA; Schema: public; Owner: -
--

COPY store_customer (id, name, birthdate) FROM stdin;
301	zNWaOGgfEogb	1985-04-07
302	fRdyebQYDhiP	1968-03-06
303	nUiJRcYHbLxB	1953-09-03
304	LChlEVaYHUyk	1950-12-01
305	LKXBZKVqmagj	1994-11-02
306	EgnimnijSqMi	1991-03-17
307	jlhBOknfqyyB	1979-05-05
308	voyRmQFJRdfl	1975-07-23
309	SERuqsVCIcUA	1996-08-05
310	RBxqENkJYPlu	1990-08-02
311	zSLTLcmgiPgy	1992-03-27
312	dUIbLPFmXUBk	1989-08-28
313	DUUyegBMRaHM	1956-12-23
314	vAgyeEJNFfbc	1997-03-11
315	YFGaxsVXbvMy	1970-05-17
316	PBnWOVuPCygC	1961-07-19
317	lFYtewINtZTh	1999-08-27
318	wEmMTnUSdrPD	1954-12-14
319	lJFSKXHYGIIY	1979-10-02
320	CCWsXkTptpQX	1987-01-11
321	PjydLuZNJFlX	1961-08-08
322	hEjtBNgaVNyR	1976-06-06
323	uEqWydyNJaYp	1977-11-28
324	ZfUtGoeIFRHo	1969-08-18
325	mfbgAVpvWbkm	1996-07-05
326	SONxAdcZvuyA	1957-11-12
327	eslOqUkncwfy	1974-07-22
328	xyGRijcgBVsA	1951-05-08
329	PvriHTbtUuId	1973-07-16
330	VoMKbXxAgJcy	1968-11-04
331	QultwmmeGBew	1965-12-13
332	QHIxKkrOEDjz	1990-07-29
333	fUccXaWtQMSp	1955-06-15
334	JsyfljUGTnvX	1966-08-04
335	rELyMdeNfBcg	1965-08-06
336	tYrPghkzaVxJ	1982-02-10
337	bwNpUdTtDEXF	1962-01-13
338	oPhxonLIlopc	1996-11-12
339	YuJJbWHryZCv	1997-07-26
340	WJWUXUXUXxHz	1985-01-28
341	UNcAPwiaeAND	1970-04-13
342	dRkFIbIFHwnq	1953-07-30
343	UDrqukNEkCYp	1978-08-21
344	eLkjQlivFFDK	1955-12-28
345	VsRyZyUGLZzv	1992-11-27
346	BEJTHiOgulbS	1981-10-25
347	ZTqbnJlxFkwZ	1954-08-14
348	LrmXsGkMHrUG	1957-04-06
349	uZFMWlFHoftf	1967-01-14
350	djXvWEFXdZpy	1993-02-11
351	mUdoPROxyECz	1975-03-14
352	agHLMHCsPUlf	1978-12-10
353	VpNlqbvsxdwd	1976-08-25
354	nKQZmDlKGuDT	1995-02-06
355	VFPJuJaxfPuW	1996-06-07
356	ISmdwcAZHtdn	1984-10-09
357	VzLWzbcRBgCJ	1970-12-09
358	ioocpcFIybbG	1982-03-29
359	FWMpSLnfZiPY	1952-08-16
360	PfHrnYlyGesN	1981-06-09
361	PTWgaCKZpNjU	1990-03-23
362	YOSxLHPURCfY	1990-02-01
363	kVbPKTGZUnFa	1956-08-02
364	WuEHlPHmQMUt	1950-11-01
365	zarzPTNbFGZE	1979-02-27
366	UHRGXoEzUkmk	2000-11-26
367	oDdzWhhxOsxP	1999-11-22
368	bGibkCEDXZjO	1979-12-09
369	abXcdheqlfkq	1984-10-08
370	BzepfQMUeeWS	1980-10-01
371	GiAHsKCkBigB	1962-07-19
372	hagPEqKSNzgd	1987-07-19
373	vbAJMjOfVltg	1951-06-25
374	YKdtnxdkPRtJ	1953-05-05
375	ewGcbjUqQdsa	1952-06-28
376	cMdNcohRuDPp	1952-09-25
377	TdBehQQHcOdP	1973-02-10
378	ZJzHeVCTBkDy	1987-03-10
379	eJoanWiwtBnd	1995-03-14
380	FoYLzfgMfuYL	1968-05-06
381	OOOLrbPgQtCY	1987-04-14
382	iacVNaOGlZdU	1985-06-22
383	okgayPBQnARJ	1981-08-25
384	pQEhAvHYuXGP	1953-06-06
385	jHpkglaybDcu	1989-04-22
386	mMqhhSrdNaHA	1973-11-12
387	HHfEKUCARpOE	1988-12-14
388	BauoipecqRRr	1973-12-07
389	KGRICsCEgJes	1972-11-19
390	hyerIbAsvzkH	1984-03-29
391	vyJuiiRoxqyg	1966-11-10
392	sHFlVfvCkwiV	1975-03-23
393	iyeYmsTGfbHX	1961-06-17
394	DeBLradJTpfU	1964-01-22
395	ueBFNklawtIR	1973-07-04
396	gJaeJrvFDlOi	1961-03-07
397	xLuodgYEXMUC	1959-09-21
398	OVjzegVejdwW	1962-02-11
399	gbVpevJkPwhx	1954-04-21
400	jWJdJsvRVRvd	1991-02-08
\.


--
-- TOC entry 2245 (class 0 OID 0)
-- Dependencies: 191
-- Name: store_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('store_customer_id_seq', 400, true);


--
-- TOC entry 2211 (class 0 OID 5813070)
-- Dependencies: 194
-- Data for Name: store_lineitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY store_lineitem (id, quantity, product_id, sale_id) FROM stdin;
5646	4	68	1037
5647	5	68	1037
10934	4	79	1985
10935	5	72	1986
10936	2	68	1986
10937	1	66	1986
10938	5	77	1986
10939	3	62	1986
10940	4	77	1986
10941	1	63	1987
10942	3	71	1987
10943	4	80	1987
10944	2	76	1987
10945	3	63	1987
10946	4	69	1987
10947	3	76	1987
10948	4	77	1987
10949	5	65	1987
10950	1	64	1988
10951	1	77	1988
10952	3	68	1988
10953	3	78	1988
10954	1	70	1988
10955	2	75	1988
10956	4	64	1989
10957	5	65	1989
10958	2	62	1989
10959	1	61	1989
10960	1	69	1989
10961	3	66	1989
10962	1	70	1989
10963	2	70	1989
10964	1	74	1989
10965	1	71	1990
10966	2	67	1990
10967	4	66	1990
10968	3	80	1990
10969	2	66	1990
10970	1	63	1990
10971	5	72	1990
10972	2	79	1990
10973	1	70	1990
10974	3	77	1991
10975	5	76	1992
10976	3	73	1992
10977	4	62	1992
10978	3	77	1992
10979	4	79	1992
10980	4	75	1992
10981	3	73	1993
10982	1	80	1993
10983	1	63	1993
10984	4	79	1994
10985	2	61	1994
10986	4	69	1995
10987	3	61	1995
10988	2	61	1995
10989	5	77	1995
10990	2	68	1995
10991	4	78	1995
10992	3	65	1995
10993	5	71	1995
10994	1	63	1996
10995	4	74	1996
10996	3	65	1996
10997	3	63	1996
10998	3	67	1996
10999	5	80	1996
11000	3	71	1996
11001	3	66	1997
11002	4	75	1997
11003	4	80	1998
11004	5	75	1999
11005	2	75	1999
11006	2	77	1999
11007	5	74	1999
11008	2	75	1999
11009	4	69	2000
11010	2	67	2000
11011	1	66	2000
11012	2	77	2000
11013	4	80	2000
11014	5	79	2001
11015	5	75	2001
11016	5	65	2001
11017	4	65	2001
11018	2	68	2001
11019	3	69	2001
11020	1	70	2002
11021	3	71	2002
11022	5	67	2002
11023	4	66	2002
11024	1	62	2002
11025	3	76	2002
5648	1	67	1038
5649	1	76	1038
5650	1	63	1038
5651	2	62	1038
5652	4	78	1039
5653	2	61	1039
5654	2	66	1039
5655	5	74	1039
5656	5	61	1039
5657	3	62	1040
5658	3	76	1040
5659	3	73	1041
5660	4	78	1041
5661	5	64	1041
5662	1	66	1041
5663	3	67	1041
5664	4	63	1041
5665	3	61	1041
5666	3	68	1041
5667	3	64	1041
5668	5	68	1041
5669	1	77	1042
5670	4	76	1042
5671	1	73	1042
5672	5	70	1043
5673	1	80	1043
5674	5	63	1043
5675	4	65	1043
5676	2	62	1043
5677	1	65	1044
5678	5	66	1045
5679	3	67	1045
5680	4	62	1045
5681	5	63	1045
5682	1	66	1045
5683	1	62	1045
5684	5	80	1046
5685	3	79	1047
5686	4	73	1047
5687	1	77	1047
5688	1	71	1048
5689	2	67	1049
5690	5	78	1049
5691	2	67	1049
5692	3	76	1050
5693	2	65	1050
5694	2	64	1050
5695	4	80	1050
5696	5	65	1050
5697	4	62	1050
5698	4	66	1050
5699	3	73	1051
5700	1	61	1051
5701	1	78	1051
5702	1	80	1051
5703	5	75	1051
5704	2	74	1051
5705	4	64	1051
5706	4	62	1051
5707	1	73	1052
5708	3	70	1052
5709	2	75	1053
5710	5	78	1053
5711	1	74	1053
5712	5	65	1053
5713	1	69	1053
5714	5	74	1053
5715	3	69	1053
5716	5	72	1053
5717	1	63	1053
5718	5	65	1054
5719	4	74	1055
5720	2	68	1055
5721	1	73	1055
5722	2	61	1055
5723	2	77	1056
5724	3	74	1056
5725	1	63	1056
5726	4	65	1056
5727	2	69	1056
5728	1	63	1056
5729	4	77	1056
5730	4	65	1056
5731	3	70	1057
5732	2	69	1057
5733	2	80	1057
5734	1	77	1057
5735	1	72	1058
5736	3	64	1058
5737	4	67	1058
5738	3	79	1058
5739	2	76	1059
5740	4	79	1059
5741	4	72	1059
5742	2	70	1059
5743	2	77	1059
5744	4	68	1060
5745	2	78	1060
5746	2	74	1060
5747	2	63	1060
5748	3	77	1060
5749	4	78	1061
5750	2	61	1061
5751	3	79	1061
5752	3	69	1061
5753	2	80	1061
5754	5	79	1061
5755	4	61	1061
5756	5	80	1061
5757	1	76	1062
5758	3	72	1062
5759	4	78	1062
5760	2	74	1062
5761	5	64	1062
5762	3	67	1062
5763	5	73	1063
5764	2	74	1063
5765	3	70	1063
5766	4	67	1063
5767	4	76	1063
5768	1	73	1063
5769	4	66	1063
5770	1	61	1063
5771	3	62	1063
5772	5	61	1064
5773	5	78	1064
5774	4	69	1065
5775	4	70	1065
5776	2	73	1065
5777	5	75	1065
5778	4	66	1065
5779	2	74	1065
5780	2	66	1065
5781	1	62	1066
5782	3	67	1066
5783	5	72	1066
5784	1	78	1066
5785	5	74	1066
5786	5	68	1066
5787	2	75	1066
5788	5	68	1066
5789	2	63	1067
5790	2	69	1067
5791	1	79	1068
5792	5	74	1068
5793	4	71	1068
5794	1	64	1068
5795	1	70	1068
5796	2	72	1068
5797	5	71	1069
5798	5	74	1069
5799	3	63	1069
5800	1	61	1069
5801	3	61	1070
5802	3	77	1070
5803	3	62	1071
5804	5	70	1071
5805	4	78	1071
5806	5	65	1071
5807	4	78	1071
5808	1	75	1071
5809	4	66	1072
5810	4	76	1073
5811	3	67	1073
5812	5	62	1073
5813	5	64	1073
5814	1	80	1073
5815	4	78	1073
5816	3	66	1073
5817	3	70	1073
5818	5	70	1074
5819	2	70	1074
5820	5	79	1075
5821	3	61	1075
5822	4	67	1075
5823	4	74	1075
5824	1	80	1075
5825	1	70	1075
5826	4	61	1075
5827	1	80	1076
5828	2	66	1076
5829	4	78	1076
5830	5	76	1076
5831	1	75	1076
5832	5	71	1077
5833	2	67	1077
5834	2	74	1077
5835	2	63	1078
5836	2	75	1079
5837	5	64	1080
5838	5	80	1080
5839	4	62	1080
5840	5	72	1081
5841	2	79	1081
5842	3	64	1081
5843	3	65	1081
5844	5	68	1081
5845	3	75	1081
5846	4	69	1081
5847	2	74	1081
5848	4	66	1081
5849	2	73	1082
5850	5	74	1082
5851	5	74	1082
5852	5	62	1083
5853	4	69	1083
5854	4	62	1083
5855	4	67	1083
5856	3	77	1084
5857	5	71	1084
5858	5	65	1084
5859	1	71	1084
5860	5	80	1084
5861	2	66	1084
5862	4	70	1085
5863	1	73	1085
5864	4	71	1086
5865	5	63	1086
5866	3	73	1086
5867	2	70	1086
5868	3	76	1086
5869	3	63	1086
5870	1	72	1086
5871	5	76	1086
5872	2	65	1086
5873	4	72	1087
5874	2	75	1087
5875	3	61	1087
5876	3	77	1087
5877	4	62	1087
5878	1	63	1087
5879	3	72	1087
5880	3	73	1087
5881	4	63	1088
5882	5	61	1089
5883	4	63	1089
5884	3	63	1089
5885	5	73	1089
5886	3	74	1089
5887	4	72	1089
5888	1	72	1089
5889	1	61	1089
5890	5	77	1090
5891	4	72	1090
5892	4	80	1090
5893	3	76	1090
5894	5	79	1090
5895	3	69	1090
5896	5	77	1090
5897	2	79	1090
5898	3	73	1090
5899	4	73	1091
5900	2	75	1091
5901	4	79	1091
5902	5	63	1091
5903	5	71	1091
5904	1	72	1091
5905	2	61	1092
5906	2	61	1092
5907	5	75	1093
5908	2	73	1093
5909	5	79	1093
5910	1	64	1093
5911	3	61	1093
5912	1	72	1093
5913	2	66	1093
5914	3	70	1093
5915	2	79	1093
5916	4	73	1094
5917	3	70	1094
5918	5	69	1094
5919	5	67	1094
5920	1	68	1094
5921	2	67	1094
5922	5	73	1094
5923	3	71	1095
5924	1	75	1095
5925	1	73	1095
5926	2	72	1095
5927	5	80	1095
5928	4	74	1095
5929	1	71	1095
5930	1	63	1096
5931	3	77	1096
5932	4	72	1097
5933	2	65	1098
5934	3	61	1098
5935	3	69	1099
5936	5	62	1100
5937	5	69	1100
5938	2	74	1100
5939	5	62	1100
5940	5	78	1100
5941	4	69	1101
5942	3	75	1101
5943	1	73	1101
5944	4	72	1101
5945	3	79	1101
5946	5	80	1101
5947	1	72	1101
5948	2	71	1101
5949	5	67	1102
5950	3	72	1102
5951	1	70	1102
5952	3	61	1102
5953	1	63	1103
5954	5	69	1103
5955	1	75	1103
5956	1	77	1103
5957	3	69	1104
5958	1	64	1104
5959	5	68	1104
5960	3	79	1104
5961	2	73	1104
5962	4	76	1104
5963	3	80	1104
5964	1	77	1105
5965	5	67	1105
5966	1	74	1105
5967	2	69	1105
5968	1	65	1105
5969	4	76	1105
5970	1	74	1105
5971	3	68	1105
5972	4	80	1106
5973	4	62	1106
5974	2	70	1106
5975	3	78	1106
5976	2	72	1106
5977	2	77	1106
5978	1	62	1106
5979	1	61	1107
5980	4	72	1108
5981	1	73	1108
5982	1	65	1108
5983	5	63	1108
5984	4	63	1108
5985	2	78	1108
5986	3	67	1109
5987	4	70	1109
5988	5	68	1109
5989	4	76	1109
5990	4	70	1109
5991	1	62	1110
5992	2	79	1110
5993	3	73	1110
5994	3	64	1110
5995	3	71	1110
5996	5	66	1110
5997	5	70	1111
5998	1	74	1111
5999	5	72	1111
6000	2	72	1111
6001	5	80	1111
6002	5	72	1111
6003	2	68	1111
6004	1	80	1111
6005	3	72	1111
6006	5	64	1111
6007	3	78	1112
6008	4	68	1112
6009	3	63	1113
6010	3	76	1113
6011	4	67	1114
6012	2	78	1114
6013	4	68	1114
6014	4	75	1114
6015	5	78	1115
6016	1	80	1116
6017	5	66	1116
6018	3	74	1116
6019	4	62	1116
6020	3	72	1116
6021	3	73	1116
6022	1	67	1116
6023	2	75	1116
6024	4	69	1117
6025	2	78	1117
6026	2	72	1117
6027	4	67	1117
6028	3	73	1117
6029	3	74	1117
6030	5	76	1117
6031	3	61	1118
6032	5	76	1118
6033	5	61	1118
6034	3	64	1119
6035	3	72	1119
6036	3	62	1119
6037	3	71	1119
6038	5	73	1119
6039	1	64	1119
6040	1	65	1119
6041	2	80	1119
6042	5	61	1120
6043	3	79	1120
6044	3	75	1120
6045	4	80	1121
6046	2	74	1121
6047	2	61	1121
6048	4	65	1122
6049	2	66	1122
6050	3	64	1122
6051	5	68	1123
6052	4	68	1123
6053	3	72	1123
6054	2	70	1123
6055	3	78	1123
6056	3	68	1123
6057	3	64	1123
6058	4	80	1123
6059	4	69	1123
6060	5	64	1124
6061	3	80	1124
6062	1	70	1124
6063	2	62	1125
6064	3	74	1125
6065	5	78	1125
6066	4	79	1125
6067	3	79	1125
6068	4	69	1125
6069	3	64	1125
6070	5	69	1125
6071	1	79	1126
6072	4	65	1127
6073	3	79	1127
6074	5	77	1127
6075	2	72	1127
6076	1	63	1127
6077	1	66	1127
6078	1	80	1127
6079	2	77	1128
6080	5	61	1128
6081	2	68	1128
6082	3	80	1128
6083	5	76	1128
6084	5	61	1128
6085	1	62	1128
6086	1	65	1128
6087	4	70	1128
6088	3	80	1128
6089	1	72	1129
6090	1	70	1129
6091	4	77	1129
6092	3	61	1129
6093	5	73	1129
6094	2	63	1129
6095	4	63	1130
6096	1	77	1130
6097	3	77	1130
6098	1	61	1130
6099	4	79	1131
6100	5	68	1131
6101	1	80	1131
6102	3	62	1131
6103	3	71	1131
6104	2	62	1131
6105	4	71	1131
6106	3	65	1132
6107	3	66	1132
6108	3	73	1132
6109	4	70	1132
6110	1	63	1132
6111	5	69	1132
6112	2	80	1133
6113	2	72	1133
6114	1	64	1133
6115	5	73	1133
6116	4	73	1133
6117	3	74	1133
6118	3	61	1133
6119	3	79	1134
6120	2	78	1134
6121	4	61	1135
6122	2	72	1135
6123	1	78	1135
6124	1	67	1135
6125	3	61	1135
6126	2	73	1135
6127	4	70	1135
6128	3	80	1136
6129	1	71	1136
6130	4	64	1136
6131	4	78	1136
6132	5	70	1136
6133	5	62	1137
6134	2	78	1137
6135	5	66	1137
6136	4	68	1137
6137	5	69	1138
6138	4	62	1138
6139	1	63	1138
6140	2	77	1138
6141	4	62	1138
6142	5	79	1138
6143	2	69	1138
6144	4	62	1139
6145	5	63	1139
6146	1	71	1139
6147	1	75	1139
6148	2	75	1140
6149	5	80	1140
6150	3	72	1140
6151	2	75	1140
6152	3	77	1140
6153	5	71	1140
6154	3	68	1140
6155	3	79	1140
6156	2	79	1141
6157	5	80	1141
6158	1	70	1141
6159	2	70	1141
6160	3	74	1141
6161	4	71	1141
6162	1	79	1141
6163	3	68	1141
6164	2	78	1141
6165	5	62	1141
6166	1	64	1142
6167	5	63	1143
6168	5	62	1143
6169	1	66	1143
6170	1	77	1143
6171	5	74	1143
6172	4	67	1144
6173	4	76	1144
6174	3	62	1144
6175	1	62	1144
6176	5	80	1144
6177	1	68	1144
6178	2	68	1145
6179	1	77	1145
6180	2	71	1145
6181	2	71	1145
6182	4	75	1145
6183	4	65	1145
6184	5	71	1145
6185	1	77	1145
6186	5	65	1145
6187	3	65	1145
6188	5	79	1146
6189	5	76	1146
6190	2	63	1146
6191	3	73	1146
6192	1	77	1146
6193	5	63	1146
6194	1	63	1147
6195	3	76	1147
6196	3	71	1147
6197	1	72	1147
6198	2	64	1148
6199	2	70	1148
6200	2	71	1148
6201	4	65	1148
6202	1	73	1149
6203	4	70	1149
6204	1	64	1149
6205	5	67	1149
6206	1	74	1150
6207	5	64	1150
6208	3	73	1150
6209	4	72	1150
6210	3	75	1150
6211	1	61	1151
6212	3	67	1151
6213	3	72	1151
6214	3	63	1151
6215	1	70	1151
6216	4	61	1151
6217	3	76	1151
6218	5	61	1151
6219	4	66	1152
6220	4	70	1152
6221	5	65	1152
6222	1	67	1152
6223	2	73	1152
6224	2	74	1153
6225	3	75	1153
6226	1	79	1153
6227	1	72	1153
6228	4	71	1153
6229	3	74	1153
6230	3	73	1154
6231	5	61	1154
6232	1	67	1154
6233	5	69	1155
6234	3	69	1155
6235	2	76	1155
6236	3	71	1155
6237	2	61	1155
6238	1	70	1155
6239	3	70	1155
6240	2	67	1155
6241	5	64	1155
6242	1	67	1156
6243	2	75	1156
6244	1	71	1156
6245	1	66	1156
6246	5	71	1156
6247	5	63	1156
6248	2	67	1156
6249	4	79	1157
6250	1	65	1157
6251	3	73	1157
6252	5	66	1158
6253	1	69	1158
6254	4	61	1159
6255	1	77	1159
6256	3	61	1159
6257	1	76	1159
6258	3	69	1159
6259	2	64	1160
6260	1	64	1160
6261	2	66	1160
6262	5	71	1160
6263	5	66	1160
6264	3	79	1160
6265	5	76	1160
6266	1	78	1160
6267	4	66	1161
6268	3	75	1161
6269	4	75	1161
6270	5	71	1161
6271	3	69	1161
6272	4	68	1161
6273	3	75	1161
6274	4	79	1161
6275	2	72	1162
6276	2	63	1162
6277	5	80	1162
6278	2	66	1162
6279	1	65	1163
6280	3	69	1163
6281	5	67	1164
6282	3	71	1164
6283	2	69	1164
6284	2	68	1164
6285	1	71	1164
6286	1	74	1164
6287	5	62	1164
6288	3	80	1164
6289	1	72	1165
6290	1	67	1165
6291	1	64	1165
6292	3	64	1165
6293	4	78	1165
6294	3	65	1165
6295	5	69	1166
6296	1	71	1167
6297	5	78	1167
6298	4	69	1167
6299	2	74	1167
6300	5	70	1167
6301	4	67	1167
6302	2	68	1167
6303	3	63	1168
6304	4	76	1168
6305	4	70	1168
6306	4	62	1168
6307	1	68	1168
6308	5	73	1168
6309	2	67	1169
6310	1	69	1169
6311	1	79	1169
6312	5	73	1169
6313	1	79	1169
6314	1	71	1169
6315	5	65	1169
6316	4	69	1169
6317	5	70	1169
6318	2	75	1170
6319	3	77	1170
6320	1	79	1170
6321	1	71	1170
6322	4	77	1170
6323	1	62	1170
6324	5	76	1170
6325	4	74	1170
6326	1	69	1171
6327	1	67	1171
6328	5	72	1171
6329	4	69	1171
6330	5	63	1172
6331	1	64	1172
6332	3	70	1172
6333	4	64	1172
6334	4	71	1172
6335	4	70	1173
6336	5	69	1173
6337	3	69	1174
6338	2	65	1174
6339	4	79	1174
6340	1	61	1174
6341	2	76	1175
6342	4	80	1175
6343	4	62	1175
6344	5	65	1175
6345	1	63	1175
6346	5	72	1175
6347	5	72	1175
6348	2	77	1175
6349	1	62	1175
6350	2	69	1175
6351	5	67	1176
6352	5	67	1176
6353	1	63	1176
6354	4	71	1177
6355	1	69	1177
6356	3	79	1177
6357	4	65	1177
6358	3	65	1177
6359	3	75	1177
6360	4	72	1177
6361	5	72	1177
6362	4	66	1177
6363	2	66	1177
6364	1	77	1178
6365	1	70	1178
6366	1	67	1178
6367	4	74	1178
6368	5	79	1178
6369	2	76	1178
6370	2	68	1178
6371	3	76	1178
6372	4	62	1179
6373	3	69	1179
6374	5	69	1180
6375	4	66	1181
6376	2	65	1181
6377	3	77	1181
6378	3	65	1181
6379	4	62	1181
6380	4	78	1181
6381	2	69	1181
6382	3	79	1182
6383	3	69	1182
6384	1	70	1182
6385	2	77	1182
6386	4	66	1182
6387	5	75	1182
6388	4	61	1183
6389	2	65	1183
6390	2	61	1183
6391	1	75	1183
6392	4	75	1183
6393	4	62	1183
6394	2	78	1183
6395	3	71	1184
6396	3	65	1184
6397	5	69	1184
6398	1	68	1184
6399	2	66	1184
6400	4	79	1184
6401	5	64	1184
6402	2	68	1185
6403	1	61	1185
6404	1	70	1185
6405	5	61	1185
6406	4	79	1185
6407	3	72	1185
6408	3	73	1186
6409	5	78	1186
6410	1	61	1186
6411	2	71	1186
6412	2	70	1187
6413	5	71	1187
6414	1	65	1187
6415	2	79	1188
6416	3	65	1188
6417	1	80	1188
6418	5	76	1188
6419	2	76	1188
6420	1	71	1188
6421	4	68	1188
6422	4	75	1188
6423	5	67	1188
6424	5	61	1188
6425	1	73	1189
6426	1	71	1189
6427	4	70	1190
6428	5	72	1190
6429	1	70	1190
6430	1	78	1190
6431	1	64	1190
6432	5	69	1190
6433	1	73	1190
6434	3	61	1190
6435	2	80	1191
6436	3	74	1191
6437	2	80	1191
6438	2	74	1191
6439	3	77	1191
6440	4	78	1191
6441	1	76	1192
6442	3	68	1192
6443	1	69	1192
6444	5	72	1192
6445	1	68	1192
6446	1	64	1192
6447	1	72	1192
6448	4	80	1193
6449	1	62	1193
6450	4	78	1193
6451	3	76	1193
6452	4	63	1193
6453	5	75	1193
6454	5	66	1193
6455	5	67	1193
6456	4	67	1193
6457	4	78	1193
6458	1	66	1194
6459	4	77	1194
6460	1	65	1194
6461	2	62	1195
6462	2	70	1195
6463	4	73	1195
6464	2	66	1195
6465	1	75	1195
6466	1	76	1195
6467	1	70	1195
6468	1	79	1195
6469	1	79	1196
6470	4	66	1197
6471	2	70	1197
6472	5	74	1197
6473	5	76	1197
6474	1	70	1197
6475	5	66	1197
6476	1	69	1197
6477	1	67	1197
6478	4	75	1197
6479	3	70	1198
6480	5	65	1198
6481	1	67	1198
6482	5	61	1198
6483	2	64	1199
6484	1	76	1199
6485	3	74	1199
6486	4	62	1199
6487	5	75	1199
6488	1	77	1199
6489	4	62	1200
6490	3	77	1200
6491	4	65	1200
6492	5	63	1201
6493	3	73	1201
6494	4	76	1201
6495	1	62	1202
6496	5	68	1202
6497	1	69	1203
6498	3	63	1203
6499	4	75	1204
6500	1	78	1204
6501	5	70	1205
6502	5	76	1205
6503	2	67	1206
6504	1	67	1206
6505	5	75	1206
6506	3	73	1206
6507	1	70	1206
6508	5	80	1207
6509	4	63	1207
6510	1	73	1207
6511	5	72	1207
6512	2	73	1208
6513	2	75	1209
6514	2	68	1209
6515	2	70	1210
6516	5	63	1210
6517	1	61	1211
6518	2	69	1211
6519	4	65	1211
6520	3	64	1212
6521	2	73	1213
6522	1	67	1213
6523	4	80	1213
6524	1	76	1213
6525	2	80	1213
6526	3	68	1214
6527	5	62	1214
6528	1	80	1214
6529	2	75	1215
6530	2	79	1215
6531	1	63	1215
6532	2	70	1215
6533	5	62	1215
6534	3	73	1215
6535	1	66	1215
6536	2	61	1215
6537	3	74	1216
6538	3	72	1216
6539	5	65	1217
6540	4	78	1217
6541	5	72	1217
6542	5	73	1217
6543	3	71	1217
6544	5	77	1217
6545	4	63	1217
6546	2	74	1217
6547	5	77	1217
6548	5	67	1218
6549	2	76	1218
6550	4	65	1218
6551	4	61	1218
6552	2	70	1218
6553	4	71	1218
6554	2	77	1218
6555	5	76	1218
6556	4	64	1219
6557	5	74	1219
6558	2	65	1219
6559	4	64	1219
6560	4	72	1219
6561	3	72	1219
6562	2	69	1219
6563	2	68	1219
6564	5	71	1219
6565	3	64	1220
6566	4	78	1220
6567	3	68	1220
6568	2	80	1220
6569	4	79	1220
6570	4	61	1221
6571	1	63	1221
6572	4	61	1221
6573	5	76	1221
6574	4	73	1221
6575	4	79	1221
6576	5	74	1221
6577	2	78	1221
6578	2	64	1221
6579	5	70	1221
6580	4	61	1222
6581	2	62	1222
6582	4	69	1223
6583	5	68	1223
6584	5	79	1224
6585	1	61	1224
6586	3	78	1224
6587	4	70	1224
6588	5	66	1224
6589	3	76	1224
6590	4	73	1224
6591	1	80	1224
6592	2	69	1224
6593	3	64	1225
6594	1	76	1225
6595	3	80	1225
6596	4	79	1226
6597	1	66	1226
6598	5	74	1226
6599	1	73	1226
6600	1	67	1226
6601	2	72	1226
6602	5	70	1226
6603	3	77	1227
6604	4	64	1227
6605	5	80	1227
6606	4	64	1228
6607	1	72	1228
6608	4	72	1228
6609	3	77	1228
6610	3	68	1228
6611	1	67	1228
6612	4	77	1228
6613	3	61	1229
6614	3	74	1229
6615	4	79	1229
6616	5	76	1229
6617	2	75	1229
6618	4	61	1229
6619	2	68	1230
6620	2	79	1230
6621	3	75	1230
6622	5	75	1230
6623	3	67	1230
6624	3	76	1230
6625	2	65	1230
6626	2	66	1230
6627	4	66	1230
6628	4	77	1231
6629	5	75	1231
6630	2	80	1231
6631	5	64	1231
6632	3	75	1231
6633	2	74	1231
6634	5	68	1231
6635	1	71	1232
6636	5	76	1233
6637	5	79	1233
6638	1	70	1233
6639	2	78	1233
6640	2	67	1233
6641	3	73	1233
6642	4	74	1233
6643	3	64	1233
6644	3	69	1233
6645	3	68	1233
6646	5	71	1234
6647	1	67	1234
6648	5	80	1234
6649	2	73	1234
6650	2	75	1234
6651	4	73	1234
6652	2	78	1234
6653	1	68	1234
6654	5	62	1234
6655	5	74	1235
6656	1	73	1235
6657	4	62	1235
6658	1	61	1235
6659	5	71	1235
6660	2	74	1235
6661	5	76	1235
6662	4	62	1235
6663	5	70	1236
6664	2	71	1237
6665	4	71	1237
6666	2	64	1237
6667	1	74	1237
6668	2	64	1237
6669	5	80	1237
6670	3	78	1237
6671	5	67	1238
6672	3	63	1238
6673	3	63	1238
6674	2	62	1238
6675	5	75	1238
6676	3	76	1238
6677	2	70	1238
6678	4	76	1238
6679	5	68	1238
6680	3	64	1238
6681	3	74	1239
6682	2	73	1239
6683	1	77	1240
6684	4	80	1240
6685	4	74	1240
6686	5	79	1240
6687	4	69	1240
6688	5	63	1241
6689	2	65	1241
6690	1	65	1241
6691	4	75	1241
6692	1	80	1241
6693	3	75	1241
6694	5	64	1241
6695	5	70	1241
6696	4	66	1242
6697	4	67	1242
6698	3	80	1242
6699	1	70	1242
6700	3	75	1243
6701	1	70	1243
6702	3	73	1243
6703	1	67	1243
6704	5	80	1243
6705	5	74	1243
6706	4	67	1243
6707	3	79	1243
6708	4	74	1244
6709	3	79	1244
6710	5	69	1244
6711	2	73	1244
6712	2	69	1244
6713	1	73	1244
6714	1	71	1245
6715	3	67	1245
6716	4	69	1245
6717	5	62	1245
6718	3	77	1245
6719	4	74	1245
6720	3	76	1246
6721	5	78	1246
6722	2	61	1246
6723	2	80	1247
6724	1	76	1248
6725	4	76	1248
6726	3	80	1248
6727	5	64	1249
6728	2	70	1249
6729	3	79	1249
6730	1	75	1249
6731	2	79	1249
6732	5	61	1249
6733	4	69	1249
6734	2	69	1249
6735	1	79	1249
6736	4	76	1250
6737	2	63	1251
6738	3	71	1251
6739	1	65	1251
6740	2	76	1251
6741	5	68	1251
6742	2	63	1252
6743	3	73	1252
6744	4	71	1252
6745	5	65	1252
6746	1	79	1252
6747	3	74	1252
6748	4	61	1252
6749	3	71	1252
6750	2	62	1252
6751	4	79	1253
6752	2	63	1253
6753	1	80	1253
6754	2	62	1253
6755	2	77	1253
6756	4	69	1254
6757	3	68	1254
6758	2	67	1254
6759	3	70	1254
6760	2	66	1254
6761	3	72	1254
6762	4	74	1254
6763	5	66	1255
6764	5	74	1256
6765	3	64	1256
6766	1	63	1256
6767	2	78	1256
6768	2	80	1256
6769	1	69	1256
6770	1	78	1256
6771	1	79	1256
6772	3	64	1256
6773	3	65	1257
6774	1	64	1257
6775	1	76	1257
6776	4	74	1257
6777	5	73	1257
6778	1	80	1257
6779	2	76	1257
6780	5	62	1257
6781	4	63	1258
6782	5	71	1258
6783	4	78	1258
6784	2	63	1258
6785	3	78	1258
6786	3	80	1258
6787	1	80	1258
6788	4	68	1258
6789	3	74	1258
6790	3	77	1259
6791	1	71	1259
6792	5	70	1259
6793	1	75	1259
6794	5	73	1259
6795	4	74	1259
6796	2	76	1259
6797	3	77	1259
6798	1	63	1259
6799	3	80	1260
6800	3	62	1261
6801	3	70	1261
6802	2	67	1262
6803	3	78	1262
6804	3	78	1262
6805	1	79	1262
6806	3	62	1262
6807	4	62	1262
6808	3	74	1262
6809	3	62	1262
6810	5	61	1262
6811	4	62	1262
6812	4	74	1263
6813	2	67	1264
6814	2	64	1264
6815	1	79	1264
6816	5	72	1264
6817	5	64	1264
6818	4	62	1264
6819	3	76	1264
6820	2	72	1264
6821	4	74	1264
6822	5	74	1264
6823	3	76	1265
6824	3	69	1265
6825	4	72	1265
6826	4	66	1265
6827	1	70	1265
6828	3	66	1266
6829	1	80	1266
6830	3	67	1266
6831	4	75	1266
6832	3	75	1266
6833	1	72	1266
6834	5	65	1266
6835	2	79	1267
6836	1	73	1267
6837	3	73	1267
6838	5	79	1267
6839	5	76	1267
6840	3	68	1268
6841	5	64	1268
6842	4	75	1268
6843	2	62	1268
6844	1	78	1269
6845	4	75	1270
6846	4	62	1270
6847	4	73	1270
6848	2	61	1271
6849	4	80	1271
6850	5	65	1271
6851	3	68	1271
6852	4	67	1271
6853	2	74	1271
6854	1	63	1271
6855	5	79	1271
6856	2	64	1271
6857	3	73	1272
6858	3	70	1272
6859	3	73	1272
6860	2	78	1272
6861	4	65	1272
6862	4	75	1272
6863	3	77	1272
6864	5	76	1272
6865	2	65	1272
6866	1	72	1272
6867	2	64	1273
6868	5	71	1273
6869	3	75	1274
6870	3	67	1274
6871	1	73	1274
6872	4	70	1274
6873	2	66	1275
6874	2	70	1275
6875	4	77	1275
6876	4	64	1275
6877	3	73	1275
6878	1	69	1275
6879	3	63	1275
6880	1	70	1275
6881	3	80	1275
6882	5	61	1276
6883	2	75	1276
6884	1	75	1276
6885	2	77	1276
6886	4	70	1277
6887	1	66	1277
6888	2	65	1277
6889	4	74	1277
6890	3	65	1277
6891	3	79	1277
6892	4	64	1278
6893	2	79	1278
6894	5	71	1278
6895	5	77	1278
6896	3	71	1278
6897	5	68	1278
6898	1	68	1278
6899	4	61	1278
6900	5	64	1278
6901	5	79	1278
6902	4	73	1279
6903	4	61	1279
6904	3	73	1280
6905	1	68	1280
6906	3	69	1280
6907	1	64	1280
6908	1	80	1280
6909	2	64	1280
6910	4	61	1280
6911	5	74	1280
6912	4	68	1280
6913	5	65	1281
6914	1	68	1281
6915	2	80	1281
6916	5	80	1281
6917	5	77	1281
6918	1	79	1281
6919	3	71	1281
6920	4	71	1281
6921	3	80	1281
6922	2	63	1282
6923	5	72	1282
6924	4	62	1282
6925	4	62	1282
6926	3	70	1282
6927	3	66	1282
6928	1	79	1282
6929	1	61	1282
6930	4	71	1283
6931	2	71	1283
6932	2	61	1283
6933	5	65	1283
6934	1	66	1284
6935	4	64	1285
6936	1	67	1286
6937	3	66	1286
6938	2	71	1286
6939	2	67	1286
6940	1	73	1286
6941	5	75	1286
6942	5	72	1286
6943	5	79	1287
6944	4	65	1287
6945	2	78	1287
6946	2	74	1287
6947	5	80	1288
6948	3	65	1288
6949	5	70	1288
6950	2	71	1288
6951	1	72	1288
6952	3	67	1289
6953	4	73	1289
6954	2	79	1290
6955	3	73	1290
6956	2	64	1290
6957	2	70	1290
6958	1	68	1290
6959	4	78	1290
6960	5	71	1290
6961	2	77	1291
6962	5	77	1291
6963	5	69	1291
6964	1	68	1291
6965	5	70	1291
6966	2	77	1291
6967	3	63	1292
6968	1	78	1292
6969	2	73	1293
6970	4	67	1293
6971	3	77	1293
6972	2	65	1293
6973	5	79	1293
6974	3	80	1293
6975	1	64	1293
6976	5	80	1293
6977	4	66	1294
6978	1	66	1294
6979	4	70	1294
6980	4	62	1294
6981	2	76	1295
6982	2	71	1295
6983	2	77	1295
6984	3	79	1295
6985	4	77	1295
6986	3	64	1295
6987	4	79	1295
6988	5	77	1295
6989	2	66	1296
6990	5	67	1296
6991	1	75	1296
6992	1	74	1296
6993	5	73	1296
6994	1	62	1297
6995	4	79	1297
6996	5	69	1297
6997	4	69	1297
6998	3	61	1297
6999	1	67	1297
7000	1	67	1297
7001	2	63	1297
7002	5	65	1297
7003	2	71	1298
7004	3	72	1298
7005	1	80	1298
7006	5	61	1298
7007	2	71	1299
7008	1	61	1299
7009	2	73	1299
7010	1	75	1299
7011	1	70	1300
7012	2	68	1300
7013	3	69	1300
7014	4	67	1301
7015	2	79	1301
7016	2	65	1301
7017	4	62	1301
7018	4	77	1301
7019	5	70	1301
7020	5	68	1301
7021	1	78	1301
7022	1	80	1301
7023	4	62	1302
7024	3	72	1302
7025	2	79	1302
7026	3	70	1302
7027	4	63	1302
7028	3	79	1302
7029	2	67	1302
7030	1	74	1303
7031	2	68	1303
7032	3	72	1303
7033	1	66	1304
7034	4	67	1304
7035	1	73	1304
7036	1	72	1305
7037	3	70	1305
7038	4	66	1305
7039	4	63	1305
7040	1	77	1305
7041	2	67	1305
7042	2	72	1305
7043	3	72	1305
7044	2	77	1305
7045	1	64	1305
7046	5	75	1306
7047	5	73	1306
7048	5	77	1306
7049	5	77	1306
7050	5	62	1306
7051	5	74	1306
7052	2	61	1306
7053	1	65	1306
7054	4	62	1306
7055	4	67	1307
7056	4	73	1307
7057	2	67	1308
7058	5	66	1308
7059	3	63	1308
7060	3	63	1308
7061	4	66	1308
7062	5	77	1309
7063	3	61	1309
7064	5	71	1309
7065	2	67	1309
7066	4	69	1309
7067	4	78	1309
7068	3	72	1309
7069	1	73	1309
7070	3	61	1309
7071	4	74	1309
7072	2	68	1310
7073	1	64	1311
7074	5	69	1311
7075	3	63	1311
7076	4	62	1311
7077	4	61	1312
7078	5	70	1312
7079	4	78	1312
7080	5	61	1312
7081	4	61	1312
7082	1	64	1312
7083	2	79	1312
7084	2	73	1312
7085	4	63	1312
7086	1	65	1312
7087	1	62	1313
7088	4	78	1313
7089	5	76	1314
7090	3	68	1314
7091	3	79	1314
7092	2	76	1314
7093	3	74	1314
7094	1	69	1314
7095	5	63	1314
7096	2	66	1314
7097	1	68	1314
7098	5	75	1315
7099	1	72	1315
7100	4	72	1315
7101	1	63	1315
7102	2	61	1315
7103	3	78	1315
7104	5	61	1315
7105	1	71	1315
7106	2	70	1315
7107	5	61	1316
7108	4	67	1316
7109	1	80	1316
7110	1	79	1316
7111	4	78	1316
7112	5	73	1316
7113	3	79	1316
7114	3	78	1316
7115	5	76	1316
7116	4	69	1316
7117	5	69	1317
7118	3	67	1318
7119	4	66	1318
7120	5	72	1319
7121	5	73	1319
7122	3	76	1319
7123	3	67	1319
7124	4	69	1320
7125	3	68	1320
7126	1	62	1320
7127	4	64	1320
7128	4	76	1320
7129	3	77	1320
7130	3	72	1320
7131	3	79	1320
7132	3	61	1321
7133	1	66	1321
7134	5	79	1321
7135	4	61	1321
7136	3	65	1321
7137	2	70	1321
7138	3	65	1321
7139	5	72	1321
7140	1	79	1322
7141	1	75	1322
7142	1	61	1323
7143	3	74	1323
7144	3	68	1323
7145	5	75	1323
7146	4	77	1323
7147	5	80	1323
7148	5	64	1323
7149	3	73	1324
7150	3	74	1325
7151	2	72	1325
7152	3	68	1325
7153	3	63	1325
7154	3	75	1325
7155	5	67	1325
7156	2	68	1325
7157	4	64	1326
7158	2	67	1326
7159	4	72	1326
7160	2	69	1326
7161	3	64	1326
7162	5	79	1326
7163	4	80	1326
7164	4	79	1326
7165	1	66	1326
7166	5	75	1326
7167	4	77	1327
7168	2	68	1327
7169	1	64	1327
7170	1	64	1327
7171	1	61	1327
7172	1	76	1327
7173	2	62	1327
7174	2	78	1327
7175	2	74	1328
7176	2	73	1328
7177	2	75	1328
7178	2	72	1328
7179	5	77	1329
7180	4	72	1329
7181	3	64	1329
7182	4	67	1329
7183	2	67	1329
7184	4	70	1329
7185	4	65	1329
7186	1	69	1329
7187	4	78	1329
7188	3	75	1329
7189	4	73	1330
7190	1	70	1330
7191	4	63	1330
7192	5	71	1331
7193	2	65	1331
7194	2	61	1331
7195	1	78	1331
7196	1	63	1331
7197	2	69	1331
7198	5	78	1331
7199	2	71	1332
7200	4	79	1332
7201	2	70	1332
7202	4	72	1332
7203	5	75	1332
7204	5	73	1333
7205	1	75	1333
7206	5	78	1333
7207	5	69	1333
7208	3	76	1333
7209	5	66	1333
7210	5	67	1334
7211	5	64	1334
7212	1	79	1334
7213	2	73	1334
7214	3	65	1335
7215	3	76	1335
7216	1	74	1335
7217	4	74	1336
7218	5	65	1336
7219	5	65	1336
7220	3	71	1337
7221	2	67	1337
7222	1	79	1337
7223	5	63	1337
7224	3	80	1338
7225	3	71	1338
7226	5	80	1338
7227	1	63	1338
7228	5	65	1338
7229	3	75	1338
7230	5	74	1338
7231	2	69	1338
7232	2	67	1338
7233	3	77	1338
7234	3	61	1339
7235	2	70	1339
7236	4	61	1339
7237	3	78	1339
7238	3	65	1339
7239	1	74	1339
7240	3	64	1339
7241	5	71	1340
7242	5	62	1340
7243	1	68	1340
7244	3	78	1340
7245	3	79	1340
7246	3	68	1340
7247	2	68	1340
7248	1	70	1340
7249	5	75	1340
7250	5	68	1340
7251	5	64	1341
7252	3	69	1341
7253	2	75	1341
7254	1	77	1341
7255	2	65	1341
7256	1	71	1341
7257	2	70	1341
7258	2	79	1341
7259	1	68	1342
7260	5	76	1342
7261	2	62	1342
7262	4	65	1342
7263	1	80	1342
7264	5	73	1342
7265	1	70	1343
7266	3	63	1344
7267	3	73	1344
7268	5	77	1344
7269	1	73	1344
7270	4	61	1344
7271	1	65	1344
7272	3	79	1344
7273	1	78	1344
7274	2	61	1344
7275	1	67	1344
7276	1	78	1345
7277	2	78	1345
7278	5	75	1345
7279	2	79	1345
7280	4	80	1345
7281	5	74	1345
7282	5	78	1346
7283	3	67	1346
7284	1	62	1346
7285	3	71	1346
7286	3	61	1346
7287	1	71	1346
7288	3	66	1346
7289	3	68	1346
7290	3	67	1346
7291	5	64	1346
7292	2	61	1347
7293	4	63	1347
7294	2	69	1347
7295	1	79	1347
7296	5	78	1347
7297	1	65	1347
7298	4	75	1347
7299	5	61	1348
7300	1	66	1348
7301	5	76	1348
7302	1	74	1348
7303	2	63	1348
7304	5	75	1348
7305	5	64	1348
7306	5	66	1348
7307	5	69	1348
7308	2	69	1349
7309	1	72	1349
7310	5	64	1349
7311	1	61	1349
7312	3	63	1350
7313	4	71	1350
7314	5	68	1350
7315	4	78	1350
7316	4	74	1350
7317	5	74	1350
7318	3	67	1350
7319	3	73	1351
7320	5	61	1351
7321	2	66	1351
7322	2	64	1351
7323	5	66	1351
7324	5	62	1351
7325	4	61	1351
7326	4	66	1351
7327	1	69	1352
7328	1	69	1352
7329	2	67	1352
7330	2	69	1352
7331	4	76	1352
7332	4	80	1352
7333	5	63	1352
7334	1	72	1352
7335	2	73	1353
7336	5	62	1353
7337	2	61	1354
7338	5	67	1354
7339	3	80	1354
7340	1	72	1354
7341	2	80	1354
7342	4	68	1354
7343	3	67	1354
7344	5	70	1354
7345	3	69	1355
7346	4	64	1355
7347	2	66	1355
7348	4	80	1355
7349	1	67	1355
7350	3	65	1355
7351	1	62	1355
7352	2	74	1355
7353	3	67	1355
7354	4	68	1356
7355	3	61	1356
7356	3	76	1356
7357	5	63	1356
7358	5	62	1356
7359	1	64	1356
7360	2	75	1356
7361	5	65	1356
7362	3	68	1356
7363	3	70	1357
7364	1	71	1357
7365	2	71	1357
7366	4	74	1357
7367	1	66	1357
7368	4	80	1358
7369	4	69	1358
7370	1	67	1358
7371	1	63	1359
7372	5	76	1359
7373	5	78	1359
7374	3	61	1359
7375	3	73	1359
7376	5	74	1359
7377	4	75	1360
7378	2	75	1360
7379	2	71	1360
7380	3	67	1360
7381	4	70	1361
7382	2	77	1361
7383	1	77	1362
7384	5	77	1362
7385	2	66	1362
7386	2	78	1362
7387	4	66	1362
7388	5	73	1362
7389	2	67	1363
7390	4	78	1363
7391	4	67	1364
7392	1	73	1364
7393	4	77	1364
7394	2	75	1364
7395	5	75	1364
7396	4	80	1364
7397	2	65	1364
7398	2	61	1364
7399	2	67	1364
7400	4	76	1365
7401	2	67	1365
7402	5	75	1365
7403	5	79	1365
7404	3	61	1365
7405	4	70	1365
7406	4	66	1365
7407	3	70	1365
7408	3	76	1366
7409	2	73	1366
7410	4	63	1366
7411	2	72	1366
7412	1	63	1366
7413	1	73	1366
7414	3	77	1366
7415	1	70	1366
7416	4	61	1367
7417	5	71	1367
7418	4	72	1368
7419	1	67	1368
7420	2	62	1368
7421	2	77	1368
7422	5	70	1369
7423	5	79	1369
7424	1	61	1369
7425	5	72	1370
7426	5	75	1370
7427	3	72	1370
7428	1	78	1370
7429	3	69	1370
7430	3	73	1370
7431	1	79	1371
7432	4	67	1371
7433	4	62	1371
7434	3	71	1371
7435	1	72	1371
7436	5	76	1371
7437	2	77	1372
7438	5	65	1373
7439	5	74	1373
7440	2	80	1373
7441	5	73	1373
7442	3	78	1373
7443	1	78	1373
7444	2	77	1374
7445	5	74	1374
7446	3	68	1374
7447	2	64	1374
7448	2	69	1374
7449	1	64	1374
7450	1	63	1374
7451	1	70	1374
7452	1	63	1375
7453	3	73	1375
7454	1	67	1375
7455	4	69	1375
7456	1	68	1375
7457	3	70	1375
7458	2	72	1375
7459	2	68	1375
7460	1	64	1375
7461	4	80	1375
7462	2	76	1376
7463	5	72	1376
7464	4	78	1376
7465	2	64	1376
7466	1	75	1377
7467	1	75	1377
7468	2	63	1377
7469	3	77	1377
7470	3	76	1377
7471	2	64	1377
7472	2	68	1377
7473	1	77	1378
7474	1	67	1378
7475	1	62	1378
7476	4	70	1378
7477	3	70	1378
7478	3	78	1378
7479	2	67	1378
7480	2	72	1378
7481	2	78	1378
7482	4	77	1379
7483	5	71	1379
7484	4	70	1379
7485	1	76	1379
7486	1	78	1379
7487	3	64	1379
7488	1	80	1379
7489	2	78	1379
7490	4	73	1379
7491	1	64	1379
7492	3	78	1380
7493	5	67	1381
7494	4	74	1381
7495	5	67	1381
7496	2	68	1381
7497	4	78	1381
7498	4	77	1381
7499	1	69	1381
7500	4	79	1381
7501	4	64	1382
7502	4	69	1382
7503	2	65	1382
7504	4	67	1382
7505	3	70	1382
7506	1	80	1382
7507	5	77	1382
7508	1	68	1382
7509	5	78	1383
7510	4	63	1383
7511	2	76	1383
7512	4	78	1383
7513	1	67	1383
7514	2	70	1383
7515	1	80	1383
7516	5	71	1383
7517	3	75	1384
7518	5	70	1384
7519	4	63	1384
7520	1	64	1384
7521	1	66	1384
7522	4	74	1384
7523	2	61	1385
7524	2	67	1385
7525	5	69	1385
7526	4	78	1385
7527	1	65	1385
7528	3	74	1385
7529	3	67	1386
7530	4	65	1386
7531	4	76	1386
7532	3	61	1386
7533	3	61	1386
7534	1	66	1386
7535	5	79	1386
7536	5	74	1386
7537	4	76	1386
7538	1	71	1387
7539	3	79	1387
7540	5	76	1387
7541	4	63	1387
7542	2	72	1387
7543	3	67	1387
7544	1	70	1388
7545	4	73	1388
7546	3	77	1388
7547	3	73	1388
7548	3	61	1388
7549	1	64	1388
7550	4	64	1388
7551	1	66	1389
7552	4	75	1389
7553	3	75	1389
7554	5	66	1389
7555	3	71	1389
7556	4	69	1389
7557	4	72	1390
7558	1	71	1390
7559	1	67	1390
7560	1	67	1390
7561	2	69	1390
7562	4	71	1390
7563	1	64	1390
7564	3	74	1391
7565	2	80	1391
7566	5	78	1391
7567	4	76	1391
7568	3	74	1391
7569	1	61	1391
7570	2	72	1391
7571	1	62	1392
7572	1	78	1392
7573	3	79	1392
7574	2	72	1392
7575	3	77	1392
7576	5	78	1392
7577	3	77	1392
7578	2	63	1392
7579	2	63	1393
7580	3	61	1393
7581	5	72	1393
7582	2	77	1393
7583	3	71	1393
7584	4	78	1393
7585	3	71	1393
7586	5	74	1393
7587	1	78	1393
7588	4	71	1393
7589	2	67	1394
7590	4	62	1394
7591	1	61	1394
7592	3	78	1394
7593	2	78	1394
7594	2	80	1394
7595	2	70	1394
7596	2	64	1394
7597	1	74	1394
7598	1	76	1394
7599	4	74	1395
7600	1	67	1395
7601	5	66	1395
7602	1	78	1395
7603	4	61	1395
7604	5	75	1396
7605	3	73	1396
7606	1	72	1396
7607	1	75	1396
7608	4	72	1397
7609	2	77	1397
7610	3	70	1397
7611	3	71	1397
7612	3	69	1397
7613	2	80	1397
7614	2	75	1398
7615	2	66	1399
7616	5	78	1399
7617	4	76	1399
7618	4	64	1399
7619	1	79	1399
7620	1	66	1399
7621	3	63	1400
7622	2	66	1400
7623	3	64	1400
7624	3	76	1400
7625	5	64	1400
7626	4	78	1400
7627	4	62	1400
7628	4	77	1400
7629	5	66	1401
7630	4	77	1402
7631	4	69	1402
7632	5	63	1402
7633	4	72	1402
7634	1	64	1403
7635	4	68	1403
7636	1	79	1403
7637	1	72	1404
7638	2	79	1404
7639	5	80	1404
7640	1	76	1404
7641	3	76	1404
7642	3	79	1404
7643	4	67	1404
7644	5	74	1404
7645	2	62	1404
7646	4	61	1405
7647	1	66	1405
7648	2	72	1405
7649	3	73	1405
7650	3	76	1405
7651	5	76	1405
7652	4	77	1406
7653	4	73	1406
7654	2	74	1406
7655	5	64	1406
7656	4	67	1406
7657	3	80	1406
7658	2	72	1407
7659	1	79	1407
7660	1	61	1407
7661	4	66	1408
7662	1	66	1408
7663	1	79	1408
7664	5	79	1408
7665	5	79	1408
7666	5	64	1408
7667	3	63	1408
7668	3	76	1409
7669	2	67	1409
7670	3	79	1410
7671	2	80	1411
7672	1	72	1411
7673	1	65	1411
7674	4	69	1412
7675	2	78	1412
7676	1	62	1412
7677	4	76	1413
7678	5	68	1413
7679	4	75	1413
7680	4	76	1413
7681	3	62	1413
7682	3	77	1413
7683	4	63	1413
7684	2	62	1413
7685	2	78	1413
7686	1	68	1414
7687	2	64	1414
7688	3	72	1414
7689	5	73	1414
7690	2	65	1414
7691	5	68	1414
7692	5	77	1414
7693	5	77	1414
7694	2	80	1414
7695	1	77	1414
7696	3	63	1415
7697	3	64	1415
7698	3	74	1415
7699	2	65	1416
7700	4	61	1416
7701	2	70	1416
7702	3	68	1416
7703	3	77	1416
7704	3	78	1416
7705	4	61	1416
7706	4	70	1416
7707	1	61	1416
7708	4	77	1417
7709	3	62	1417
7710	1	80	1417
7711	3	73	1417
7712	4	66	1418
7713	4	73	1418
7714	2	63	1418
7715	3	63	1418
7716	1	79	1418
7717	3	74	1418
7718	1	80	1418
7719	4	67	1418
7720	3	78	1418
7721	2	76	1418
7722	3	71	1419
7723	4	64	1419
7724	1	78	1419
7725	3	65	1419
7726	5	76	1419
7727	5	63	1419
7728	2	76	1419
7729	5	64	1419
7730	4	70	1419
7731	5	67	1419
7732	4	73	1420
7733	1	62	1420
7734	3	71	1420
7735	2	71	1420
7736	5	80	1420
7737	5	71	1420
7738	5	64	1420
7739	3	66	1420
7740	4	75	1420
7741	3	65	1420
7742	1	63	1421
7743	3	63	1421
7744	3	70	1422
7745	4	75	1422
7746	5	69	1422
7747	5	80	1423
7748	5	75	1423
7749	5	74	1423
7750	4	70	1423
7751	2	71	1423
7752	5	68	1423
7753	3	77	1423
7754	4	80	1424
7755	3	69	1424
7756	1	64	1424
7757	3	79	1424
7758	2	70	1424
7759	4	78	1424
7760	1	61	1424
7761	2	67	1424
7762	4	72	1424
7763	4	62	1425
7764	4	76	1425
7765	3	64	1425
7766	2	73	1425
7767	1	69	1425
7768	2	80	1426
7769	3	66	1426
7770	3	77	1426
7771	3	75	1427
7772	2	77	1427
7773	4	80	1427
7774	3	70	1427
7775	5	64	1427
7776	5	67	1427
7777	3	67	1427
7778	1	72	1427
7779	4	72	1428
7780	4	72	1428
7781	3	61	1428
7782	1	70	1428
7783	3	78	1428
7784	2	65	1428
7785	4	77	1429
7786	2	73	1429
7787	2	68	1429
7788	3	64	1429
7789	2	63	1429
7790	1	66	1429
7791	4	67	1429
7792	1	67	1429
7793	1	63	1429
7794	3	66	1430
7795	2	74	1431
7796	5	77	1431
7797	4	78	1432
7798	1	64	1432
7799	2	64	1432
7800	1	76	1433
7801	5	64	1434
7802	1	63	1434
7803	3	74	1434
7804	1	72	1434
7805	3	66	1434
7806	3	70	1434
7807	2	73	1434
7808	1	78	1434
7809	5	79	1435
7810	3	75	1435
7811	5	64	1435
7812	3	70	1435
7813	3	67	1435
7814	4	73	1435
7815	5	69	1436
7816	5	67	1436
7817	3	76	1437
7818	1	75	1437
7819	2	74	1437
7820	1	70	1437
7821	2	79	1437
7822	5	76	1437
7823	3	70	1437
7824	5	78	1437
7825	2	78	1438
7826	5	79	1438
7827	4	66	1438
7828	2	75	1438
7829	1	75	1438
7830	1	69	1439
7831	5	79	1439
7832	4	71	1439
7833	1	79	1439
7834	3	75	1439
7835	1	63	1440
7836	1	68	1440
7837	4	68	1440
7838	4	67	1440
7839	3	65	1441
7840	1	79	1442
7841	3	69	1442
7842	1	72	1442
7843	3	66	1442
7844	2	69	1442
7845	4	73	1442
7846	5	61	1442
7847	4	70	1443
7848	1	64	1443
7849	2	79	1443
7850	1	73	1444
7851	3	62	1444
7852	5	76	1444
7853	2	71	1444
7854	1	64	1444
7855	3	72	1444
7856	3	70	1444
7857	4	80	1444
7858	5	76	1444
7859	4	78	1444
7860	1	80	1445
7861	4	70	1445
7862	3	75	1446
7863	5	70	1446
7864	2	76	1446
7865	3	72	1446
7866	5	66	1446
7867	5	71	1446
7868	1	77	1446
7869	2	68	1446
7870	3	71	1447
7871	3	63	1447
7872	4	74	1447
7873	1	79	1447
7874	5	76	1448
7875	4	68	1448
7876	1	79	1448
7877	3	80	1449
7878	1	77	1449
7879	4	70	1449
7880	4	61	1449
7881	5	71	1449
7882	2	69	1449
7883	4	79	1449
7884	5	76	1449
7885	3	67	1449
7886	1	66	1449
7887	1	73	1450
7888	1	70	1450
7889	4	67	1451
7890	2	68	1452
7891	2	63	1452
7892	4	63	1452
7893	3	74	1452
7894	1	73	1452
7895	2	70	1452
7896	4	75	1452
7897	3	71	1452
7898	1	79	1452
7899	4	72	1453
7900	4	61	1453
7901	4	75	1453
7902	4	64	1453
7903	5	67	1453
7904	2	65	1453
7905	1	61	1453
7906	2	64	1453
7907	2	72	1454
7908	5	66	1454
7909	2	77	1454
7910	2	80	1454
7911	2	73	1454
7912	1	78	1454
7913	3	64	1454
7914	5	69	1454
7915	3	67	1454
7916	5	77	1454
7917	2	65	1455
7918	1	76	1455
7919	5	64	1456
7920	1	63	1457
7921	2	77	1457
7922	4	77	1457
7923	4	72	1457
7924	3	70	1457
7925	1	79	1457
7926	5	73	1457
7927	5	62	1457
7928	4	72	1458
7929	3	71	1458
7930	2	77	1458
7931	5	80	1458
7932	5	67	1459
7933	1	77	1459
7934	3	76	1460
7935	3	71	1460
7936	2	77	1460
7937	2	79	1460
7938	2	64	1460
7939	2	71	1460
7940	3	78	1461
7941	4	78	1461
7942	5	75	1462
7943	1	78	1463
7944	2	65	1463
7945	5	76	1463
7946	5	65	1463
7947	4	80	1463
7948	3	71	1463
7949	5	74	1463
7950	2	66	1463
7951	1	76	1463
7952	2	61	1463
7953	4	73	1464
7954	3	69	1464
7955	5	77	1464
7956	1	72	1464
7957	4	79	1464
7958	3	68	1464
7959	4	66	1464
7960	1	73	1464
7961	1	72	1465
7962	4	79	1465
7963	5	78	1466
7964	2	75	1466
7965	1	71	1466
7966	3	75	1467
7967	3	72	1467
7968	3	61	1468
7969	2	68	1469
7970	5	79	1469
7971	3	77	1469
7972	5	76	1469
7973	3	66	1469
7974	2	72	1469
7975	2	80	1469
7976	2	75	1469
7977	2	70	1470
7978	3	79	1470
7979	2	66	1470
7980	4	65	1470
7981	5	69	1470
7982	4	66	1470
7983	3	70	1471
7984	1	78	1471
7985	2	69	1471
7986	1	71	1471
7987	1	77	1472
7988	5	72	1472
7989	2	78	1472
7990	3	70	1472
7991	3	74	1472
7992	4	67	1472
7993	1	80	1472
7994	5	78	1472
7995	1	71	1473
7996	3	74	1473
7997	2	65	1473
7998	3	67	1473
7999	5	63	1473
8000	5	63	1473
8001	1	62	1473
8002	2	63	1473
8003	4	62	1474
8004	3	79	1474
8005	1	75	1474
8006	1	63	1474
8007	1	73	1474
8008	3	66	1474
8009	2	63	1474
8010	2	74	1474
8011	5	77	1475
8012	1	73	1475
8013	2	64	1475
8014	3	61	1475
8015	1	67	1475
8016	4	75	1475
8017	3	66	1475
8018	5	73	1475
8019	5	67	1475
8020	1	64	1476
8021	3	64	1476
8022	2	66	1476
8023	2	64	1476
8024	5	64	1477
8025	4	68	1477
8026	5	67	1477
8027	2	71	1477
8028	5	61	1477
8029	5	65	1477
8030	5	76	1477
8031	3	77	1478
8032	1	71	1478
8033	4	66	1478
8034	1	65	1478
8035	1	61	1478
8036	1	77	1478
8037	4	74	1478
8038	2	68	1479
8039	1	67	1479
8040	1	78	1479
8041	2	70	1479
8042	2	73	1480
8043	1	68	1480
8044	2	67	1480
8045	5	68	1480
8046	2	80	1480
8047	5	74	1480
8048	1	76	1480
8049	3	79	1480
8050	3	72	1481
8051	2	73	1481
8052	2	68	1482
8053	3	63	1482
8054	3	66	1482
8055	5	74	1482
8056	2	69	1482
8057	4	61	1482
8058	3	77	1482
8059	3	74	1482
8060	5	80	1482
8061	3	70	1482
8062	2	66	1483
8063	4	66	1484
8064	3	75	1484
8065	4	72	1484
8066	1	62	1484
8067	1	66	1484
8068	1	67	1484
8069	5	72	1484
8070	2	80	1484
8071	5	73	1484
8072	4	70	1484
8073	5	73	1485
8074	3	80	1485
8075	4	65	1485
8076	2	71	1485
8077	2	71	1486
8078	4	78	1486
8079	3	69	1487
8080	3	66	1487
8081	2	77	1487
8082	2	66	1487
8083	2	70	1488
8084	5	63	1488
8085	1	62	1488
8086	5	69	1489
8087	3	75	1489
8088	4	77	1489
8089	2	70	1489
8090	4	68	1489
8091	1	61	1490
8092	3	76	1490
8093	4	73	1490
8094	5	80	1490
8095	2	63	1490
8096	5	71	1490
8097	1	61	1491
8098	4	79	1491
8099	2	64	1491
8100	3	73	1492
8101	2	72	1492
8102	1	71	1492
8103	5	73	1493
8104	3	66	1494
8105	4	65	1494
8106	3	77	1494
8107	4	63	1494
8108	2	71	1494
8109	5	63	1495
8110	5	71	1495
8111	5	70	1495
8112	1	64	1495
8113	4	79	1495
8114	5	73	1495
8115	5	73	1495
8116	4	75	1496
8117	2	67	1496
8118	4	70	1496
8119	1	70	1496
8120	2	79	1496
8121	3	71	1496
8122	5	71	1496
8123	5	72	1496
8124	5	66	1497
8125	5	76	1497
8126	4	69	1497
8127	1	63	1497
8128	3	74	1497
8129	1	75	1497
8130	4	72	1497
8131	4	70	1497
8132	1	71	1497
8133	3	78	1498
8134	5	80	1498
8135	5	67	1499
8136	4	70	1499
8137	5	73	1499
8138	4	80	1499
8139	3	65	1499
8140	1	62	1499
8141	3	72	1499
8142	4	75	1499
8143	3	62	1499
8144	1	73	1499
8145	5	62	1500
8146	4	73	1500
8147	5	69	1500
8148	4	62	1500
8149	5	61	1500
8150	2	74	1500
8151	3	75	1500
8152	3	74	1500
8153	1	71	1500
8154	4	65	1500
8155	5	69	1501
8156	1	62	1501
8157	2	71	1502
8158	1	72	1502
8159	3	78	1502
8160	4	76	1502
8161	4	69	1502
8162	1	71	1502
8163	4	62	1502
8164	3	77	1503
8165	2	76	1503
8166	1	75	1504
8167	2	77	1504
8168	5	79	1505
8169	4	65	1505
8170	4	73	1505
8171	1	67	1505
8172	2	78	1505
8173	1	71	1505
8174	4	73	1506
8175	5	65	1506
8176	1	62	1506
8177	1	78	1506
8178	1	66	1506
8179	1	79	1506
8180	2	63	1506
8181	5	69	1506
8182	2	61	1507
8183	5	79	1507
8184	3	80	1507
8185	3	70	1507
8186	5	61	1507
8187	4	74	1507
8188	5	64	1508
8189	4	72	1508
8190	4	74	1509
8191	4	75	1509
8192	1	65	1509
8193	2	69	1509
8194	4	70	1509
8195	3	61	1509
8196	1	67	1509
8197	1	70	1510
8198	5	63	1510
8199	2	70	1510
8200	1	73	1510
8201	3	63	1510
8202	3	72	1510
8203	2	77	1510
8204	5	73	1510
8205	2	75	1510
8206	1	76	1510
8207	4	73	1511
8208	4	71	1511
8209	5	67	1511
8210	5	62	1511
8211	3	64	1512
8212	2	77	1512
8213	4	68	1512
8214	4	68	1513
8215	5	61	1513
8216	4	66	1513
8217	5	71	1514
8218	3	62	1514
8219	3	65	1514
8220	4	69	1514
8221	1	64	1514
8222	1	64	1514
8223	1	70	1514
8224	1	69	1514
8225	1	72	1515
8226	5	77	1515
8227	1	73	1515
8228	4	76	1515
8229	4	66	1515
8230	5	65	1515
8231	4	77	1515
8232	3	72	1515
8233	2	64	1516
8234	4	78	1516
8235	4	63	1517
8236	2	65	1517
8237	4	67	1517
8238	1	68	1517
8239	4	76	1517
8240	4	61	1517
8241	4	73	1517
8242	4	67	1517
8243	1	69	1517
8244	5	69	1518
8245	4	71	1518
8246	4	73	1518
8247	1	67	1518
8248	3	80	1518
8249	3	66	1518
8250	3	67	1518
8251	1	73	1519
8252	1	70	1519
8253	1	76	1519
8254	5	68	1519
8255	1	62	1519
8256	1	68	1519
8257	1	68	1520
8258	3	70	1520
8259	2	63	1520
8260	5	77	1520
8261	1	76	1520
8262	2	63	1520
8263	1	64	1520
8264	5	61	1520
8265	4	65	1521
8266	2	77	1521
8267	2	64	1521
8268	5	63	1521
8269	5	75	1521
8270	2	75	1521
8271	4	64	1521
8272	5	63	1521
8273	2	73	1521
8274	2	74	1521
8275	2	68	1522
8276	1	70	1522
8277	1	64	1522
8278	2	62	1522
8279	3	67	1522
8280	1	65	1522
8281	4	70	1522
8282	1	71	1522
8283	3	64	1523
8284	3	72	1523
8285	4	76	1523
8286	4	61	1523
8287	2	79	1523
8288	1	62	1523
8289	4	65	1523
8290	5	73	1523
8291	3	67	1524
8292	2	67	1524
8293	5	67	1524
8294	1	63	1524
8295	5	69	1524
8296	2	77	1524
8297	2	63	1525
8298	1	79	1525
8299	5	79	1526
8300	2	75	1526
8301	3	66	1526
8302	5	71	1526
8303	2	78	1527
8304	4	75	1527
8305	3	62	1527
8306	3	78	1527
8307	1	64	1527
8308	2	61	1527
8309	2	65	1527
8310	1	74	1527
8311	1	70	1528
8312	5	66	1528
8313	1	68	1528
8314	5	78	1528
8315	2	80	1528
8316	2	64	1528
8317	2	70	1528
8318	5	67	1528
8319	5	68	1528
8320	5	72	1528
8321	3	77	1529
8322	5	69	1529
8323	5	66	1529
8324	4	70	1529
8325	4	70	1529
8326	2	74	1529
8327	3	63	1529
8328	5	70	1529
8329	1	72	1529
8330	5	65	1530
8331	3	65	1530
8332	1	80	1530
8333	1	77	1530
8334	5	61	1530
8335	2	75	1530
8336	5	72	1530
8337	2	63	1530
8338	5	79	1530
8339	2	66	1530
8340	5	70	1531
8341	1	80	1532
8342	5	74	1532
8343	1	68	1532
8344	4	66	1532
8345	3	69	1533
8346	5	80	1533
8347	1	62	1533
8348	4	78	1533
8349	2	65	1534
8350	3	62	1534
8351	4	80	1534
8352	2	68	1534
8353	5	75	1534
8354	3	62	1534
8355	1	63	1534
8356	3	69	1535
8357	2	64	1535
8358	4	69	1535
8359	2	69	1535
8360	5	77	1535
8361	5	69	1535
8362	4	70	1535
8363	3	79	1536
8364	2	74	1536
8365	4	70	1536
8366	5	62	1536
8367	4	80	1536
8368	2	70	1536
8369	1	71	1536
8370	3	64	1536
8371	1	67	1537
8372	3	66	1537
8373	2	65	1537
8374	1	80	1537
8375	5	77	1538
8376	1	74	1538
8377	5	74	1538
8378	1	63	1539
8379	4	77	1539
8380	2	66	1539
8381	1	75	1539
8382	1	75	1539
8383	2	63	1539
8384	2	69	1539
8385	5	70	1539
8386	5	61	1539
8387	5	68	1540
8388	3	62	1540
8389	3	79	1540
8390	3	76	1540
8391	5	77	1540
8392	1	68	1540
8393	4	76	1541
8394	5	62	1541
8395	3	64	1541
8396	2	80	1541
8397	4	72	1541
8398	1	64	1541
8399	5	78	1541
8400	1	79	1541
8401	3	63	1542
8402	4	62	1543
8403	3	64	1543
8404	5	63	1543
8405	1	78	1543
8406	2	66	1543
8407	1	67	1543
8408	3	73	1543
8409	4	66	1543
8410	1	64	1543
8411	5	74	1543
8412	4	63	1544
8413	3	78	1544
8414	2	64	1544
8415	5	79	1544
8416	4	64	1544
8417	1	79	1544
8418	2	66	1545
8419	3	64	1545
8420	2	80	1545
8421	3	80	1545
8422	4	74	1545
8423	2	71	1545
8424	4	69	1546
8425	4	62	1547
8426	3	64	1547
8427	5	69	1547
8428	1	70	1547
8429	5	61	1548
8430	2	64	1549
8431	2	61	1549
8432	4	74	1549
8433	3	80	1549
8434	3	63	1549
8435	3	77	1549
8436	3	72	1549
8437	2	79	1549
8438	3	61	1550
8439	5	78	1550
8440	3	66	1550
8441	5	65	1550
8442	2	65	1550
8443	1	71	1550
8444	4	72	1550
8445	4	77	1550
8446	5	73	1551
8447	4	72	1551
8448	3	73	1551
8449	4	75	1551
8450	1	61	1551
8451	2	76	1551
8452	3	72	1551
8453	4	69	1551
8454	1	73	1551
8455	3	78	1551
8456	4	63	1552
8457	3	68	1553
8458	3	80	1553
8459	1	73	1553
8460	5	79	1553
8461	3	76	1553
8462	4	63	1553
8463	2	62	1553
8464	4	64	1553
8465	4	70	1553
8466	2	78	1554
8467	1	65	1554
8468	4	74	1555
8469	5	63	1555
8470	3	63	1555
8471	4	77	1555
8472	4	80	1555
8473	1	66	1555
8474	3	74	1555
8475	5	63	1555
8476	5	68	1556
8477	4	75	1556
8478	3	65	1556
8479	1	79	1556
8480	3	80	1556
8481	5	80	1557
8482	2	65	1557
8483	2	73	1557
8484	4	68	1558
8485	2	65	1558
8486	1	75	1558
8487	3	75	1558
8488	3	64	1558
8489	2	71	1559
8490	5	75	1559
8491	5	78	1559
8492	4	68	1560
8493	2	71	1560
8494	3	78	1560
8495	1	69	1560
8496	2	80	1560
8497	4	63	1560
8498	4	64	1560
8499	3	78	1560
8500	4	67	1560
8501	5	70	1561
8502	3	76	1561
8503	1	72	1561
8504	1	68	1561
8505	2	61	1561
8506	1	64	1561
8507	1	73	1562
8508	3	61	1562
8509	1	76	1562
8510	4	68	1562
8511	4	76	1562
8512	4	64	1562
8513	3	69	1563
8514	2	71	1563
8515	2	70	1563
8516	2	68	1563
8517	2	72	1563
8518	5	68	1563
8519	4	74	1563
8520	3	70	1563
8521	5	74	1563
8522	5	71	1564
8523	1	61	1564
8524	5	70	1564
8525	5	64	1564
8526	5	69	1565
8527	2	75	1565
8528	3	72	1565
8529	3	67	1565
8530	2	65	1565
8531	3	68	1566
8532	1	69	1567
8533	4	66	1567
8534	3	62	1567
8535	1	78	1567
8536	5	79	1567
8537	3	76	1567
8538	3	71	1567
8539	1	80	1567
8540	5	76	1568
8541	2	62	1568
8542	5	76	1568
8543	1	63	1569
8544	5	74	1569
8545	3	68	1569
8546	4	72	1569
8547	1	64	1569
8548	3	78	1569
8549	1	76	1569
8550	1	62	1569
8551	1	80	1570
8552	2	64	1570
8553	4	71	1570
8554	1	75	1571
8555	2	70	1571
8556	5	70	1571
8557	5	66	1571
8558	1	66	1571
8559	4	75	1571
8560	4	80	1571
8561	1	73	1571
8562	4	70	1572
8563	3	65	1572
8564	5	68	1572
8565	3	78	1572
8566	1	74	1572
8567	3	64	1572
8568	1	65	1573
8569	2	63	1574
8570	4	72	1574
8571	1	70	1575
8572	3	63	1575
8573	3	61	1575
8574	3	67	1575
8575	3	61	1576
8576	4	62	1576
8577	3	62	1576
8578	1	71	1576
8579	4	70	1576
8580	3	63	1576
8581	5	70	1577
8582	3	73	1577
8583	4	65	1577
8584	4	65	1577
8585	4	80	1577
8586	3	65	1577
8587	2	80	1577
8588	1	64	1577
8589	5	72	1577
8590	3	69	1577
8591	5	80	1578
8592	4	74	1578
8593	5	74	1578
8594	2	78	1578
8595	1	76	1578
8596	3	70	1578
8597	5	62	1578
8598	4	74	1579
8599	4	70	1579
8600	1	70	1579
8601	4	78	1579
8602	5	62	1579
8603	2	68	1579
8604	3	61	1580
8605	3	64	1580
8606	1	68	1580
8607	3	69	1580
8608	4	73	1580
8609	1	71	1580
8610	4	77	1580
8611	1	72	1580
8612	5	74	1580
8613	1	70	1580
8614	3	65	1581
8615	4	70	1582
8616	1	72	1582
8617	4	65	1582
8618	4	66	1582
8619	4	63	1582
8620	3	64	1582
8621	3	62	1582
8622	2	76	1582
8623	3	76	1582
8624	1	76	1582
8625	3	80	1583
8626	4	76	1583
8627	2	77	1583
8628	4	70	1583
8629	2	78	1583
8630	4	71	1584
8631	1	74	1584
8632	3	63	1584
8633	3	70	1584
8634	3	75	1584
8635	1	70	1584
8636	5	75	1584
8637	3	70	1584
8638	1	65	1584
8639	1	64	1585
8640	3	74	1585
8641	1	66	1586
8642	4	61	1586
8643	2	72	1586
8644	5	65	1586
8645	4	72	1586
8646	2	66	1586
8647	1	61	1586
8648	4	61	1586
8649	4	64	1586
8650	5	61	1586
8651	2	76	1587
8652	4	63	1587
8653	5	70	1587
8654	1	73	1587
8655	5	67	1587
8656	3	62	1587
8657	3	73	1587
8658	5	77	1588
8659	2	70	1589
8660	1	67	1589
8661	3	78	1589
8662	1	77	1589
8663	4	71	1589
8664	3	79	1589
8665	3	78	1589
8666	2	74	1589
8667	2	76	1589
8668	5	78	1589
8669	3	79	1590
8670	1	73	1590
8671	3	65	1590
8672	4	68	1590
8673	2	79	1591
8674	2	63	1591
8675	4	67	1591
8676	4	80	1591
8677	3	73	1592
8678	4	63	1592
8679	5	61	1592
8680	4	78	1592
8681	3	65	1592
8682	4	80	1592
8683	2	62	1592
8684	3	78	1592
8685	2	79	1592
8686	3	72	1593
8687	1	70	1593
8688	3	78	1593
8689	2	71	1593
8690	2	69	1593
8691	5	73	1593
8692	4	63	1593
8693	5	69	1593
8694	4	61	1593
8695	1	66	1593
8696	2	66	1594
8697	2	65	1594
8698	5	71	1594
8699	4	74	1594
8700	2	62	1594
8701	1	72	1594
8702	2	67	1594
8703	3	66	1595
8704	5	77	1595
8705	4	71	1595
8706	2	64	1596
8707	2	63	1597
8708	2	76	1597
8709	4	62	1597
8710	4	64	1597
8711	3	70	1597
8712	3	74	1597
8713	4	69	1597
8714	1	61	1598
8715	4	74	1598
8716	1	62	1598
8717	2	76	1598
8718	4	71	1598
8719	3	63	1598
8720	3	74	1598
8721	1	65	1599
8722	5	68	1599
8723	4	79	1600
8724	3	69	1600
8725	1	80	1600
8726	3	70	1600
8727	4	77	1600
8728	1	69	1600
8729	5	65	1600
8730	3	68	1600
8731	4	71	1600
8732	1	80	1600
8733	2	71	1601
8734	5	65	1601
8735	3	68	1601
8736	5	70	1601
8737	4	63	1601
8738	3	75	1601
8739	3	61	1602
8740	2	80	1602
8741	1	61	1602
8742	5	69	1602
8743	4	61	1602
8744	3	64	1602
8745	2	77	1602
8746	5	73	1602
8747	5	72	1603
8748	5	75	1603
8749	1	71	1603
8750	1	76	1603
8751	2	64	1603
8752	1	61	1603
8753	2	77	1604
8754	3	68	1604
8755	4	64	1604
8756	2	78	1604
8757	2	61	1604
8758	3	80	1604
8759	5	79	1604
8760	5	76	1604
8761	3	70	1604
8762	3	71	1605
8763	5	80	1605
8764	1	76	1605
8765	2	67	1605
8766	5	66	1605
8767	1	79	1605
8768	2	72	1605
8769	4	71	1605
8770	4	76	1605
8771	5	63	1605
8772	1	61	1606
8773	2	62	1606
8774	4	76	1606
8775	4	69	1606
8776	3	77	1606
8777	4	76	1606
8778	5	61	1606
8779	2	73	1606
8780	2	77	1607
8781	3	79	1607
8782	1	61	1607
8783	4	69	1607
8784	3	63	1607
8785	5	78	1607
8786	2	77	1607
8787	2	71	1607
8788	1	66	1608
8789	5	61	1608
8790	3	68	1608
8791	1	73	1608
8792	2	80	1608
8793	2	75	1608
8794	4	77	1609
8795	5	72	1609
8796	3	62	1609
8797	1	63	1609
8798	1	71	1609
8799	1	71	1609
8800	3	69	1609
8801	5	61	1610
8802	2	62	1610
8803	5	71	1610
8804	3	66	1610
8805	5	72	1611
8806	4	66	1611
8807	2	75	1611
8808	3	80	1611
8809	4	77	1611
8810	3	63	1611
8811	4	69	1611
8812	4	78	1611
8813	3	64	1612
8814	4	70	1612
8815	2	72	1612
8816	5	80	1612
8817	2	80	1613
8818	2	70	1613
8819	4	78	1613
8820	4	74	1613
8821	5	76	1613
8822	5	75	1613
8823	2	79	1614
8824	2	67	1615
8825	4	77	1615
8826	1	67	1615
8827	4	75	1615
8828	2	63	1615
8829	1	70	1615
8830	2	72	1615
8831	2	70	1616
8832	2	73	1616
8833	1	63	1617
8834	2	76	1617
8835	4	78	1617
8836	1	62	1618
8837	2	70	1619
8838	2	75	1620
8839	4	63	1620
8840	1	73	1620
8841	3	68	1620
8842	3	69	1620
8843	2	61	1620
8844	3	79	1620
8845	5	66	1620
8846	1	71	1620
8847	4	71	1621
8848	1	66	1621
8849	5	77	1622
8850	2	70	1622
8851	1	78	1622
8852	5	73	1622
8853	4	71	1622
8854	3	74	1622
8855	5	68	1622
8856	3	69	1623
8857	5	73	1623
8858	4	80	1623
8859	5	72	1624
8860	5	66	1624
8861	2	72	1624
8862	1	72	1624
8863	1	72	1625
8864	3	61	1626
8865	4	62	1626
8866	5	73	1626
8867	2	63	1626
8868	1	69	1626
8869	4	74	1627
8870	1	79	1627
8871	3	80	1627
8872	4	74	1627
8873	4	78	1627
8874	1	75	1627
8875	4	72	1627
8876	5	80	1627
8877	2	68	1627
8878	3	70	1627
8879	4	76	1628
8880	4	75	1628
8881	1	74	1628
8882	5	76	1628
8883	4	78	1628
8884	5	77	1628
8885	2	67	1628
8886	4	73	1628
8887	2	76	1628
8888	4	71	1628
8889	2	67	1629
8890	5	78	1630
8891	4	74	1630
8892	1	75	1630
8893	5	77	1630
8894	1	75	1630
8895	5	68	1630
8896	2	63	1631
8897	3	78	1631
8898	2	69	1631
8899	3	63	1631
8900	4	77	1631
8901	3	70	1631
8902	4	76	1631
8903	5	61	1632
8904	5	80	1632
8905	4	73	1632
8906	4	63	1632
8907	3	74	1632
8908	3	68	1632
8909	4	75	1632
8910	5	75	1632
8911	4	78	1632
8912	5	74	1633
8913	4	73	1634
8914	5	63	1634
8915	4	71	1634
8916	4	79	1635
8917	5	80	1635
8918	4	77	1635
8919	1	64	1635
8920	2	78	1635
8921	1	73	1635
8922	2	64	1636
8923	2	63	1637
8924	3	67	1638
8925	2	67	1638
8926	2	67	1638
8927	4	63	1639
8928	4	78	1639
8929	2	63	1639
8930	2	77	1639
8931	2	74	1639
8932	1	62	1639
8933	1	68	1639
8934	2	69	1640
8935	4	65	1640
8936	4	63	1640
8937	5	74	1640
8938	2	64	1640
8939	4	71	1640
8940	2	79	1640
8941	3	73	1640
8942	2	71	1641
8943	1	61	1641
8944	5	66	1641
8945	5	78	1642
8946	5	72	1642
8947	1	80	1642
8948	1	69	1642
8949	3	65	1642
8950	4	72	1642
8951	4	78	1642
8952	2	65	1642
8953	5	78	1642
8954	4	62	1643
8955	5	67	1643
8956	5	63	1643
8957	4	78	1643
8958	3	80	1644
8959	5	64	1644
8960	4	73	1644
8961	2	76	1645
8962	4	66	1645
8963	1	72	1645
8964	4	76	1645
8965	3	67	1645
8966	4	72	1645
8967	5	76	1646
8968	1	71	1646
8969	4	74	1646
8970	1	77	1646
8971	4	75	1646
8972	2	63	1646
8973	2	69	1646
8974	5	70	1646
8975	4	71	1646
8976	1	62	1647
8977	3	79	1647
8978	4	77	1647
8979	4	77	1647
8980	4	74	1647
8981	4	62	1647
8982	1	70	1647
8983	2	62	1648
8984	3	79	1648
8985	5	78	1648
8986	5	71	1648
8987	1	70	1649
8988	5	70	1649
8989	3	70	1649
8990	5	71	1649
8991	5	73	1649
8992	3	64	1650
8993	4	80	1650
8994	4	72	1650
8995	1	69	1650
8996	4	72	1651
8997	4	74	1651
8998	5	78	1651
8999	5	66	1651
9000	1	68	1651
9001	3	71	1652
9002	2	63	1652
9003	1	61	1652
9004	2	62	1653
9005	5	76	1653
9006	1	78	1653
9007	1	63	1653
9008	1	63	1653
9009	2	61	1653
9010	1	80	1654
9011	3	75	1654
9012	5	61	1654
9013	1	79	1654
9014	2	79	1654
9015	2	62	1655
9016	4	80	1655
9017	1	72	1655
9018	4	80	1655
9019	5	79	1655
9020	4	76	1655
9021	2	77	1655
9022	5	63	1655
9023	5	80	1655
9024	5	63	1656
9025	4	69	1656
9026	5	80	1656
9027	5	75	1656
9028	1	76	1656
9029	5	72	1657
9030	3	69	1657
9031	2	65	1657
9032	5	72	1657
9033	4	61	1657
9034	3	80	1657
9035	2	77	1657
9036	5	73	1657
9037	5	74	1658
9038	3	75	1658
9039	5	78	1658
9040	1	61	1658
9041	4	65	1658
9042	2	69	1658
9043	3	62	1658
9044	1	80	1658
9045	3	63	1658
9046	2	63	1658
9047	3	73	1659
9048	1	78	1660
9049	1	68	1660
9050	2	68	1660
9051	4	65	1660
9052	2	80	1660
9053	4	65	1660
9054	1	65	1661
9055	5	66	1661
9056	4	78	1661
9057	1	79	1661
9058	1	75	1661
9059	2	76	1661
9060	4	74	1661
9061	4	72	1661
9062	4	69	1661
9063	4	77	1661
9064	2	61	1662
9065	2	71	1662
9066	1	77	1662
9067	1	68	1662
9068	4	74	1662
9069	2	72	1662
9070	1	63	1663
9071	1	66	1663
9072	2	67	1663
9073	5	63	1663
9074	2	77	1663
9075	3	74	1663
9076	4	75	1663
9077	1	69	1664
9078	1	62	1664
9079	4	64	1664
9080	5	65	1664
9081	5	71	1664
9082	4	66	1664
9083	3	77	1664
9084	2	68	1664
9085	3	68	1664
9086	5	77	1665
9087	2	61	1665
9088	2	64	1666
9089	2	62	1666
9090	4	70	1666
9091	5	79	1666
9092	4	64	1666
9093	5	63	1666
9094	3	62	1666
9095	1	62	1666
9096	4	78	1666
9097	3	79	1667
9098	5	62	1667
9099	4	67	1667
9100	2	79	1667
9101	1	80	1667
9102	5	80	1667
9103	3	62	1667
9104	2	64	1667
9105	5	73	1667
9106	5	63	1667
9107	4	67	1668
9108	1	73	1668
9109	4	80	1668
9110	1	75	1668
9111	5	71	1669
9112	5	70	1670
9113	1	62	1670
9114	3	67	1670
9115	2	76	1670
9116	5	78	1670
9117	4	64	1670
9118	3	80	1670
9119	3	73	1671
9120	2	68	1671
9121	2	61	1672
9122	4	65	1672
9123	2	77	1672
9124	1	73	1672
9125	4	66	1672
9126	3	63	1672
9127	4	71	1673
9128	2	63	1673
9129	1	66	1673
9130	3	62	1673
9131	2	72	1673
9132	3	61	1673
9133	5	71	1673
9134	5	75	1673
9135	5	78	1673
9136	3	76	1673
9137	5	63	1674
9138	1	68	1674
9139	1	70	1674
9140	4	80	1674
9141	3	79	1674
9142	5	71	1674
9143	4	79	1675
9144	1	66	1675
9145	4	61	1676
9146	1	64	1676
9147	5	68	1677
9148	5	66	1677
9149	1	68	1677
9150	5	78	1677
9151	1	79	1677
9152	2	73	1677
9153	4	63	1677
9154	5	63	1678
9155	1	80	1678
9156	5	66	1678
9157	5	65	1679
9158	1	64	1679
9159	5	78	1679
9160	3	69	1679
9161	4	68	1679
9162	5	72	1679
9163	1	68	1679
9164	5	68	1679
9165	2	72	1679
9166	4	71	1680
9167	2	65	1680
9168	2	65	1680
9169	2	64	1680
9170	1	67	1680
9171	3	72	1680
9172	5	63	1680
9173	4	78	1681
9174	1	72	1681
9175	2	64	1681
9176	5	73	1681
9177	5	68	1681
9178	3	62	1681
9179	5	65	1682
9180	4	67	1682
9181	4	64	1682
9182	2	78	1682
9183	5	68	1682
9184	3	71	1682
9185	2	77	1682
9186	3	70	1682
9187	4	71	1682
9188	5	61	1682
9189	3	71	1683
9190	2	78	1684
9191	3	77	1684
9192	4	73	1684
9193	3	75	1685
9194	3	62	1685
9195	5	67	1685
9196	3	63	1685
9197	4	65	1685
9198	1	71	1686
9199	2	66	1686
9200	4	67	1686
9201	1	77	1686
9202	2	61	1686
9203	3	79	1687
9204	1	64	1687
9205	1	67	1688
9206	2	79	1688
9207	4	76	1688
9208	1	65	1688
9209	2	69	1688
9210	2	68	1688
9211	2	66	1689
9212	4	72	1689
9213	3	62	1689
9214	4	64	1689
9215	5	64	1689
9216	1	70	1689
9217	4	66	1689
9218	2	66	1689
9219	5	76	1689
9220	4	80	1689
9221	5	65	1690
9222	1	63	1690
9223	2	76	1690
9224	2	68	1690
9225	3	79	1690
9226	1	71	1690
9227	3	63	1691
9228	4	79	1691
9229	2	63	1691
9230	5	62	1691
9231	5	67	1691
9232	5	80	1691
9233	3	78	1692
9234	3	69	1692
9235	1	73	1692
9236	5	65	1692
9237	2	64	1692
9238	2	75	1692
9239	5	70	1693
9240	5	78	1693
9241	5	73	1693
9242	2	66	1693
9243	5	75	1693
9244	3	70	1693
9245	3	65	1693
9246	3	68	1694
9247	1	80	1694
9248	2	78	1694
9249	5	74	1694
9250	3	71	1694
9251	1	69	1694
9252	5	79	1694
9253	3	77	1694
9254	3	64	1694
9255	5	74	1694
9256	2	74	1695
9257	2	80	1695
9258	3	74	1695
9259	4	77	1695
9260	4	76	1695
9261	1	70	1695
9262	2	80	1695
9263	1	62	1695
9264	2	66	1696
9265	1	71	1696
9266	3	76	1696
9267	4	62	1696
9268	1	70	1696
9269	1	71	1696
9270	5	64	1696
9271	1	72	1697
9272	1	63	1697
9273	5	73	1697
9274	2	64	1697
9275	2	74	1697
9276	4	73	1697
9277	2	61	1697
9278	4	67	1698
9279	2	80	1698
9280	1	74	1698
9281	5	69	1698
9282	5	74	1698
9283	3	79	1699
9284	1	68	1699
9285	2	74	1699
9286	2	79	1700
9287	1	70	1700
9288	1	72	1700
9289	4	65	1700
9290	3	62	1700
9291	4	69	1701
9292	5	71	1701
9293	5	74	1701
9294	1	64	1702
9295	3	68	1702
9296	5	70	1702
9297	5	69	1703
9298	4	63	1703
9299	1	80	1703
9300	2	67	1703
9301	4	63	1703
9302	4	78	1703
9303	5	74	1703
9304	3	62	1704
9305	1	61	1704
9306	5	79	1704
9307	1	72	1704
9308	3	77	1705
9309	5	67	1705
9310	5	66	1705
9311	5	64	1705
9312	2	70	1705
9313	5	63	1705
9314	3	71	1705
9315	2	74	1705
9316	4	73	1705
9317	1	65	1705
9318	1	74	1706
9319	3	72	1706
9320	4	69	1706
9321	3	65	1706
9322	1	74	1706
9323	3	64	1707
9324	1	63	1707
9325	5	74	1707
9326	5	63	1707
9327	2	70	1707
9328	3	74	1707
9329	2	76	1707
9330	4	78	1707
9331	2	70	1707
9332	4	65	1707
9333	1	72	1708
9334	1	62	1708
9335	1	78	1708
9336	3	64	1708
9337	3	76	1708
9338	3	80	1708
9339	4	63	1709
9340	1	74	1709
9341	2	74	1709
9342	2	80	1709
9343	3	65	1709
9344	1	77	1709
9345	5	73	1709
9346	5	78	1709
9347	3	69	1710
9348	2	64	1710
9349	5	66	1710
9350	5	74	1710
9351	2	69	1710
9352	3	72	1710
9353	1	78	1710
9354	3	73	1710
9355	4	75	1710
9356	5	74	1711
9357	4	73	1711
9358	2	73	1711
9359	3	71	1711
9360	2	67	1711
9361	3	80	1711
9362	2	79	1711
9363	5	72	1711
9364	3	76	1711
9365	3	61	1711
9366	1	66	1712
9367	3	66	1712
9368	3	67	1712
9369	1	61	1713
9370	2	69	1713
9371	4	66	1713
9372	2	71	1713
9373	3	75	1713
9374	3	73	1713
9375	1	77	1713
9376	3	76	1713
9377	2	69	1713
9378	3	75	1713
9379	3	69	1714
9380	3	71	1714
9381	4	78	1714
9382	3	74	1714
9383	3	75	1714
9384	2	70	1714
9385	4	67	1714
9386	2	75	1715
9387	1	70	1715
9388	3	62	1715
9389	3	70	1715
9390	3	75	1715
9391	3	64	1716
9392	1	76	1716
9393	3	75	1716
9394	2	78	1716
9395	2	73	1716
9396	4	63	1716
9397	1	79	1716
9398	2	66	1716
9399	1	66	1716
9400	2	77	1717
9401	3	71	1717
9402	1	66	1717
9403	5	80	1717
9404	1	62	1717
9405	4	61	1717
9406	1	68	1717
9407	3	61	1717
9408	1	62	1717
9409	4	78	1717
9410	1	69	1718
9411	5	68	1718
9412	4	79	1718
9413	2	61	1718
9414	3	79	1718
9415	2	73	1718
9416	3	66	1718
9417	5	69	1718
9418	2	73	1719
9419	4	79	1719
9420	3	69	1719
9421	2	67	1719
9422	4	64	1719
9423	1	68	1719
9424	3	61	1719
9425	2	64	1720
9426	1	73	1720
9427	5	64	1720
9428	5	64	1720
9429	4	80	1720
9430	2	63	1721
9431	3	66	1721
9432	4	75	1721
9433	3	74	1721
9434	1	71	1721
9435	5	78	1721
9436	2	64	1721
9437	2	77	1721
9438	3	79	1721
9439	1	66	1722
9440	1	78	1722
9441	3	62	1722
9442	4	64	1722
9443	3	61	1722
9444	1	75	1722
9445	5	66	1722
9446	4	61	1722
9447	3	80	1723
9448	1	75	1724
9449	4	77	1724
9450	4	72	1724
9451	4	70	1724
9452	3	66	1724
9453	4	75	1724
9454	1	78	1724
9455	5	62	1724
9456	5	72	1724
9457	5	66	1725
9458	3	80	1725
9459	1	63	1726
9460	2	61	1726
9461	3	67	1726
9462	3	66	1726
9463	1	75	1726
9464	5	62	1726
9465	5	74	1726
9466	1	68	1726
9467	2	70	1726
9468	2	76	1727
9469	2	62	1727
9470	2	76	1727
9471	1	72	1727
9472	4	73	1727
9473	5	73	1728
9474	3	73	1728
9475	3	70	1728
9476	5	72	1728
9477	1	67	1728
9478	1	76	1728
9479	3	75	1728
9480	4	80	1729
9481	4	78	1729
9482	4	67	1729
9483	4	73	1729
9484	2	71	1729
9485	4	62	1730
9486	2	78	1730
9487	3	67	1730
9488	2	68	1730
9489	4	73	1730
9490	5	69	1730
9491	1	77	1730
9492	3	71	1730
9493	4	74	1730
9494	2	75	1730
9495	1	74	1731
9496	2	80	1731
9497	1	80	1731
9498	3	79	1731
9499	5	65	1731
9500	3	71	1731
9501	2	69	1731
9502	4	68	1731
9503	2	73	1731
9504	4	64	1731
9505	3	71	1732
9506	5	65	1732
9507	1	70	1732
9508	4	61	1732
9509	2	66	1732
9510	2	78	1732
9511	3	67	1732
9512	1	68	1732
9513	1	70	1733
9514	4	64	1733
9515	2	69	1733
9516	4	76	1733
9517	3	62	1733
9518	1	75	1733
9519	5	62	1733
9520	1	70	1733
9521	2	71	1733
9522	2	67	1734
9523	4	78	1734
9524	3	67	1734
9525	4	76	1734
9526	2	63	1734
9527	3	75	1734
9528	5	62	1734
9529	4	69	1735
9530	1	65	1735
9531	1	70	1735
9532	3	68	1735
9533	4	68	1736
9534	5	70	1736
9535	4	73	1736
9536	2	61	1736
9537	3	61	1736
9538	3	63	1736
9539	1	64	1736
9540	4	68	1736
9541	3	66	1736
9542	3	73	1737
9543	5	80	1737
9544	5	70	1737
9545	3	75	1738
9546	4	78	1738
9547	2	74	1738
9548	2	80	1738
9549	5	68	1738
9550	5	67	1738
9551	5	75	1739
9552	5	66	1739
9553	1	67	1740
9554	2	79	1740
9555	3	68	1740
9556	3	69	1740
9557	3	69	1740
9558	2	67	1740
9559	2	77	1740
9560	3	74	1741
9561	1	79	1741
9562	5	69	1741
9563	3	68	1741
9564	1	77	1741
9565	4	78	1741
9566	4	76	1741
9567	4	63	1741
9568	1	69	1742
9569	2	61	1742
9570	1	62	1742
9571	2	76	1742
9572	4	77	1743
9573	3	66	1743
9574	1	73	1743
9575	1	80	1743
9576	4	67	1743
9577	4	79	1743
9578	4	66	1743
9579	4	67	1743
9580	4	73	1743
9581	3	76	1743
9582	3	75	1744
9583	2	75	1744
9584	1	71	1744
9585	3	77	1744
9586	5	69	1744
9587	5	74	1744
9588	4	70	1744
9589	3	75	1744
9590	2	65	1744
9591	5	80	1744
9592	5	75	1745
9593	4	68	1745
9594	3	75	1745
9595	5	66	1745
9596	1	67	1745
9597	3	72	1745
9598	5	69	1745
9599	4	66	1746
9600	4	77	1746
9601	2	69	1746
9602	3	80	1746
9603	3	72	1746
9604	3	69	1746
9605	4	67	1747
9606	3	80	1747
9607	5	72	1747
9608	1	77	1747
9609	3	78	1747
9610	2	80	1747
9611	2	66	1748
9612	5	65	1748
9613	1	62	1749
9614	5	75	1749
9615	4	62	1749
9616	2	69	1750
9617	1	75	1750
9618	3	70	1750
9619	4	72	1750
9620	2	62	1751
9621	2	79	1751
9622	3	74	1751
9623	4	66	1751
9624	2	71	1751
9625	2	69	1751
9626	4	74	1752
9627	1	63	1752
9628	5	68	1752
9629	1	75	1752
9630	5	72	1752
9631	2	75	1752
9632	1	73	1752
9633	5	63	1753
9634	5	76	1753
9635	1	64	1753
9636	2	79	1753
9637	5	75	1753
9638	4	76	1753
9639	2	76	1753
9640	2	79	1753
9641	2	72	1753
9642	1	69	1753
9643	4	66	1754
9644	1	69	1754
9645	2	75	1754
9646	3	73	1754
9647	2	70	1754
9648	5	64	1755
9649	4	79	1755
9650	4	63	1755
9651	3	74	1755
9652	1	64	1755
9653	3	71	1755
9654	4	64	1755
9655	2	71	1755
9656	4	62	1755
9657	3	65	1755
9658	5	78	1756
9659	2	75	1756
9660	2	78	1756
9661	5	75	1756
9662	2	64	1756
9663	2	79	1756
9664	1	76	1756
9665	2	70	1756
9666	1	61	1756
9667	2	80	1756
9668	5	71	1757
9669	4	74	1757
9670	3	64	1757
9671	4	64	1757
9672	1	67	1757
9673	2	78	1758
9674	3	69	1758
9675	5	62	1758
9676	3	62	1759
9677	1	76	1759
9678	2	65	1759
9679	5	68	1759
9680	2	70	1760
9681	4	72	1760
9682	3	80	1760
9683	2	71	1760
9684	5	67	1761
9685	3	67	1761
9686	4	78	1761
9687	1	74	1761
9688	2	73	1761
9689	5	70	1761
9690	2	77	1761
9691	3	64	1762
9692	1	63	1762
9693	4	79	1762
9694	3	79	1762
9695	5	74	1762
9696	2	62	1762
9697	5	69	1763
9698	4	70	1763
9699	5	77	1763
9700	4	71	1763
9701	4	64	1763
9702	5	80	1763
9703	2	69	1763
9704	1	76	1763
9705	5	80	1763
9706	5	62	1764
9707	5	71	1764
9708	4	64	1764
9709	5	68	1764
9710	2	79	1764
9711	3	66	1764
9712	5	72	1765
9713	1	62	1766
9714	2	61	1766
9715	3	63	1766
9716	4	72	1766
9717	5	71	1767
9718	5	78	1767
9719	2	70	1767
9720	3	79	1767
9721	4	61	1767
9722	2	63	1767
9723	2	69	1767
9724	3	62	1767
9725	3	73	1767
9726	3	69	1767
9727	1	79	1768
9728	1	67	1768
9729	1	76	1769
9730	3	69	1769
9731	5	68	1769
9732	4	79	1769
9733	3	78	1769
9734	1	64	1769
9735	2	77	1769
9736	2	63	1769
9737	5	80	1770
9738	1	74	1770
9739	3	61	1770
9740	2	71	1770
9741	4	78	1770
9742	5	64	1770
9743	4	69	1770
9744	2	64	1771
9745	5	71	1771
9746	1	70	1772
9747	4	79	1772
9748	2	74	1772
9749	2	63	1773
9750	2	80	1773
9751	5	72	1773
9752	4	64	1773
9753	3	72	1774
9754	4	63	1774
9755	3	78	1774
9756	4	64	1774
9757	2	69	1774
9758	1	77	1774
9759	4	76	1774
9760	5	61	1774
9761	2	72	1774
9762	1	72	1775
9763	1	73	1775
9764	4	65	1775
9765	2	73	1776
9766	4	79	1776
9767	3	68	1777
9768	1	65	1777
9769	2	74	1777
9770	1	71	1778
9771	5	76	1778
9772	3	62	1778
9773	3	64	1778
9774	2	75	1778
9775	2	66	1779
9776	1	67	1780
9777	2	71	1780
9778	5	67	1780
9779	5	79	1780
9780	5	74	1780
9781	3	68	1780
9782	4	69	1781
9783	2	64	1781
9784	5	66	1781
9785	4	66	1781
9786	5	69	1781
9787	1	75	1781
9788	5	61	1781
9789	4	74	1782
9790	5	67	1782
9791	1	80	1782
9792	4	71	1782
9793	1	76	1782
9794	4	70	1783
9795	3	71	1783
9796	3	69	1783
9797	5	71	1783
9798	2	72	1783
9799	3	80	1783
9800	1	76	1783
9801	3	77	1784
9802	1	73	1785
9803	2	76	1785
9804	2	68	1785
9805	4	73	1785
9806	4	64	1785
9807	1	69	1785
9808	4	75	1785
9809	3	77	1785
9810	5	74	1785
9811	4	74	1785
9812	4	70	1786
9813	3	68	1786
9814	4	76	1786
9815	4	71	1786
9816	5	80	1786
9817	1	72	1786
9818	5	73	1787
9819	4	71	1787
9820	1	78	1787
9821	2	66	1787
9822	1	78	1787
9823	2	63	1787
9824	4	76	1787
9825	5	70	1788
9826	5	70	1788
9827	5	62	1788
9828	3	62	1788
9829	5	64	1788
9830	3	66	1788
9831	4	78	1788
9832	1	70	1788
9833	1	65	1788
9834	2	71	1788
9835	1	76	1789
9836	2	61	1789
9837	4	69	1789
9838	5	68	1789
9839	4	72	1789
9840	1	71	1790
9841	1	77	1790
9842	5	71	1790
9843	1	65	1790
9844	2	75	1791
9845	5	66	1791
9846	3	71	1791
9847	3	73	1791
9848	1	61	1791
9849	1	76	1791
9850	1	68	1791
9851	2	77	1791
9852	5	66	1791
9853	2	67	1792
9854	4	67	1792
9855	3	71	1792
9856	2	76	1792
9857	1	69	1792
9858	1	73	1792
9859	2	67	1792
9860	3	67	1792
9861	4	74	1793
9862	4	69	1793
9863	1	62	1793
9864	4	71	1793
9865	3	65	1794
9866	1	66	1794
9867	1	80	1794
9868	3	66	1794
9869	4	75	1794
9870	1	66	1794
9871	2	74	1795
9872	1	77	1795
9873	3	64	1796
9874	5	64	1796
9875	5	71	1796
9876	2	80	1797
9877	4	75	1797
9878	5	71	1797
9879	2	63	1797
9880	3	67	1797
9881	5	64	1797
9882	1	80	1797
9883	3	75	1797
9884	3	68	1797
9885	3	61	1797
9886	4	76	1798
9887	3	68	1798
9888	1	61	1798
9889	1	70	1798
9890	5	63	1798
9891	5	64	1798
9892	4	65	1798
9893	2	71	1798
9894	1	77	1798
9895	3	79	1799
9896	1	62	1799
9897	2	71	1799
9898	1	74	1799
9899	1	63	1799
9900	2	61	1799
9901	5	72	1799
9902	1	66	1799
9903	1	73	1800
9904	2	67	1800
9905	4	70	1800
9906	3	63	1800
9907	4	69	1800
9908	2	64	1800
9909	4	78	1800
9910	1	76	1801
9911	5	70	1801
9912	5	76	1801
9913	5	65	1802
9914	1	75	1802
9915	3	61	1802
9916	5	79	1802
9917	4	71	1802
9918	1	61	1803
9919	3	62	1803
9920	1	77	1803
9921	1	63	1803
9922	1	65	1803
9923	1	74	1803
9924	1	72	1803
9925	5	80	1803
9926	2	78	1803
9927	2	67	1804
9928	5	74	1804
9929	2	74	1805
9930	5	77	1805
9931	1	71	1805
9932	3	79	1805
9933	5	68	1805
9934	5	72	1806
9935	2	62	1806
9936	2	74	1806
9937	1	66	1806
9938	4	67	1806
9939	5	80	1806
9940	2	77	1806
9941	4	77	1807
9942	3	72	1807
9943	5	63	1807
9944	1	62	1807
9945	1	63	1807
9946	4	80	1807
9947	2	78	1808
9948	2	64	1808
9949	3	68	1808
9950	5	75	1808
9951	2	75	1808
9952	2	76	1808
9953	2	66	1808
9954	5	70	1809
9955	5	63	1809
9956	5	62	1809
9957	5	61	1810
9958	4	70	1810
9959	2	67	1810
9960	1	61	1810
9961	2	70	1810
9962	5	66	1810
9963	3	66	1811
9964	2	80	1811
9965	3	74	1811
9966	5	71	1811
9967	4	67	1812
9968	2	63	1812
9969	5	76	1812
9970	4	61	1812
9971	2	61	1812
9972	1	68	1813
9973	3	67	1813
9974	4	80	1813
9975	4	80	1813
9976	2	66	1813
9977	3	67	1813
9978	2	77	1813
9979	5	76	1813
9980	5	63	1813
9981	5	76	1813
9982	1	67	1814
9983	1	69	1814
9984	5	63	1814
9985	2	77	1815
9986	3	71	1815
9987	3	76	1815
9988	2	72	1816
9989	5	79	1816
9990	5	74	1816
9991	5	64	1816
9992	2	68	1816
9993	2	78	1816
9994	4	61	1817
9995	4	65	1818
9996	2	65	1818
9997	4	63	1818
9998	5	66	1818
9999	3	70	1819
10000	2	74	1820
10001	4	67	1820
10002	4	67	1820
10003	4	75	1820
10004	2	65	1820
10005	2	73	1821
10006	5	80	1821
10007	2	63	1821
10008	1	76	1822
10009	1	62	1822
10010	5	77	1823
10011	3	70	1823
10012	2	71	1823
10013	1	79	1823
10014	4	73	1823
10015	2	76	1823
10016	4	74	1823
10017	2	74	1824
10018	1	77	1824
10019	2	75	1824
10020	5	70	1824
10021	4	63	1824
10022	3	64	1824
10023	1	62	1824
10024	2	72	1824
10025	1	70	1824
10026	3	66	1824
10027	2	68	1825
10028	4	72	1825
10029	1	69	1825
10030	2	66	1825
10031	1	66	1825
10032	5	63	1825
10033	2	64	1826
10034	1	70	1826
10035	3	80	1827
10036	3	80	1827
10037	1	70	1827
10038	2	70	1827
10039	4	75	1827
10040	2	73	1827
10041	4	76	1827
10042	4	68	1827
10043	2	65	1827
10044	2	77	1828
10045	5	73	1828
10046	1	71	1829
10047	1	69	1830
10048	3	74	1830
10049	5	77	1830
10050	1	61	1830
10051	3	75	1830
10052	5	64	1831
10053	3	68	1831
10054	1	71	1831
10055	1	68	1832
10056	5	71	1832
10057	1	66	1832
10058	5	64	1832
10059	1	80	1832
10060	1	70	1832
10061	2	61	1833
10062	5	64	1833
10063	2	69	1833
10064	1	79	1833
10065	5	68	1833
10066	5	62	1833
10067	2	70	1833
10068	1	69	1833
10069	1	77	1833
10070	1	69	1834
10071	3	64	1835
10072	1	70	1835
10073	4	63	1835
10074	3	65	1835
10075	1	78	1835
10076	1	70	1835
10077	4	68	1835
10078	1	79	1835
10079	3	70	1835
10080	4	77	1836
10081	2	66	1836
10082	4	74	1836
10083	2	74	1836
10084	4	76	1836
10085	5	62	1836
10086	3	65	1836
10087	2	75	1837
10088	2	71	1837
10089	5	66	1837
10090	1	70	1837
10091	4	76	1837
10092	4	77	1837
10093	5	67	1837
10094	1	61	1838
10095	2	73	1838
10096	4	80	1838
10097	1	74	1838
10098	2	78	1838
10099	5	69	1838
10100	5	74	1838
10101	3	74	1838
10102	3	75	1839
10103	2	65	1839
10104	3	76	1839
10105	4	71	1839
10106	5	77	1839
10107	5	76	1840
10108	1	65	1841
10109	3	67	1841
10110	2	76	1841
10111	4	64	1841
10112	4	71	1841
10113	5	68	1841
10114	4	76	1841
10115	3	61	1841
10116	2	78	1841
10117	3	77	1841
10118	3	67	1842
10119	3	63	1842
10120	2	70	1842
10121	2	74	1842
10122	4	76	1842
10123	3	70	1842
10124	5	80	1842
10125	5	62	1842
10126	3	62	1842
10127	3	71	1842
10128	1	73	1843
10129	1	77	1843
10130	5	77	1843
10131	3	65	1843
10132	1	73	1843
10133	4	75	1843
10134	4	62	1843
10135	3	71	1843
10136	4	64	1843
10137	1	73	1844
10138	2	75	1844
10139	1	70	1844
10140	4	74	1845
10141	3	73	1845
10142	1	74	1845
10143	1	68	1845
10144	3	75	1845
10145	5	62	1845
10146	5	68	1845
10147	5	68	1846
10148	1	67	1846
10149	4	63	1847
10150	1	68	1848
10151	5	76	1848
10152	3	71	1848
10153	5	74	1848
10154	2	77	1848
10155	3	75	1849
10156	2	68	1849
10157	4	78	1850
10158	5	63	1851
10159	3	66	1851
10160	2	75	1851
10161	2	70	1851
10162	4	64	1851
10163	5	69	1851
10164	1	77	1852
10165	3	61	1852
10166	4	70	1853
10167	2	71	1853
10168	4	72	1853
10169	5	75	1853
10170	3	64	1853
10171	1	77	1853
10172	1	73	1853
10173	3	70	1853
10174	5	66	1853
10175	5	68	1854
10176	4	65	1854
10177	2	62	1854
10178	4	80	1854
10179	1	80	1854
10180	4	65	1854
10181	5	68	1854
10182	5	73	1855
10183	5	79	1855
10184	3	72	1855
10185	2	66	1855
10186	1	67	1855
10187	4	66	1855
10188	5	66	1855
10189	3	79	1855
10190	1	78	1856
10191	5	64	1857
10192	3	77	1857
10193	5	61	1857
10194	5	73	1857
10195	2	68	1858
10196	1	67	1858
10197	2	73	1858
10198	3	63	1858
10199	3	64	1858
10200	3	78	1858
10201	5	66	1859
10202	5	63	1859
10203	2	71	1859
10204	3	64	1859
10205	5	66	1860
10206	2	64	1860
10207	4	65	1860
10208	3	75	1860
10209	3	66	1860
10210	3	70	1860
10211	2	73	1860
10212	4	65	1860
10213	2	74	1860
10214	3	77	1861
10215	4	69	1862
10216	3	80	1862
10217	2	64	1862
10218	4	69	1862
10219	3	70	1862
10220	3	63	1862
10221	3	62	1862
10222	5	72	1862
10223	4	65	1862
10224	4	75	1862
10225	4	63	1863
10226	5	76	1863
10227	4	78	1863
10228	3	66	1863
10229	4	61	1863
10230	5	74	1863
10231	5	69	1863
10232	2	78	1863
10233	2	71	1863
10234	3	79	1864
10235	5	73	1864
10236	1	67	1864
10237	2	69	1864
10238	2	72	1864
10239	4	73	1864
10240	3	72	1864
10241	3	64	1864
10242	3	76	1865
10243	5	63	1865
10244	5	71	1865
10245	1	79	1865
10246	4	78	1865
10247	2	76	1865
10248	5	64	1865
10249	2	63	1865
10250	2	78	1865
10251	3	67	1866
10252	4	70	1867
10253	2	73	1867
10254	2	76	1867
10255	1	67	1867
10256	4	77	1867
10257	2	75	1867
10258	4	73	1867
10259	2	73	1867
10260	3	73	1867
10261	4	70	1868
10262	4	65	1868
10263	5	72	1868
10264	1	68	1868
10265	5	74	1868
10266	3	62	1868
10267	4	77	1868
10268	3	74	1868
10269	3	61	1869
10270	5	73	1869
10271	1	79	1869
10272	3	74	1869
10273	3	80	1870
10274	3	71	1870
10275	2	68	1870
10276	3	73	1870
10277	2	67	1870
10278	3	67	1870
10279	1	72	1870
10280	3	79	1870
10281	4	76	1870
10282	1	73	1870
10283	5	74	1871
10284	2	67	1871
10285	1	70	1871
10286	2	72	1871
10287	2	61	1871
10288	2	76	1871
10289	5	65	1871
10290	3	62	1871
10291	4	67	1871
10292	4	73	1872
10293	5	62	1872
10294	1	75	1872
10295	2	66	1872
10296	1	68	1872
10297	5	64	1872
10298	5	80	1872
10299	5	72	1872
10300	2	66	1873
10301	5	78	1873
10302	4	77	1873
10303	1	73	1873
10304	4	68	1874
10305	3	63	1874
10306	4	66	1874
10307	5	79	1874
10308	2	68	1874
10309	5	76	1874
10310	1	79	1874
10311	4	71	1875
10312	5	76	1875
10313	1	62	1875
10314	2	71	1875
10315	5	78	1875
10316	2	66	1875
10317	5	69	1876
10318	2	65	1876
10319	2	76	1877
10320	1	70	1877
10321	3	74	1877
10322	3	69	1877
10323	3	73	1877
10324	1	65	1877
10325	4	78	1878
10326	5	74	1879
10327	5	78	1879
10328	4	71	1879
10329	5	71	1879
10330	4	70	1879
10331	2	77	1879
10332	5	61	1879
10333	3	63	1879
10334	1	78	1879
10335	4	70	1880
10336	1	76	1880
10337	1	79	1880
10338	2	72	1881
10339	3	76	1881
10340	4	68	1881
10341	3	75	1881
10342	4	71	1881
10343	2	80	1881
10344	4	67	1881
10345	3	64	1882
10346	4	80	1882
10347	3	70	1882
10348	2	65	1882
10349	5	79	1882
10350	5	79	1883
10351	3	77	1883
10352	5	76	1883
10353	3	68	1883
10354	5	61	1883
10355	5	77	1884
10356	1	61	1884
10357	1	66	1884
10358	1	78	1884
10359	1	69	1884
10360	4	68	1884
10361	3	76	1884
10362	4	63	1884
10363	4	73	1885
10364	4	72	1885
10365	1	66	1885
10366	4	77	1885
10367	1	76	1885
10368	3	63	1885
10369	2	62	1885
10370	5	77	1885
10371	2	77	1885
10372	3	61	1885
10373	5	61	1886
10374	3	80	1887
10375	1	78	1887
10376	1	67	1887
10377	1	80	1887
10378	4	71	1887
10379	2	76	1888
10380	1	79	1888
10381	1	69	1888
10382	5	75	1888
10383	3	76	1889
10384	5	80	1889
10385	1	78	1889
10386	5	64	1889
10387	3	77	1889
10388	2	75	1889
10389	5	61	1889
10390	2	74	1889
10391	5	69	1889
10392	4	66	1889
10393	3	62	1890
10394	3	77	1890
10395	4	75	1890
10396	5	68	1890
10397	1	64	1891
10398	5	70	1891
10399	1	80	1891
10400	4	71	1891
10401	2	63	1891
10402	3	74	1892
10403	1	72	1892
10404	3	66	1892
10405	2	66	1892
10406	2	75	1892
10407	2	76	1892
10408	3	70	1893
10409	1	76	1893
10410	5	64	1893
10411	1	72	1893
10412	3	63	1893
10413	4	74	1893
10414	1	67	1894
10415	1	66	1894
10416	5	80	1894
10417	2	78	1895
10418	3	62	1895
10419	5	80	1895
10420	2	64	1896
10421	5	76	1896
10422	4	64	1896
10423	1	68	1896
10424	3	72	1896
10425	1	79	1896
10426	3	67	1897
10427	1	63	1897
10428	2	71	1897
10429	2	71	1898
10430	3	78	1898
10431	5	69	1898
10432	1	69	1898
10433	4	72	1898
10434	4	64	1898
10435	4	77	1898
10436	5	69	1898
10437	3	80	1898
10438	2	73	1899
10439	3	71	1899
10440	5	70	1899
10441	3	79	1900
10442	4	66	1900
10443	1	79	1900
10444	5	70	1901
10445	3	67	1901
10446	2	71	1901
10447	4	68	1902
10448	4	72	1902
10449	1	80	1902
10450	1	78	1902
10451	1	69	1902
10452	3	76	1903
10453	3	68	1903
10454	4	63	1903
10455	2	64	1903
10456	4	68	1903
10457	4	61	1904
10458	3	74	1904
10459	3	64	1904
10460	5	62	1904
10461	2	64	1904
10462	5	61	1905
10463	2	65	1905
10464	5	63	1905
10465	2	61	1905
10466	4	63	1905
10467	2	72	1905
10468	4	70	1905
10469	1	75	1905
10470	1	77	1906
10471	3	69	1906
10472	5	72	1906
10473	4	77	1906
10474	2	73	1906
10475	3	65	1907
10476	1	73	1907
10477	1	74	1907
10478	5	69	1907
10479	5	61	1907
10480	5	72	1908
10481	4	69	1908
10482	2	61	1908
10483	4	72	1908
10484	1	79	1908
10485	4	62	1908
10486	5	75	1908
10487	4	77	1908
10488	3	76	1908
10489	1	71	1909
10490	5	75	1910
10491	2	71	1910
10492	1	66	1910
10493	2	67	1910
10494	5	65	1910
10495	4	63	1910
10496	1	70	1910
10497	1	68	1910
10498	4	68	1910
10499	3	64	1910
10500	3	70	1911
10501	3	73	1911
10502	4	65	1911
10503	5	69	1911
10504	5	76	1911
10505	1	70	1911
10506	2	80	1912
10507	4	77	1912
10508	4	77	1912
10509	5	68	1912
10510	3	63	1912
10511	3	74	1912
10512	4	66	1912
10513	1	80	1912
10514	4	63	1913
10515	1	65	1913
10516	4	75	1913
10517	4	80	1913
10518	2	67	1913
10519	1	65	1913
10520	1	61	1913
10521	4	69	1913
10522	2	67	1913
10523	3	69	1914
10524	5	77	1914
10525	4	77	1914
10526	5	78	1914
10527	2	80	1914
10528	3	61	1914
10529	4	71	1914
10530	3	71	1915
10531	3	67	1915
10532	2	66	1915
10533	5	76	1915
10534	1	74	1915
10535	4	80	1915
10536	2	68	1915
10537	2	70	1915
10538	3	74	1915
10539	3	67	1915
10540	3	73	1916
10541	4	75	1916
10542	4	73	1916
10543	4	68	1916
10544	3	66	1916
10545	1	61	1917
10546	2	68	1917
10547	3	69	1918
10548	5	62	1918
10549	3	62	1918
10550	1	68	1918
10551	3	73	1919
10552	3	77	1919
10553	5	62	1919
10554	4	68	1919
10555	3	80	1919
10556	5	73	1919
10557	2	70	1919
10558	4	61	1919
10559	4	70	1919
10560	5	76	1920
10561	1	72	1920
10562	3	78	1920
10563	1	79	1920
10564	2	66	1920
10565	5	77	1920
10566	4	63	1920
10567	4	77	1920
10568	3	78	1920
10569	5	79	1921
10570	1	80	1921
10571	5	73	1921
10572	3	71	1921
10573	1	63	1921
10574	3	71	1921
10575	2	68	1922
10576	4	68	1922
10577	3	67	1923
10578	1	64	1923
10579	5	73	1923
10580	3	79	1923
10581	5	73	1924
10582	4	79	1924
10583	3	66	1925
10584	2	62	1925
10585	4	63	1925
10586	5	64	1925
10587	4	74	1925
10588	4	61	1925
10589	1	73	1925
10590	5	77	1926
10591	5	76	1926
10592	5	62	1926
10593	5	61	1926
10594	1	62	1926
10595	4	67	1926
10596	5	62	1927
10597	3	68	1927
10598	3	75	1927
10599	5	62	1927
10600	3	80	1927
10601	5	65	1927
10602	2	63	1927
10603	2	77	1927
10604	3	67	1927
10605	3	61	1928
10606	3	74	1928
10607	4	63	1928
10608	5	66	1928
10609	1	79	1928
10610	4	73	1928
10611	5	62	1928
10612	2	80	1929
10613	4	66	1929
10614	5	74	1929
10615	5	72	1929
10616	3	68	1929
10617	2	66	1929
10618	2	65	1930
10619	3	64	1930
10620	4	75	1930
10621	3	64	1930
10622	4	63	1930
10623	1	75	1930
10624	4	65	1930
10625	3	68	1930
10626	3	76	1930
10627	3	76	1930
10628	4	68	1931
10629	5	64	1932
10630	1	77	1932
10631	2	67	1932
10632	2	67	1932
10633	5	63	1932
10634	1	68	1932
10635	5	79	1932
10636	5	71	1932
10637	3	74	1932
10638	4	64	1932
10639	5	61	1933
10640	3	66	1933
10641	2	61	1933
10642	2	78	1933
10643	3	63	1933
10644	4	71	1933
10645	5	77	1933
10646	4	71	1933
10647	5	74	1934
10648	2	65	1934
10649	3	72	1935
10650	4	77	1935
10651	5	66	1935
10652	2	77	1935
10653	4	65	1935
10654	4	71	1936
10655	2	74	1936
10656	5	64	1936
10657	1	73	1936
10658	5	75	1936
10659	5	73	1936
10660	2	72	1936
10661	2	61	1936
10662	5	76	1936
10663	4	66	1936
10664	2	67	1937
10665	1	66	1937
10666	4	67	1937
10667	4	78	1937
10668	5	77	1937
10669	2	62	1937
10670	4	78	1937
10671	5	67	1938
10672	3	69	1938
10673	2	72	1938
10674	3	77	1938
10675	5	79	1938
10676	4	73	1939
10677	4	79	1939
10678	5	70	1939
10679	5	66	1939
10680	1	66	1940
10681	2	64	1940
10682	5	64	1940
10683	5	79	1941
10684	4	64	1941
10685	2	69	1942
10686	2	75	1942
10687	4	79	1942
10688	4	62	1942
10689	1	75	1942
10690	2	77	1942
10691	3	75	1942
10692	1	80	1943
10693	1	75	1944
10694	1	61	1944
10695	4	73	1944
10696	4	64	1944
10697	3	77	1944
10698	1	73	1944
10699	4	74	1944
10700	1	74	1944
10701	4	62	1944
10702	1	79	1944
10703	4	61	1945
10704	1	68	1945
10705	4	71	1945
10706	3	69	1946
10707	4	69	1946
10708	3	64	1946
10709	5	68	1946
10710	4	78	1946
10711	2	78	1946
10712	2	62	1946
10713	2	68	1946
10714	1	70	1946
10715	4	71	1946
10716	2	66	1947
10717	3	62	1947
10718	1	69	1948
10719	1	80	1948
10720	1	64	1948
10721	3	69	1948
10722	2	76	1948
10723	1	71	1948
10724	1	61	1948
10725	1	78	1948
10726	1	70	1949
10727	3	71	1949
10728	5	65	1949
10729	5	74	1949
10730	2	78	1949
10731	3	63	1950
10732	3	74	1950
10733	3	64	1950
10734	1	71	1951
10735	5	67	1951
10736	3	61	1952
10737	3	62	1952
10738	2	62	1952
10739	1	73	1953
10740	1	68	1953
10741	1	66	1953
10742	4	77	1953
10743	3	66	1953
10744	5	73	1953
10745	5	72	1953
10746	3	62	1953
10747	4	80	1953
10748	5	80	1953
10749	5	68	1954
10750	1	73	1954
10751	1	76	1954
10752	5	65	1954
10753	3	70	1954
10754	2	69	1954
10755	5	72	1955
10756	4	75	1955
10757	1	75	1955
10758	2	77	1955
10759	5	70	1955
10760	4	61	1955
10761	1	71	1955
10762	5	79	1955
10763	5	67	1955
10764	3	68	1955
10765	5	75	1956
10766	3	62	1956
10767	2	69	1956
10768	3	71	1956
10769	4	69	1956
10770	3	63	1956
10771	4	72	1956
10772	2	72	1956
10773	3	66	1957
10774	3	64	1957
10775	1	71	1957
10776	2	66	1957
10777	3	70	1957
10778	2	71	1957
10779	3	70	1958
10780	4	79	1958
10781	4	80	1958
10782	1	67	1958
10783	4	61	1958
10784	4	65	1958
10785	2	67	1959
10786	4	76	1959
10787	1	65	1960
10788	4	76	1960
10789	4	75	1960
10790	2	74	1960
10791	2	64	1961
10792	3	74	1961
10793	2	66	1961
10794	5	79	1961
10795	5	68	1961
10796	3	78	1961
10797	2	72	1961
10798	3	72	1962
10799	3	70	1962
10800	2	63	1962
10801	1	70	1962
10802	3	74	1962
10803	4	63	1963
10804	4	75	1963
10805	1	64	1963
10806	4	74	1963
10807	5	78	1963
10808	5	75	1963
10809	2	75	1963
10810	4	69	1963
10811	4	67	1964
10812	1	68	1964
10813	3	79	1964
10814	3	68	1964
10815	2	64	1965
10816	3	69	1965
10817	2	62	1965
10818	2	79	1965
10819	3	73	1965
10820	1	65	1965
10821	4	76	1965
10822	2	79	1965
10823	5	65	1965
10824	4	75	1966
10825	5	78	1966
10826	5	79	1966
10827	3	78	1966
10828	5	63	1966
10829	4	79	1966
10830	2	76	1967
10831	3	65	1967
10832	5	74	1967
10833	5	65	1967
10834	4	76	1967
10835	3	78	1967
10836	4	71	1967
10837	4	73	1967
10838	2	75	1967
10839	2	62	1967
10840	2	77	1968
10841	1	65	1969
10842	1	61	1969
10843	2	68	1970
5451	4	67	1003
5452	5	67	1003
5453	5	77	1004
5454	5	62	1004
5455	3	78	1004
5456	1	74	1004
5457	1	64	1004
5458	4	67	1004
5459	2	76	1005
5460	4	71	1005
5461	4	73	1005
5462	5	77	1005
5463	1	62	1006
5464	1	80	1007
5465	1	80	1007
5466	3	64	1007
5467	1	69	1007
5468	1	76	1007
5469	1	69	1007
5470	1	77	1007
5471	1	71	1007
5472	1	64	1008
5473	5	77	1008
5474	1	66	1008
5475	5	70	1008
5476	1	71	1008
5477	3	78	1008
5478	2	63	1008
5479	1	68	1009
5480	4	61	1009
5481	4	62	1009
5482	4	72	1010
5483	3	62	1011
5484	2	70	1011
5485	1	79	1011
5486	5	67	1011
5487	4	65	1011
5488	4	76	1011
5489	1	70	1011
5490	2	77	1011
5491	2	62	1012
5492	2	77	1012
5493	4	66	1012
5494	5	73	1012
5495	5	72	1012
5496	2	62	1013
5497	5	70	1014
5498	2	73	1014
5499	4	67	1014
5500	4	71	1014
5501	5	65	1014
5502	4	69	1014
5503	3	72	1014
5504	3	61	1014
5505	2	68	1014
5506	2	79	1015
5507	2	78	1015
5508	1	68	1015
5509	2	80	1015
5510	3	68	1015
5511	5	70	1015
5512	2	75	1015
5513	5	72	1015
5514	2	80	1015
5515	4	79	1016
5516	3	79	1016
5517	2	80	1016
5518	2	69	1016
5519	2	68	1017
5520	2	74	1017
5521	3	77	1017
5522	1	76	1018
5523	3	68	1018
5524	5	68	1018
5525	3	79	1018
5526	2	62	1018
5527	2	63	1018
5528	1	79	1018
5529	4	71	1018
5530	1	65	1018
5531	1	64	1018
5532	5	69	1019
5533	1	72	1019
5534	5	79	1019
5535	3	62	1019
5536	4	65	1019
5537	3	78	1019
5538	4	61	1020
5539	2	74	1020
5540	4	72	1020
5541	3	66	1021
5542	3	80	1021
5543	2	62	1021
5544	4	71	1021
5545	3	73	1022
5546	5	76	1022
5547	1	61	1022
5548	2	61	1022
5549	4	67	1022
5550	4	62	1022
5551	5	69	1022
5552	5	71	1022
5553	1	64	1023
5554	4	69	1023
5555	5	66	1023
5556	5	72	1023
5557	5	61	1023
5558	2	65	1023
5559	4	77	1023
5560	2	62	1023
5561	3	72	1023
5562	2	77	1023
5563	4	66	1024
5564	2	74	1024
5565	5	69	1024
5566	1	78	1024
5567	5	73	1025
5568	3	61	1025
5569	4	74	1025
5570	1	79	1025
5571	1	69	1025
5572	1	76	1025
5573	2	64	1026
5574	1	80	1026
5575	4	79	1026
5576	2	78	1026
5577	4	79	1026
5578	3	66	1026
5579	4	80	1026
5580	5	70	1026
5581	5	77	1027
5582	3	76	1027
5583	4	66	1027
5584	1	70	1027
5585	3	69	1027
5586	3	65	1027
5587	2	61	1027
5588	1	79	1027
5589	3	65	1027
5590	5	80	1027
5591	2	68	1028
5592	1	64	1028
5593	4	78	1028
5594	5	75	1028
5595	3	79	1028
5596	5	61	1028
5597	1	76	1028
5598	5	61	1028
5599	4	64	1028
5600	3	73	1028
5601	4	77	1029
5602	5	74	1029
5603	3	67	1029
5604	3	79	1029
5605	2	80	1029
5606	3	71	1029
5607	1	72	1030
5608	1	66	1030
5609	4	76	1031
5610	1	66	1031
5611	3	61	1032
5612	1	69	1032
5613	5	62	1032
5614	3	76	1032
5615	1	63	1033
5616	1	66	1033
5617	5	68	1033
5618	3	72	1033
5619	2	64	1033
5620	2	69	1033
5621	3	74	1033
5622	1	74	1033
5623	2	74	1033
5624	2	65	1033
5625	5	61	1034
5626	2	75	1034
5627	5	68	1034
5628	1	63	1034
5629	5	68	1035
5630	2	64	1035
5631	1	69	1036
5632	2	76	1036
5633	2	63	1036
5634	3	74	1036
5635	2	70	1036
5636	5	71	1036
5637	2	76	1036
5638	5	73	1037
5639	3	64	1037
5640	3	68	1037
5641	4	63	1037
5642	1	75	1037
5643	4	63	1037
5644	5	64	1037
5645	2	63	1037
10844	1	63	1970
10845	5	72	1970
10846	2	69	1970
10847	3	79	1970
10848	2	61	1970
10849	4	64	1970
10850	5	64	1970
10851	3	67	1970
10852	4	73	1970
10853	4	76	1971
10854	1	77	1971
10855	1	77	1971
10856	3	72	1971
10857	3	80	1971
10858	1	76	1971
10859	1	65	1971
10860	2	65	1971
10861	1	61	1971
10862	1	77	1971
10863	3	71	1972
10864	1	76	1972
10865	5	76	1972
10866	5	79	1972
10867	2	69	1973
10868	1	79	1973
10869	3	75	1973
10870	2	77	1973
10871	3	72	1974
10872	2	80	1974
10873	2	62	1974
10874	4	70	1974
10875	4	76	1975
10876	5	74	1975
10877	4	66	1975
10878	5	78	1975
10879	5	72	1975
10880	2	80	1975
10881	1	70	1975
10882	5	62	1975
10883	3	67	1976
10884	4	74	1976
10885	1	74	1976
10886	3	61	1976
10887	2	72	1976
10888	3	67	1976
10889	4	62	1976
10890	5	76	1977
10891	3	80	1977
10892	1	75	1977
10893	3	72	1977
10894	4	71	1977
10895	2	65	1977
10896	5	66	1978
10897	1	66	1979
10898	4	63	1980
10899	2	80	1980
10900	1	63	1980
10901	3	61	1980
10902	1	74	1980
10903	1	76	1980
10904	1	72	1980
10905	2	80	1980
10906	3	71	1981
10907	4	80	1981
10908	2	69	1981
10909	1	72	1981
10910	5	67	1982
10911	2	61	1982
10912	2	63	1982
10913	3	77	1982
10914	2	65	1983
10915	1	77	1983
10916	2	69	1983
10917	3	70	1983
10918	4	63	1984
10919	1	68	1984
10920	4	61	1984
10921	5	71	1984
10922	5	76	1984
10923	2	72	1984
10924	2	76	1984
10925	4	68	1984
10926	5	69	1984
10927	2	78	1985
10928	2	77	1985
10929	5	80	1985
10930	5	79	1985
10931	1	64	1985
10932	4	77	1985
10933	4	72	1985
\.


--
-- TOC entry 2246 (class 0 OID 0)
-- Dependencies: 193
-- Name: store_lineitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('store_lineitem_id_seq', 11025, true);


--
-- TOC entry 2213 (class 0 OID 5813078)
-- Dependencies: 196
-- Data for Name: store_product; Type: TABLE DATA; Schema: public; Owner: -
--

COPY store_product (id, name, price) FROM stdin;
61	pAwWvjHMppSE	26.52
62	GFbjczQfAPgu	31.76
63	nfhnJGRJcbSI	69.13
64	fdLnWpRvghIQ	99.97
65	sbNfNjLVkUAI	37.67
66	sFbjoZqrAanc	98.92
67	eWdaVyAZTByn	47.51
68	JspQzcUNMFcT	10.91
69	ZoXknaKZljWW	33.45
70	CCQiyXfkyMOS	42.83
71	GygRQzrsKWDg	9.63
72	zfLyAOfRRtWZ	14.17
73	yBzqUfeIrvpr	19.58
74	awGreHtsPjNf	85.87
75	eIgPUXCuPSZw	53.24
76	eEiCPKHGaIhL	53.36
77	NbVHWheTmUAu	16.62
78	ZhOrovEjZwDO	61.03
79	OGkKYFpwGehf	67.08
80	VpKhlaeJlhxq	67.07
\.


--
-- TOC entry 2247 (class 0 OID 0)
-- Dependencies: 195
-- Name: store_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('store_product_id_seq', 80, true);


--
-- TOC entry 2215 (class 0 OID 5813086)
-- Dependencies: 198
-- Data for Name: store_sale; Type: TABLE DATA; Schema: public; Owner: -
--

COPY store_sale (id, customer_id, order_date) FROM stdin;
1039	345	2015-06-29
1040	382	2015-08-12
1041	357	2015-01-05
1042	372	2015-03-31
1043	331	2015-06-18
1044	395	2015-07-05
1045	370	2015-08-17
1046	395	2015-01-02
1047	322	2015-06-30
1048	379	2015-07-19
1049	303	2015-06-06
1050	333	2015-01-05
1051	399	2015-01-26
1052	370	2015-05-30
1053	377	2015-02-08
1054	372	2015-01-14
1055	345	2015-07-31
1056	353	2015-02-19
1057	389	2015-05-20
1058	320	2015-01-11
1059	398	2015-05-18
1060	323	2015-08-13
1061	368	2015-05-03
1062	306	2015-07-21
1063	335	2015-08-06
1064	386	2015-01-07
1065	338	2015-05-20
1066	363	2015-03-24
1067	363	2015-06-19
1068	345	2015-07-08
1069	309	2015-05-14
1070	328	2015-08-19
1071	362	2015-02-18
1072	381	2015-08-04
1073	391	2015-01-13
1074	372	2015-08-18
1075	383	2015-03-06
1076	358	2015-02-06
1077	363	2015-05-15
1078	379	2015-05-24
1079	389	2015-03-04
1080	373	2015-04-13
1081	373	2015-07-13
1082	389	2015-06-30
1083	357	2015-03-22
1084	369	2015-05-23
1085	343	2015-04-08
1086	346	2015-05-11
1087	399	2015-04-26
1088	316	2015-03-28
1089	393	2015-07-18
1090	355	2015-01-03
1091	331	2015-04-19
1092	346	2015-02-04
1093	334	2015-02-14
1094	317	2015-02-27
1095	358	2015-05-17
1096	345	2015-01-04
1097	359	2015-04-05
1098	350	2015-02-28
1099	320	2015-07-11
1100	346	2015-07-02
1101	344	2015-04-22
1102	373	2015-04-19
1103	371	2015-01-14
1104	344	2015-02-23
1105	370	2015-02-24
1106	351	2015-06-07
1107	394	2015-02-18
1108	332	2015-08-14
1109	312	2015-03-04
1110	358	2015-05-16
1111	390	2015-07-03
1112	350	2015-08-08
1113	383	2015-07-10
1114	389	2015-04-18
1115	374	2015-07-27
1116	376	2015-03-27
1117	395	2015-02-07
1118	303	2015-03-24
1119	324	2015-02-27
1120	357	2015-01-31
1121	368	2015-02-11
1122	359	2015-05-03
1123	393	2015-03-21
1124	389	2015-07-03
1125	339	2015-05-03
1126	309	2015-07-26
1127	309	2015-06-13
1128	315	2015-02-09
1129	308	2015-03-07
1130	379	2015-02-04
1131	334	2015-05-27
1132	376	2015-04-15
1133	307	2015-06-06
1134	337	2015-03-08
1135	343	2015-02-17
1136	309	2015-06-02
1137	358	2015-02-18
1138	363	2015-03-27
1139	362	2015-06-24
1140	323	2015-05-19
1141	357	2015-05-21
1142	315	2015-06-07
1143	326	2015-07-29
1144	319	2015-05-26
1145	400	2015-07-21
1146	380	2015-02-18
1147	348	2015-06-21
1148	316	2015-03-13
1149	363	2015-07-31
1150	324	2015-02-22
1151	372	2015-03-13
1152	372	2015-01-08
1153	362	2015-02-07
1154	330	2015-05-20
1155	315	2015-05-30
1156	320	2015-02-12
1157	332	2015-03-28
1158	363	2015-04-19
1159	309	2015-05-14
1160	305	2015-01-31
1161	397	2015-08-10
1162	382	2015-02-25
1163	383	2015-08-06
1164	325	2015-02-08
1165	357	2015-01-11
1166	369	2015-06-22
1167	306	2015-06-21
1168	392	2015-03-31
1169	324	2015-07-06
1170	342	2015-05-28
1171	370	2015-06-18
1172	382	2015-04-09
1173	318	2015-03-21
1174	373	2015-03-17
1175	329	2015-02-06
1176	310	2015-03-23
1177	306	2015-05-20
1178	338	2015-06-21
1179	329	2015-01-27
1180	368	2015-01-08
1181	332	2015-07-18
1182	323	2015-02-01
1183	311	2015-01-29
1184	330	2015-02-06
1185	342	2015-02-13
1186	365	2015-08-16
1187	398	2015-01-05
1188	380	2015-03-18
1189	331	2015-02-05
1190	325	2015-01-04
1191	310	2015-03-16
1192	329	2015-07-03
1193	321	2015-06-07
1194	353	2015-03-04
1195	343	2015-04-17
1196	303	2015-07-22
1197	311	2015-01-31
1198	330	2015-01-30
1199	365	2015-02-27
1200	372	2015-01-21
1201	309	2015-04-13
1202	362	2015-01-26
1203	398	2015-08-16
1204	378	2015-02-13
1205	334	2015-03-26
1206	391	2015-08-07
1207	360	2015-01-30
1208	367	2015-04-22
1209	332	2015-05-05
1210	394	2015-03-03
1211	301	2015-01-22
1212	323	2015-08-08
1213	304	2015-07-24
1214	397	2015-04-07
1215	341	2015-08-06
1216	361	2015-01-07
1217	339	2015-03-16
1218	331	2015-08-13
1219	352	2015-02-17
1220	363	2015-08-15
1221	321	2015-08-12
1222	306	2015-01-22
1223	302	2015-04-02
1224	352	2015-06-04
1225	390	2015-03-17
1226	361	2015-02-15
1227	399	2015-01-30
1228	347	2015-05-17
1229	378	2015-02-14
1230	392	2015-02-14
1231	301	2015-07-18
1232	350	2015-02-13
1233	376	2015-06-29
1234	347	2015-07-03
1235	338	2015-03-22
1236	302	2015-05-09
1237	350	2015-08-05
1238	395	2015-07-10
1239	311	2015-07-22
1240	378	2015-05-19
1241	328	2015-08-02
1242	345	2015-02-19
1243	375	2015-06-20
1244	304	2015-01-25
1245	347	2015-06-20
1246	388	2015-02-25
1247	329	2015-06-07
1248	386	2015-03-07
1249	400	2015-03-15
1250	391	2015-02-05
1251	320	2015-06-10
1252	368	2015-01-23
1253	314	2015-01-16
1254	327	2015-06-19
1255	338	2015-05-13
1256	390	2015-01-01
1257	376	2015-02-19
1258	351	2015-01-05
1259	303	2015-08-12
1260	343	2015-01-12
1261	349	2015-04-17
1262	354	2015-02-21
1263	367	2015-01-03
1264	301	2015-08-04
1265	356	2015-03-03
1266	391	2015-01-22
1267	365	2015-03-09
1268	301	2015-05-08
1269	367	2015-08-16
1270	391	2015-03-18
1271	384	2015-05-15
1272	302	2015-04-10
1273	322	2015-03-15
1274	368	2015-05-30
1275	376	2015-01-03
1276	400	2015-07-04
1277	342	2015-04-17
1278	382	2015-06-10
1279	334	2015-03-04
1280	311	2015-05-16
1281	327	2015-01-20
1282	330	2015-03-05
1283	302	2015-05-17
1284	320	2015-01-20
1285	357	2015-07-04
1286	393	2015-07-23
1287	316	2015-06-23
1288	318	2015-01-30
1289	386	2015-03-27
1290	346	2015-06-21
1291	388	2015-03-26
1292	373	2015-08-11
1293	378	2015-04-21
1294	395	2015-03-02
1295	317	2015-01-24
1296	388	2015-08-18
1297	385	2015-05-14
1298	364	2015-07-25
1299	334	2015-05-15
1300	354	2015-08-01
1301	347	2015-08-15
1302	362	2015-01-30
1303	375	2015-06-28
1304	303	2015-02-21
1305	335	2015-07-12
1306	342	2015-06-11
1307	369	2015-03-22
1308	390	2015-05-18
1309	387	2015-05-13
1310	392	2015-03-03
1311	354	2015-01-05
1312	342	2015-06-25
1313	320	2015-04-09
1314	323	2015-07-07
1315	381	2015-03-13
1316	311	2015-08-11
1317	367	2015-02-11
1318	335	2015-03-04
1319	334	2015-03-31
1320	301	2015-06-13
1321	383	2015-06-05
1322	312	2015-06-24
1323	336	2015-04-26
1324	397	2015-06-20
1325	367	2015-05-20
1326	308	2015-03-11
1327	362	2015-05-31
1328	390	2015-07-20
1329	377	2015-06-27
1330	380	2015-03-16
1331	329	2015-03-20
1332	379	2015-01-31
1333	361	2015-05-15
1334	330	2015-02-01
1335	311	2015-03-31
1336	374	2015-02-08
1337	393	2015-07-29
1338	374	2015-08-09
1339	375	2015-07-10
1340	338	2015-08-15
1341	384	2015-02-04
1342	367	2015-06-29
1343	378	2015-04-06
1344	330	2015-04-23
1345	325	2015-01-31
1346	349	2015-02-18
1347	367	2015-01-24
1348	323	2015-04-11
1349	316	2015-06-07
1350	400	2015-07-28
1351	325	2015-01-05
1352	327	2015-05-19
1353	358	2015-07-01
1354	305	2015-04-02
1355	348	2015-04-09
1356	322	2015-05-19
1357	364	2015-01-25
1358	340	2015-07-03
1359	316	2015-03-26
1360	319	2015-04-14
1361	333	2015-04-03
1362	311	2015-05-04
1363	349	2015-07-09
1364	311	2015-05-05
1365	340	2015-06-16
1366	334	2015-07-06
1367	370	2015-06-22
1368	348	2015-03-28
1369	365	2015-06-01
1370	370	2015-04-29
1371	307	2015-02-19
1372	333	2015-04-24
1373	372	2015-03-06
1374	365	2015-08-19
1375	347	2015-05-09
1376	340	2015-07-08
1377	363	2015-01-29
1378	302	2015-07-10
1379	371	2015-03-15
1380	351	2015-05-10
1381	313	2015-04-15
1382	388	2015-01-16
1383	375	2015-05-06
1384	323	2015-02-14
1385	338	2015-07-18
1386	340	2015-04-01
1387	368	2015-01-27
1388	399	2015-04-28
1389	337	2015-02-10
1390	345	2015-03-21
1391	332	2015-06-07
1392	338	2015-06-14
1393	356	2015-07-27
1394	322	2015-08-05
1395	369	2015-05-16
1396	333	2015-06-10
1397	315	2015-06-05
1398	355	2015-06-06
1399	380	2015-04-15
1400	318	2015-04-14
1401	368	2015-03-28
1402	336	2015-08-08
1403	351	2015-02-08
1404	318	2015-06-25
1405	342	2015-02-28
1406	346	2015-02-09
1407	386	2015-04-03
1408	390	2015-03-02
1409	306	2015-06-14
1410	324	2015-08-09
1411	328	2015-01-01
1412	380	2015-05-25
1413	373	2015-01-14
1414	375	2015-03-11
1415	342	2015-05-21
1416	351	2015-05-15
1417	352	2015-07-30
1418	347	2015-05-01
1419	368	2015-01-03
1420	399	2015-06-03
1421	331	2015-07-25
1422	397	2015-08-19
1423	337	2015-04-04
1424	353	2015-04-13
1425	352	2015-05-14
1426	392	2015-03-18
1427	345	2015-02-17
1428	376	2015-05-14
1429	318	2015-06-21
1430	309	2015-04-30
1431	318	2015-01-11
1432	361	2015-06-04
1433	370	2015-07-08
1434	360	2015-01-30
1435	393	2015-03-20
1436	341	2015-06-13
1437	360	2015-04-29
1438	367	2015-05-22
1439	386	2015-06-25
1440	376	2015-06-15
1441	382	2015-01-29
1442	306	2015-04-11
1443	355	2015-06-29
1444	333	2015-06-18
1445	309	2015-06-08
1446	322	2015-01-22
1447	353	2015-04-14
1448	377	2015-04-15
1449	360	2015-07-20
1450	350	2015-02-15
1451	331	2015-03-09
1452	325	2015-08-10
1453	361	2015-02-16
1454	344	2015-05-31
1455	306	2015-06-27
1456	400	2015-01-16
1457	353	2015-06-13
1458	324	2015-01-06
1459	329	2015-01-22
1460	347	2015-02-04
1461	321	2015-06-17
1462	371	2015-06-25
1463	376	2015-05-31
1464	399	2015-01-02
1465	355	2015-05-17
1466	394	2015-03-11
1467	322	2015-05-17
1468	304	2015-04-24
1469	351	2015-07-31
1470	391	2015-03-21
1471	328	2015-08-04
1472	362	2015-08-04
1473	343	2015-07-07
1474	344	2015-01-30
1475	328	2015-06-13
1476	305	2015-06-13
1477	371	2015-06-19
1478	357	2015-07-14
1479	343	2015-02-23
1480	362	2015-06-03
1481	338	2015-06-13
1482	387	2015-05-21
1483	317	2015-03-20
1484	375	2015-03-07
1485	309	2015-05-01
1486	314	2015-02-04
1487	303	2015-02-06
1488	393	2015-01-28
1489	379	2015-03-15
1490	310	2015-08-10
1491	348	2015-07-06
1492	308	2015-04-19
1493	307	2015-08-10
1494	356	2015-07-14
1495	302	2015-01-16
1496	348	2015-02-24
1497	340	2015-07-20
1498	320	2015-03-24
1499	388	2015-01-07
1500	342	2015-06-22
1501	386	2015-05-24
1502	381	2015-05-17
1503	336	2015-01-06
1504	380	2015-05-01
1505	356	2015-07-19
1506	399	2015-06-12
1507	361	2015-07-02
1508	369	2015-08-09
1509	352	2015-03-23
1510	387	2015-08-09
1511	327	2015-04-21
1512	396	2015-03-23
1513	354	2015-02-18
1514	367	2015-02-14
1515	306	2015-04-18
1516	324	2015-01-11
1517	344	2015-06-24
1518	314	2015-06-11
1519	320	2015-07-10
1520	388	2015-01-08
1521	396	2015-04-24
1522	394	2015-03-08
1523	328	2015-06-10
1524	325	2015-07-22
1525	333	2015-07-01
1526	345	2015-07-19
1527	345	2015-03-17
1528	313	2015-07-22
1529	339	2015-02-03
1530	364	2015-02-02
1531	357	2015-05-11
1532	345	2015-03-15
1533	347	2015-01-14
1534	343	2015-04-25
1535	335	2015-01-07
1536	302	2015-06-14
1537	305	2015-07-02
1538	374	2015-03-21
1539	304	2015-07-06
1540	314	2015-03-17
1541	379	2015-04-14
1542	339	2015-07-30
1543	338	2015-04-24
1544	318	2015-02-24
1545	390	2015-03-17
1546	387	2015-01-23
1547	334	2015-01-07
1548	340	2015-05-24
1549	351	2015-03-26
1550	376	2015-01-30
1551	349	2015-06-19
1552	379	2015-07-22
1553	395	2015-02-13
1554	347	2015-04-05
1555	309	2015-04-20
1556	371	2015-02-25
1557	400	2015-05-13
1558	319	2015-02-14
1559	379	2015-07-19
1560	354	2015-08-12
1561	341	2015-01-24
1562	358	2015-05-25
1563	358	2015-05-23
1564	324	2015-05-19
1565	304	2015-03-03
1566	316	2015-08-11
1567	311	2015-03-20
1568	325	2015-07-23
1569	317	2015-07-11
1570	340	2015-05-06
1571	350	2015-01-15
1572	337	2015-01-18
1573	381	2015-06-09
1574	302	2015-04-25
1575	366	2015-04-07
1576	376	2015-06-09
1577	312	2015-03-08
1578	363	2015-03-09
1579	340	2015-03-03
1580	342	2015-01-19
1581	374	2015-03-20
1582	368	2015-05-28
1583	333	2015-02-25
1584	376	2015-04-06
1585	349	2015-08-07
1586	330	2015-04-26
1587	396	2015-06-20
1588	372	2015-04-15
1589	400	2015-04-26
1590	321	2015-06-24
1591	320	2015-04-26
1592	325	2015-01-03
1593	363	2015-08-18
1594	369	2015-03-26
1595	367	2015-01-03
1596	335	2015-08-13
1597	319	2015-02-05
1598	337	2015-04-02
1599	347	2015-03-17
1600	386	2015-08-09
1601	341	2015-07-24
1602	306	2015-04-14
1603	397	2015-08-13
1604	341	2015-02-07
1605	343	2015-06-04
1606	379	2015-07-18
1607	305	2015-08-04
1608	397	2015-04-15
1609	325	2015-03-18
1610	397	2015-06-21
1611	389	2015-02-21
1612	350	2015-06-07
1613	375	2015-06-29
1614	325	2015-07-11
1615	302	2015-01-16
1616	337	2015-05-16
1617	325	2015-07-12
1618	400	2015-02-14
1619	303	2015-06-07
1620	354	2015-04-04
1621	327	2015-04-23
1622	384	2015-06-26
1623	383	2015-04-12
1624	339	2015-05-10
1625	317	2015-03-22
1626	325	2015-03-11
1627	374	2015-08-11
1628	387	2015-02-24
1629	344	2015-06-28
1630	348	2015-08-16
1631	333	2015-06-21
1632	322	2015-08-07
1633	396	2015-07-21
1634	301	2015-06-15
1635	372	2015-04-21
1636	375	2015-06-21
1637	373	2015-02-26
1638	367	2015-07-05
1639	321	2015-07-27
1640	348	2015-03-28
1641	344	2015-01-10
1642	310	2015-07-30
1643	337	2015-03-13
1644	348	2015-01-01
1645	399	2015-07-09
1646	346	2015-05-01
1647	314	2015-02-19
1648	338	2015-02-09
1649	363	2015-02-01
1650	365	2015-03-12
1651	313	2015-06-30
1652	350	2015-03-26
1653	318	2015-01-14
1654	335	2015-04-19
1655	322	2015-07-22
1656	304	2015-03-21
1657	376	2015-06-21
1658	374	2015-06-27
1659	361	2015-03-11
1660	329	2015-05-29
1661	374	2015-04-07
1662	321	2015-04-10
1663	335	2015-05-07
1664	314	2015-02-26
1665	316	2015-07-21
1666	369	2015-08-07
1667	379	2015-06-03
1668	322	2015-01-07
1669	368	2015-01-21
1670	371	2015-05-01
1671	331	2015-06-30
1672	391	2015-06-01
1673	318	2015-08-09
1674	330	2015-01-25
1675	353	2015-06-22
1676	340	2015-02-18
1677	356	2015-05-30
1678	318	2015-03-27
1679	327	2015-03-12
1680	309	2015-07-17
1681	399	2015-03-25
1682	329	2015-07-18
1683	330	2015-07-03
1684	342	2015-03-23
1685	366	2015-04-29
1686	357	2015-05-09
1687	365	2015-07-02
1688	338	2015-07-30
1689	386	2015-07-24
1690	335	2015-06-01
1691	400	2015-06-06
1692	323	2015-07-13
1693	354	2015-04-30
1694	378	2015-04-02
1695	301	2015-02-24
1696	351	2015-06-01
1697	302	2015-08-11
1698	349	2015-06-24
1699	304	2015-03-06
1700	333	2015-05-24
1701	319	2015-07-02
1702	333	2015-05-29
1703	309	2015-02-01
1704	342	2015-07-22
1705	325	2015-02-23
1706	326	2015-02-17
1707	368	2015-03-02
1708	305	2015-07-22
1709	308	2015-07-03
1710	322	2015-07-28
1711	383	2015-06-08
1712	361	2015-07-31
1713	323	2015-07-09
1714	330	2015-07-08
1715	338	2015-03-08
1716	396	2015-05-11
1717	308	2015-04-11
1718	347	2015-03-11
1719	318	2015-06-16
1720	336	2015-07-12
1721	308	2015-05-18
1722	348	2015-04-20
1723	370	2015-05-20
1724	373	2015-07-17
1725	352	2015-03-04
1726	371	2015-04-17
1727	384	2015-05-17
1728	315	2015-01-15
1729	393	2015-01-02
1730	308	2015-01-14
1731	378	2015-08-12
1732	354	2015-08-17
1733	328	2015-06-07
1734	331	2015-07-02
1735	373	2015-06-16
1736	396	2015-01-09
1737	352	2015-01-18
1738	360	2015-01-03
1739	352	2015-04-24
1740	307	2015-04-01
1741	343	2015-06-09
1742	324	2015-05-07
1743	334	2015-01-22
1744	347	2015-03-31
1745	309	2015-05-10
1746	396	2015-06-01
1747	358	2015-04-17
1748	362	2015-03-27
1749	334	2015-08-05
1750	340	2015-03-20
1751	342	2015-05-15
1752	336	2015-02-09
1753	339	2015-02-05
1754	393	2015-06-06
1755	304	2015-05-19
1756	323	2015-05-21
1757	366	2015-01-07
1758	315	2015-01-03
1759	368	2015-06-10
1760	308	2015-05-01
1761	356	2015-08-18
1762	385	2015-07-29
1763	395	2015-03-26
1764	378	2015-07-02
1765	324	2015-07-19
1766	319	2015-08-13
1767	383	2015-02-03
1768	317	2015-02-18
1769	391	2015-06-25
1770	312	2015-04-29
1771	372	2015-01-03
1772	326	2015-07-28
1773	305	2015-07-27
1774	370	2015-08-18
1775	303	2015-05-15
1776	387	2015-04-07
1777	371	2015-03-28
1778	355	2015-01-20
1779	373	2015-01-22
1780	380	2015-02-23
1781	393	2015-06-11
1782	394	2015-08-12
1783	334	2015-03-22
1784	357	2015-08-07
1785	315	2015-01-14
1786	392	2015-05-07
1787	354	2015-03-17
1788	386	2015-04-13
1789	395	2015-04-22
1790	308	2015-04-07
1791	390	2015-06-06
1792	344	2015-07-07
1793	350	2015-05-24
1794	353	2015-03-22
1795	348	2015-05-03
1796	365	2015-02-08
1797	372	2015-05-26
1798	307	2015-05-09
1799	302	2015-04-01
1800	326	2015-01-06
1801	400	2015-06-10
1802	368	2015-06-19
1803	388	2015-07-24
1804	395	2015-07-08
1805	319	2015-06-01
1806	346	2015-08-18
1807	327	2015-01-30
1808	377	2015-01-09
1809	306	2015-03-25
1810	371	2015-02-13
1811	364	2015-03-18
1812	316	2015-04-04
1813	344	2015-04-18
1814	376	2015-01-28
1815	301	2015-06-15
1816	382	2015-03-06
1817	337	2015-05-07
1818	313	2015-01-22
1819	329	2015-08-18
1820	382	2015-01-09
1821	339	2015-04-21
1822	381	2015-01-15
1823	350	2015-02-02
1824	369	2015-08-04
1825	370	2015-06-26
1826	318	2015-01-16
1827	347	2015-06-12
1828	360	2015-05-28
1829	400	2015-04-26
1830	338	2015-04-21
1831	309	2015-02-12
1832	379	2015-03-24
1833	327	2015-05-12
1834	322	2015-06-17
1835	330	2015-07-13
1836	381	2015-01-02
1837	372	2015-02-26
1838	337	2015-06-08
1839	321	2015-01-06
1840	314	2015-04-03
1841	304	2015-01-03
1842	359	2015-05-24
1843	395	2015-03-23
1844	336	2015-05-18
1845	306	2015-02-22
1846	381	2015-01-19
1847	322	2015-02-03
1848	394	2015-06-14
1849	382	2015-03-14
1850	343	2015-07-08
1851	399	2015-02-10
1852	308	2015-02-12
1853	316	2015-01-08
1854	329	2015-07-10
1855	398	2015-01-13
1856	343	2015-04-11
1857	318	2015-08-10
1858	375	2015-04-12
1859	368	2015-07-10
1860	340	2015-07-09
1970	323	2015-03-03
1971	354	2015-07-07
1972	378	2015-01-11
1973	337	2015-05-09
1974	358	2015-01-05
1975	320	2015-08-15
1976	342	2015-03-10
1977	376	2015-05-04
1978	328	2015-05-23
1979	304	2015-06-08
1980	310	2015-03-12
1981	327	2015-06-27
1982	339	2015-05-08
1983	362	2015-07-14
1984	314	2015-02-18
1985	339	2015-01-24
1986	343	2015-04-08
1987	325	2015-02-12
1988	354	2015-03-13
1989	369	2015-06-09
1990	324	2015-04-26
1991	301	2015-05-23
1992	330	2015-04-10
1993	355	2015-05-10
1994	310	2015-02-28
1995	391	2015-01-28
1996	377	2015-03-02
1997	326	2015-07-16
1998	303	2015-04-23
1999	390	2015-04-05
2000	332	2015-03-06
2001	339	2015-05-23
2002	314	2015-07-19
1038	322	2015-03-17
1014	330	2015-05-03
1861	320	2015-02-27
1015	312	2015-06-30
1862	313	2015-03-17
1016	393	2015-02-17
1863	352	2015-03-05
1017	320	2015-06-15
1864	348	2015-07-01
1018	327	2015-03-17
1865	316	2015-04-22
1019	385	2015-01-20
1866	303	2015-03-24
1020	302	2015-06-12
1867	364	2015-03-19
1021	340	2015-06-09
1868	311	2015-06-22
1022	385	2015-06-16
1869	360	2015-08-18
1023	314	2015-08-10
1870	316	2015-06-20
1024	347	2015-03-28
1871	369	2015-03-21
1025	392	2015-06-08
1872	384	2015-05-04
1026	323	2015-01-14
1873	321	2015-01-01
1027	361	2015-06-14
1874	325	2015-01-23
1028	375	2015-02-13
1875	336	2015-07-15
1029	301	2015-04-10
1876	368	2015-07-15
1030	384	2015-04-15
1877	385	2015-05-13
1031	302	2015-08-12
1878	382	2015-02-20
1032	353	2015-05-05
1879	365	2015-05-11
1033	355	2015-05-15
1880	372	2015-05-12
1034	334	2015-07-03
1881	374	2015-04-24
1035	317	2015-06-13
1882	363	2015-04-21
1036	359	2015-04-02
1883	301	2015-04-01
1037	310	2015-03-24
1884	301	2015-04-09
1885	346	2015-06-24
1886	302	2015-06-15
1887	383	2015-01-08
1888	363	2015-05-03
1889	396	2015-03-09
1890	339	2015-02-05
1891	369	2015-03-19
1892	382	2015-02-26
1893	387	2015-05-24
1894	309	2015-01-17
1895	321	2015-06-23
1896	338	2015-01-15
1897	327	2015-07-03
1898	368	2015-02-27
1899	317	2015-05-25
1900	390	2015-01-25
1901	399	2015-06-26
1902	349	2015-04-29
1903	317	2015-06-15
1904	377	2015-01-18
1905	357	2015-07-19
1906	359	2015-05-24
1907	345	2015-04-11
1908	396	2015-07-15
1909	328	2015-02-10
1910	367	2015-03-05
1911	393	2015-03-09
1912	357	2015-06-05
1913	308	2015-04-03
1914	323	2015-02-28
1915	361	2015-03-04
1916	371	2015-08-16
1917	364	2015-06-07
1918	399	2015-06-06
1919	304	2015-03-18
1920	303	2015-04-25
1921	319	2015-01-22
1922	390	2015-06-06
1923	384	2015-07-12
1924	339	2015-02-23
1925	311	2015-07-02
1926	347	2015-03-20
1927	327	2015-08-14
1928	372	2015-01-14
1929	366	2015-03-07
1930	339	2015-03-03
1931	302	2015-06-16
1932	374	2015-04-11
1933	380	2015-05-14
1934	389	2015-08-06
1935	359	2015-03-17
1936	356	2015-06-23
1937	354	2015-07-04
1938	385	2015-07-02
1939	394	2015-02-02
1940	366	2015-02-25
1941	310	2015-02-20
1942	378	2015-01-09
1943	360	2015-04-14
1944	399	2015-07-02
1945	391	2015-04-27
1946	313	2015-02-10
1947	353	2015-01-11
1948	302	2015-07-01
1949	303	2015-06-14
1950	309	2015-02-26
1951	351	2015-06-27
1952	307	2015-04-04
1953	389	2015-04-30
1954	334	2015-04-20
1955	307	2015-01-10
1956	381	2015-08-04
1957	367	2015-02-15
1958	391	2015-05-20
1959	373	2015-07-22
1960	361	2015-01-25
1961	340	2015-02-12
1962	368	2015-08-02
1003	356	2015-08-09
1004	354	2015-08-15
1005	320	2015-05-12
1006	393	2015-04-11
1007	399	2015-01-01
1008	363	2015-04-01
1009	339	2015-02-24
1010	356	2015-01-11
1011	339	2015-07-29
1012	375	2015-05-21
1013	349	2015-06-09
1963	323	2015-02-01
1964	374	2015-01-24
1965	374	2015-01-13
1966	311	2015-04-23
1967	396	2015-06-17
1968	382	2015-01-04
1969	362	2015-03-20
\.


--
-- TOC entry 2248 (class 0 OID 0)
-- Dependencies: 197
-- Name: store_sale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('store_sale_id_seq', 2002, true);


--
-- TOC entry 2023 (class 2606 OID 5812941)
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2029 (class 2606 OID 5812951)
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- TOC entry 2031 (class 2606 OID 5812949)
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2025 (class 2606 OID 5812939)
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2018 (class 2606 OID 5812931)
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- TOC entry 2020 (class 2606 OID 5812929)
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2040 (class 2606 OID 5812969)
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2042 (class 2606 OID 5812971)
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- TOC entry 2033 (class 2606 OID 5812959)
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2046 (class 2606 OID 5812979)
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2048 (class 2606 OID 5812981)
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- TOC entry 2036 (class 2606 OID 5812961)
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 2052 (class 2606 OID 5813037)
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2013 (class 2606 OID 5812921)
-- Name: django_content_type_app_label_45f3b1d93ec8c61c_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_45f3b1d93ec8c61c_uniq UNIQUE (app_label, model);


--
-- TOC entry 2015 (class 2606 OID 5812919)
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2011 (class 2606 OID 5812911)
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2055 (class 2606 OID 5813057)
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2058 (class 2606 OID 5813067)
-- Name: store_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY store_customer
    ADD CONSTRAINT store_customer_pkey PRIMARY KEY (id);


--
-- TOC entry 2062 (class 2606 OID 5813075)
-- Name: store_lineitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY store_lineitem
    ADD CONSTRAINT store_lineitem_pkey PRIMARY KEY (id);


--
-- TOC entry 2064 (class 2606 OID 5813083)
-- Name: store_product_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY store_product
    ADD CONSTRAINT store_product_pkey PRIMARY KEY (id);


--
-- TOC entry 2067 (class 2606 OID 5813091)
-- Name: store_sale_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY store_sale
    ADD CONSTRAINT store_sale_pkey PRIMARY KEY (id);


--
-- TOC entry 2021 (class 1259 OID 5812988)
-- Name: auth_group_name_253ae2a6331666e8_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_name_253ae2a6331666e8_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 2026 (class 1259 OID 5812999)
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- TOC entry 2027 (class 1259 OID 5813000)
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2016 (class 1259 OID 5812987)
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- TOC entry 2037 (class 1259 OID 5813013)
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- TOC entry 2038 (class 1259 OID 5813012)
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- TOC entry 2043 (class 1259 OID 5813025)
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 2044 (class 1259 OID 5813024)
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 2034 (class 1259 OID 5813001)
-- Name: auth_user_username_51b3b110094b8aae_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_username_51b3b110094b8aae_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 2049 (class 1259 OID 5813048)
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- TOC entry 2050 (class 1259 OID 5813049)
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- TOC entry 2053 (class 1259 OID 5813058)
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- TOC entry 2056 (class 1259 OID 5813059)
-- Name: django_session_session_key_461cfeaa630ca218_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_session_key_461cfeaa630ca218_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 2059 (class 1259 OID 5813104)
-- Name: store_lineitem_2506e0ba; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX store_lineitem_2506e0ba ON store_lineitem USING btree (sale_id);


--
-- TOC entry 2060 (class 1259 OID 5813098)
-- Name: store_lineitem_9bea82de; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX store_lineitem_9bea82de ON store_lineitem USING btree (product_id);


--
-- TOC entry 2065 (class 1259 OID 5813097)
-- Name: store_sale_cb24373b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX store_sale_cb24373b ON store_sale USING btree (customer_id);


--
-- TOC entry 2068 (class 2606 OID 5812982)
-- Name: auth_content_type_id_508cf46651277a81_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_content_type_id_508cf46651277a81_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2069 (class 2606 OID 5812989)
-- Name: auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2070 (class 2606 OID 5812994)
-- Name: auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2074 (class 2606 OID 5813019)
-- Name: auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2072 (class 2606 OID 5813007)
-- Name: auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2071 (class 2606 OID 5813002)
-- Name: auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2073 (class 2606 OID 5813014)
-- Name: auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2075 (class 2606 OID 5813038)
-- Name: djan_content_type_id_697914295151027a_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT djan_content_type_id_697914295151027a_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2076 (class 2606 OID 5813043)
-- Name: django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2077 (class 2606 OID 5813099)
-- Name: store_lineitem_product_id_263906ac53be001_fk_store_product_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY store_lineitem
    ADD CONSTRAINT store_lineitem_product_id_263906ac53be001_fk_store_product_id FOREIGN KEY (product_id) REFERENCES store_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2078 (class 2606 OID 5813105)
-- Name: store_lineitem_sale_id_7567fd6823ae08bc_fk_store_sale_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY store_lineitem
    ADD CONSTRAINT store_lineitem_sale_id_7567fd6823ae08bc_fk_store_sale_id FOREIGN KEY (sale_id) REFERENCES store_sale(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2079 (class 2606 OID 5813092)
-- Name: store_sale_customer_id_32d7c0219dcf036d_fk_store_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY store_sale
    ADD CONSTRAINT store_sale_customer_id_32d7c0219dcf036d_fk_store_customer_id FOREIGN KEY (customer_id) REFERENCES store_customer(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2015-11-09 10:20:43 EST

--
-- PostgreSQL database dump complete
--

