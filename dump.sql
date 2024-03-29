--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

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
-- Name: appointments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.appointments (
    id bigint NOT NULL,
    start_time timestamp(6) without time zone,
    end_time timestamp(6) without time zone,
    meeting_link character varying,
    status integer,
    description character varying,
    mentor_id bigint NOT NULL,
    user_id bigint NOT NULL,
    payment_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.appointments OWNER TO postgres;

--
-- Name: appointments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.appointments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appointments_id_seq OWNER TO postgres;

--
-- Name: appointments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.appointments_id_seq OWNED BY public.appointments.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO postgres;

--
-- Name: availabilities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.availabilities (
    id bigint NOT NULL,
    mentor_id bigint NOT NULL,
    day character varying,
    start_time timestamp(6) without time zone,
    end_time timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    month integer,
    year integer,
    status integer
);


ALTER TABLE public.availabilities OWNER TO postgres;

--
-- Name: availabilities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.availabilities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.availabilities_id_seq OWNER TO postgres;

--
-- Name: availabilities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.availabilities_id_seq OWNED BY public.availabilities.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: conversations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conversations (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    mentor_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.conversations OWNER TO postgres;

--
-- Name: conversations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.conversations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conversations_id_seq OWNER TO postgres;

--
-- Name: conversations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.conversations_id_seq OWNED BY public.conversations.id;


--
-- Name: jwt_denylist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jwt_denylist (
    id bigint NOT NULL,
    jti character varying NOT NULL,
    exp timestamp(6) without time zone NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.jwt_denylist OWNER TO postgres;

--
-- Name: jwt_denylist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jwt_denylist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jwt_denylist_id_seq OWNER TO postgres;

--
-- Name: jwt_denylist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jwt_denylist_id_seq OWNED BY public.jwt_denylist.id;


--
-- Name: mentors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mentors (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    first_name character varying,
    last_name character varying,
    occupation character varying,
    subject_id bigint NOT NULL
);


ALTER TABLE public.mentors OWNER TO postgres;

--
-- Name: mentors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mentors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mentors_id_seq OWNER TO postgres;

--
-- Name: mentors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mentors_id_seq OWNED BY public.mentors.id;


--
-- Name: mentors_subjects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mentors_subjects (
    mentor_id bigint NOT NULL,
    subject_id bigint NOT NULL
);


ALTER TABLE public.mentors_subjects OWNER TO postgres;

--
-- Name: oauth_access_grants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_access_grants (
    id bigint NOT NULL,
    resource_owner_id bigint NOT NULL,
    application_id bigint NOT NULL,
    token character varying NOT NULL,
    expires_in integer NOT NULL,
    redirect_uri text NOT NULL,
    scopes character varying DEFAULT ''::character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    revoked_at timestamp(6) without time zone
);


ALTER TABLE public.oauth_access_grants OWNER TO postgres;

--
-- Name: oauth_access_grants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth_access_grants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth_access_grants_id_seq OWNER TO postgres;

--
-- Name: oauth_access_grants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oauth_access_grants_id_seq OWNED BY public.oauth_access_grants.id;


--
-- Name: oauth_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_access_tokens (
    id bigint NOT NULL,
    resource_owner_id bigint,
    application_id bigint NOT NULL,
    token character varying NOT NULL,
    refresh_token character varying,
    expires_in integer,
    scopes character varying,
    created_at timestamp(6) without time zone NOT NULL,
    revoked_at timestamp(6) without time zone,
    previous_refresh_token character varying DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.oauth_access_tokens OWNER TO postgres;

--
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth_access_tokens_id_seq OWNER TO postgres;

--
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oauth_access_tokens_id_seq OWNED BY public.oauth_access_tokens.id;


--
-- Name: oauth_applications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_applications (
    id bigint NOT NULL,
    name character varying NOT NULL,
    uid character varying NOT NULL,
    secret character varying NOT NULL,
    redirect_uri text NOT NULL,
    scopes character varying DEFAULT ''::character varying NOT NULL,
    confidential boolean DEFAULT true NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.oauth_applications OWNER TO postgres;

--
-- Name: oauth_applications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth_applications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth_applications_id_seq OWNER TO postgres;

--
-- Name: oauth_applications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oauth_applications_id_seq OWNED BY public.oauth_applications.id;


--
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    id bigint NOT NULL,
    paid_at timestamp(6) without time zone,
    status integer,
    sum double precision,
    user_id bigint NOT NULL,
    mentor_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payments_id_seq OWNER TO postgres;

--
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payments_id_seq OWNED BY public.payments.id;


--
-- Name: personal_messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_messages (
    id bigint NOT NULL,
    content text,
    sent_at timestamp(6) without time zone,
    user_id bigint NOT NULL,
    mentor_id bigint NOT NULL,
    conversation_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.personal_messages OWNER TO postgres;

--
-- Name: personal_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_messages_id_seq OWNER TO postgres;

--
-- Name: personal_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_messages_id_seq OWNED BY public.personal_messages.id;


--
-- Name: prices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prices (
    id bigint NOT NULL,
    amount double precision,
    subject_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.prices OWNER TO postgres;

--
-- Name: prices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prices_id_seq OWNER TO postgres;

--
-- Name: prices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prices_id_seq OWNED BY public.prices.id;


--
-- Name: ratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ratings (
    id bigint NOT NULL,
    rating double precision,
    review character varying,
    user_id bigint NOT NULL,
    mentor_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ratings OWNER TO postgres;

--
-- Name: ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ratings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ratings_id_seq OWNER TO postgres;

--
-- Name: ratings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ratings_id_seq OWNED BY public.ratings.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: subjects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subjects (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    category_id bigint
);


ALTER TABLE public.subjects OWNER TO postgres;

--
-- Name: subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subjects_id_seq OWNER TO postgres;

--
-- Name: subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subjects_id_seq OWNED BY public.subjects.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    role integer DEFAULT 0,
    first_name character varying,
    last_name character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: appointments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments ALTER COLUMN id SET DEFAULT nextval('public.appointments_id_seq'::regclass);


--
-- Name: availabilities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.availabilities ALTER COLUMN id SET DEFAULT nextval('public.availabilities_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: conversations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conversations ALTER COLUMN id SET DEFAULT nextval('public.conversations_id_seq'::regclass);


--
-- Name: jwt_denylist id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jwt_denylist ALTER COLUMN id SET DEFAULT nextval('public.jwt_denylist_id_seq'::regclass);


--
-- Name: mentors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mentors ALTER COLUMN id SET DEFAULT nextval('public.mentors_id_seq'::regclass);


--
-- Name: oauth_access_grants id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_access_grants ALTER COLUMN id SET DEFAULT nextval('public.oauth_access_grants_id_seq'::regclass);


--
-- Name: oauth_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.oauth_access_tokens_id_seq'::regclass);


--
-- Name: oauth_applications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_applications ALTER COLUMN id SET DEFAULT nextval('public.oauth_applications_id_seq'::regclass);


--
-- Name: payments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);


--
-- Name: personal_messages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_messages ALTER COLUMN id SET DEFAULT nextval('public.personal_messages_id_seq'::regclass);


--
-- Name: prices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prices ALTER COLUMN id SET DEFAULT nextval('public.prices_id_seq'::regclass);


--
-- Name: ratings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings ALTER COLUMN id SET DEFAULT nextval('public.ratings_id_seq'::regclass);


--
-- Name: subjects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects ALTER COLUMN id SET DEFAULT nextval('public.subjects_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.appointments (id, start_time, end_time, meeting_link, status, description, mentor_id, user_id, payment_id, created_at, updated_at) FROM stdin;
1	2023-07-07 15:23:38.901839	2023-07-07 16:23:38.901839	/GptsUpmNnRl9y2SuUJRWmw	1	A psychics lesson for admin	3	3	2	2023-07-10 17:18:51.142021	2023-07-10 17:18:51.142021
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2023-06-18 14:59:53.983643	2023-06-18 14:59:53.983643
\.


--
-- Data for Name: availabilities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.availabilities (id, mentor_id, day, start_time, end_time, created_at, updated_at, month, year, status) FROM stdin;
1	3	4	2023-07-04 16:00:00	2023-07-04 17:00:00	2023-07-04 16:29:15.443215	2023-07-04 16:29:15.443215	0	2023	0
2	3	7	2023-07-04 16:00:00	2023-07-04 17:00:00	2023-07-04 16:29:56.319182	2023-07-04 16:29:56.319182	7	2023	0
3	3	7	2023-07-10 16:00:00	2023-07-10 17:00:00	2023-07-10 17:12:43.828155	2023-07-10 17:12:43.828155	7	2023	0
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name, created_at, updated_at) FROM stdin;
1	Mathematics	2023-06-18 15:02:02.58957	2023-06-18 15:02:02.58957
2	Physics	2023-06-18 15:02:02.593733	2023-06-18 15:02:02.593733
3	Chemistry	2023-06-18 15:02:02.59676	2023-06-18 15:02:02.59676
4	Biology	2023-06-18 15:02:02.600527	2023-06-18 15:02:02.600527
5	Computer Science	2023-06-18 15:02:02.603781	2023-06-18 15:02:02.603781
\.


--
-- Data for Name: conversations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.conversations (id, user_id, mentor_id, created_at, updated_at) FROM stdin;
11	10	3	2023-07-01 16:07:19.045392	2023-07-01 16:07:19.045392
12	3	3	2023-07-08 11:55:50.827922	2023-07-08 11:55:50.827922
17	11	3	2023-07-10 17:23:23.175056	2023-07-10 17:23:23.175056
18	11	2	2023-07-10 18:01:03.356009	2023-07-10 18:01:03.356009
\.


--
-- Data for Name: jwt_denylist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jwt_denylist (id, jti, exp, created_at, updated_at) FROM stdin;
1	19b0f14d-2f0a-4201-873a-89ea67251537	2023-07-06 13:40:29	2023-06-21 14:31:09.601179	2023-06-21 14:31:09.601179
2	d462538d-b0c8-4d06-829f-5219f52d64ba	2023-07-06 14:36:09	2023-06-21 14:36:40.302856	2023-06-21 14:36:40.302856
3	ef0926f6-c479-4418-86a6-79879a7b5f2b	2023-07-06 14:46:49	2023-06-21 14:51:23.613007	2023-06-21 14:51:23.613007
4	ca245979-0405-442f-84e0-8d1d099cc647	2023-07-06 14:59:20	2023-06-21 18:06:35.766623	2023-06-21 18:06:35.766623
5	eb492464-7201-4305-aa2b-2f91da045431	2023-07-06 18:07:10	2023-06-21 18:09:57.62733	2023-06-21 18:09:57.62733
6	090b1351-2c75-4487-b2f0-9f198e581266	2023-07-06 18:10:02	2023-06-21 18:22:04.430065	2023-06-21 18:22:04.430065
7	fdfbe29f-493b-4415-9bd3-9dfc1fe7d4b6	2023-07-06 18:23:29	2023-06-21 19:01:10.908318	2023-06-21 19:01:10.908318
8	451f2df2-0618-4956-bb90-be98edfb844d	2023-07-06 19:01:56	2023-06-21 19:03:36.42395	2023-06-21 19:03:36.42395
9	ffa54ac9-db18-4b02-ab08-26274b786990	2023-07-06 19:03:49	2023-06-21 19:13:48.06075	2023-06-21 19:13:48.06075
10	31d82e6c-c733-4180-bc9d-dec4826f10be	2023-07-07 14:29:32	2023-06-22 14:31:52.498977	2023-06-22 14:31:52.498977
11	c03e4113-c260-4ec7-94c5-81a128385eab	2023-07-07 14:31:57	2023-06-22 18:58:37.838998	2023-06-22 18:58:37.838998
12	82217103-c63b-4f3f-976b-bf25b46859c5	2023-07-07 19:39:03	2023-06-22 19:55:34.446157	2023-06-22 19:55:34.446157
13	b78aa9f5-8741-4512-a28b-797c36692805	2023-07-07 20:10:05	2023-06-22 20:14:01.625409	2023-06-22 20:14:01.625409
14	08e04ea2-ad26-4bbe-9c89-f19813772294	2023-07-07 20:15:03	2023-06-22 20:16:19.497554	2023-06-22 20:16:19.497554
15	50216b5d-c11d-4cc2-bea3-4332cfdf1121	2023-07-07 20:16:49	2023-06-22 20:26:40.598911	2023-06-22 20:26:40.598911
16	0cd2ebca-d52e-45ea-9527-387f85710459	2023-07-07 20:28:13	2023-06-22 20:29:26.547614	2023-06-22 20:29:26.547614
17	9d724ae2-a5be-4e1c-ba3a-dad690688a65	2023-07-07 20:29:55	2023-06-22 20:31:00.425496	2023-06-22 20:31:00.425496
18	2cd1c2d5-ce7d-460f-b91a-59d410e8c367	2023-07-08 11:32:55	2023-06-23 11:47:53.493485	2023-06-23 11:47:53.493485
19	36438f7a-d707-4349-b9d1-bc40a6825d11	2023-07-08 12:21:36	2023-06-23 12:22:04.180387	2023-06-23 12:22:04.180387
20	c3cfe72a-983d-4956-9940-7bc212ea545e	2023-07-08 12:22:11	2023-06-23 12:23:18.85151	2023-06-23 12:23:18.85151
21	498bb309-ef43-4766-88a8-14847182f8c9	2023-07-12 11:58:25	2023-06-27 12:02:22.733953	2023-06-27 12:02:22.733953
22	ec209cb9-f8f1-479d-abe5-df4b5727380a	2023-07-13 11:02:53	2023-06-28 15:31:34.286648	2023-06-28 15:31:34.286648
23	1cd3648d-37a5-4237-a2fd-a55cfb33f701	2023-07-13 16:35:06	2023-06-28 16:36:19.531032	2023-06-28 16:36:19.531032
24	98f60266-3823-4045-9638-92dafb85ac23	2023-07-13 16:38:44	2023-06-28 16:39:28.342194	2023-06-28 16:39:28.342194
25	7e903785-b7c3-4769-afcc-49e2e92ab2a9	2023-07-13 17:48:30	2023-06-28 17:49:10.111891	2023-06-28 17:49:10.111891
26	d1dab1bb-7eb3-4485-b980-3a2874561b5d	2023-07-14 11:34:43	2023-06-29 11:39:29.988128	2023-06-29 11:39:29.988128
27	83cbfe15-0ec7-415d-898d-3c2eb9ff1d28	2023-07-16 12:23:45	2023-07-01 13:01:23.499693	2023-07-01 13:01:23.499693
28	bdd59f7c-c5ed-4239-a419-bf87c03627f6	2023-07-16 13:01:34	2023-07-01 13:27:58.133379	2023-07-01 13:27:58.133379
29	f9eb12a0-49be-4beb-a188-a76ee697c59b	2023-07-16 13:52:02	2023-07-01 14:54:06.516914	2023-07-01 14:54:06.516914
30	503fd770-fb0c-477e-90ab-ce4fc332c179	2023-07-16 14:54:11	2023-07-01 14:56:07.325162	2023-07-01 14:56:07.325162
31	34985d9b-15ba-4af4-a539-ba370a78e84c	2023-07-16 16:05:12	2023-07-01 16:05:41.671407	2023-07-01 16:05:41.671407
32	bd8fa7c9-db5d-4042-b74f-a370ad9cd4c3	2023-07-19 15:40:31	2023-07-04 15:42:20.467502	2023-07-04 15:42:20.467502
33	71fa40d8-bef6-4af4-881e-305cddd4d099	2023-07-19 15:43:34	2023-07-04 15:52:25.221589	2023-07-04 15:52:25.221589
34	13edd488-1595-4b67-ab98-70304f1b2c4d	2023-07-19 15:54:32	2023-07-04 15:56:53.857052	2023-07-04 15:56:53.857052
35	fe83189f-f0c6-4e6b-8ae1-464141abb70d	2023-07-19 15:59:10	2023-07-04 15:59:42.728721	2023-07-04 15:59:42.728721
36	029b33da-ba36-409e-acf7-155aad11b02d	2023-07-19 15:59:54	2023-07-04 16:01:49.831086	2023-07-04 16:01:49.831086
37	b870a189-a012-4040-beb1-2410a1d32fdb	2023-07-19 16:01:55	2023-07-04 16:11:05.7223	2023-07-04 16:11:05.7223
38	8def60c9-46a0-4c8f-b5a2-09d40b80e1e7	2023-07-19 16:12:25	2023-07-04 16:19:48.471671	2023-07-04 16:19:48.471671
39	d173b278-db93-4877-b411-1ac0f464ffac	2023-07-19 16:19:54	2023-07-04 17:36:32.304499	2023-07-04 17:36:32.304499
40	1c6a0ef0-c147-4bd9-8a61-f87be7fe93ca	2023-07-19 17:37:09	2023-07-04 17:37:35.168888	2023-07-04 17:37:35.168888
41	71370bba-292b-4b8a-8966-d3b05f8cb480	2023-07-23 10:05:08	2023-07-08 11:52:27.116115	2023-07-08 11:52:27.116115
42	1b810dd1-2d16-4276-8469-dc7b4f9bdfc6	2023-07-24 15:57:21	2023-07-09 15:58:32.25959	2023-07-09 15:58:32.25959
43	da562b4b-1fc8-4d82-8744-9ab61ef7ebc9	2023-07-25 17:12:11	2023-07-10 17:19:44.330221	2023-07-10 17:19:44.330221
44	3209f29f-dba9-457a-b93f-23f16e66c62c	2023-07-25 17:19:57	2023-07-10 18:11:26.785676	2023-07-10 18:11:26.785676
\.


--
-- Data for Name: mentors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mentors (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at, first_name, last_name, occupation, subject_id) FROM stdin;
2	baker@gmail.com	$2a$12$PQh4Lb1PU/MjYY6vuOzNmOgBqKM9vnoKJUfHbMGlIF8ghaR6UoUTm	\N	\N	\N	2023-06-21 18:39:34.27292	2023-06-21 18:39:34.27292	Sunny	Baker	Cell Biologist	21
3	randy@gmail.com	$2a$12$aklE.Qbk6mVKG5JPbeGLi.Tmu5tXRSHEH6i4gr7uM0Hzu8ZyX48py	\N	\N	\N	2023-06-21 18:39:34.471111	2023-06-21 18:39:34.471111	Maria	Randy	Thermodynamics Scientist	16
8	michaeldonovan@example.com	$2a$12$WCvqPbb4aRYIdP8sJkdafurqk.ZP6iTmg14cz3JX97/buqu3xCGAu	\N	\N	\N	2023-06-28 18:17:04.874664	2023-06-28 18:17:04.874664	Michael	Donovan	Data Structures & Algorithms Teacher	37
\.


--
-- Data for Name: mentors_subjects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mentors_subjects (mentor_id, subject_id) FROM stdin;
\.


--
-- Data for Name: oauth_access_grants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth_access_grants (id, resource_owner_id, application_id, token, expires_in, redirect_uri, scopes, created_at, revoked_at) FROM stdin;
\.


--
-- Data for Name: oauth_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth_access_tokens (id, resource_owner_id, application_id, token, refresh_token, expires_in, scopes, created_at, revoked_at, previous_refresh_token) FROM stdin;
\.


--
-- Data for Name: oauth_applications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth_applications (id, name, uid, secret, redirect_uri, scopes, confidential, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (id, paid_at, status, sum, user_id, mentor_id, created_at, updated_at) FROM stdin;
2	2023-07-10 17:18:39.081014	1	33.3	3	3	2023-07-10 17:18:39.083421	2023-07-10 17:18:39.083421
\.


--
-- Data for Name: personal_messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_messages (id, content, sent_at, user_id, mentor_id, conversation_id, created_at, updated_at) FROM stdin;
5	Hi. Can I have a lesson with you?	2023-07-08 17:37:05.717702	3	3	12	2023-07-08 14:18:28.208799	2023-07-08 14:18:28.208799
6	Hi. Can I have a lesson with you?	2023-07-08 17:37:05.717702	3	2	18	2023-07-10 18:01:24.195341	2023-07-10 18:01:24.195341
\.


--
-- Data for Name: prices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prices (id, amount, subject_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ratings (id, rating, review, user_id, mentor_id, created_at, updated_at) FROM stdin;
1	4	A great thermodynamics teacher!!!	5	3	2023-06-23 17:05:52.047455	2023-06-23 17:05:52.047455
2	4	A great thermodynamics teacher!!!	3	3	2023-06-27 13:25:08.266038	2023-06-27 13:25:08.266038
3	4	A great thermodynamics teacher!!!	3	3	2023-06-27 13:25:08.33139	2023-06-27 13:25:08.33139
4	4	A great thermodynamics teacher!!!	3	3	2023-06-27 13:25:57.918353	2023-06-27 13:25:57.918353
5	5	A great thermodynamics teacher!!!	3	3	2023-06-27 13:29:57.922435	2023-06-27 13:29:57.922435
6	5	A great cell biology teacher!!!	3	2	2023-06-27 13:30:44.222088	2023-06-27 13:30:44.222088
7	4.5	A great thermodynamics teacher!!!	10	3	2023-07-04 17:38:25.77857	2023-07-04 17:38:25.77857
8	4.5	A great thermodynamics teacher!!!	11	3	2023-07-10 17:21:13.850926	2023-07-10 17:21:13.850926
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version) FROM stdin;
20230508080821
20230508081348
20230508084451
20230508101203
20230508104204
20230524102528
20230524102724
20230525113128
20230525200115
20230525200353
20230531191559
20230531191922
20230531194000
20230531194503
20230531195856
20230531204605
20230531204916
20230531205043
20230531210922
20230604145626
20230531204322
20230628134436
20230628134835
20230628135217
20230701120211
20230629132334
20230701152449
20230701162539
20230707145117
20230710142322
20230710150621
\.


--
-- Data for Name: subjects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subjects (id, name, created_at, updated_at, category_id) FROM stdin;
1	Algebra	2023-06-21 13:12:23.896889	2023-06-21 13:12:23.896889	1
12	Differential Equations	2023-06-21 16:25:54.994065	2023-06-21 16:25:54.994065	1
13	Calculus	2023-06-21 16:33:43.750297	2023-06-21 16:33:43.750297	1
14	Probability and Statistics	2023-06-21 18:09:10.106687	2023-06-21 18:09:10.106687	1
15	Classical Mechanics	2023-06-21 18:25:45.352377	2023-06-21 18:25:45.352377	2
16	Thermodynamics	2023-06-21 18:25:59.803045	2023-06-21 18:25:59.803045	2
17	Optics	2023-06-21 18:26:11.75382	2023-06-21 18:26:11.75382	2
18	General Chemistry	2023-06-21 18:26:46.4009	2023-06-21 18:26:46.4009	3
19	Organic Chemistry	2023-06-21 18:27:03.454847	2023-06-21 18:27:03.454847	3
20	Analytical Chemistry	2023-06-21 18:27:14.821994	2023-06-21 18:27:14.821994	3
21	Cell Biology	2023-06-21 18:29:44.609501	2023-06-21 18:29:44.609501	4
22	Genetics	2023-06-21 18:29:57.296849	2023-06-21 18:29:57.296849	4
23	Anatomy	2023-06-21 18:30:03.232297	2023-06-21 18:30:03.232297	4
24	Web Development	2023-06-21 18:30:49.714966	2023-06-21 18:30:49.714966	5
25	Applied Mathematics	2023-06-21 18:31:27.80545	2023-06-21 18:31:27.80545	5
26	Computer systems	2023-06-21 18:32:22.917497	2023-06-21 18:32:22.917497	5
28	Marine biology	2023-06-21 19:02:53.613038	2023-06-21 19:02:53.613038	4
27	Artificial Intelligence	2023-06-21 18:32:54.614631	2023-06-21 19:14:24.594621	5
29	Marine biology	2023-06-22 19:41:18.090476	2023-06-22 19:41:18.090476	4
30	Marine biology	2023-06-22 19:44:41.35489	2023-06-22 19:44:41.35489	4
33	Marine BBiology	2023-06-22 19:49:49.573937	2023-06-22 19:49:49.573937	4
36	Marine xiology	2023-06-27 12:43:23.764569	2023-06-27 12:43:23.764569	4
37	Data Structures & Algorithms	2023-06-27 13:42:31.211374	2023-06-27 13:42:31.211374	5
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at, role, first_name, last_name) FROM stdin;
3	valcat552@gmail.com	$2a$12$xQKGNwbHceH3IIfu7IZuGebhJnoepigdCAzWXf.po7cVIQxSfmX46	\N	\N	\N	2023-06-21 13:38:39.878737	2023-06-21 13:38:39.878737	1	Ari	Sof
4	all@gmail.com	$2a$12$gJYZsQr04.bS6dMn0aNWm.mhWxcWmw20gny9AAd3iVDdNeEaTQVIy	\N	\N	\N	2023-06-21 13:38:40.069046	2023-06-21 13:38:40.069046	0	All	Jackson
5	billyjean@gmail.com	$2a$12$ZvZXHvJYgPQAqmJ4qv.XLOrkm7L7.r7Vd8epdvHHp83VrWQ800lV2	\N	\N	\N	2023-06-23 12:12:46.029006	2023-06-23 12:12:46.029006	0	Billy	Jean
6	funny@example.com	$2a$12$yO2WUYkoJ5lv2Y/BNT1KpOwC3an/g.GeCcn5mop440K3BOP0lLkyi	\N	\N	\N	2023-06-27 14:47:40.682762	2023-06-27 14:47:40.682762	0	Sue	Funny
8	johnmiesak@example.com	$2a$12$agsL2wedGUQLZRUxDQEJ..SpsFV5Yezh9oFH6iOv0If8o8.0s1jnK	\N	\N	\N	2023-06-27 14:48:50.109762	2023-06-27 14:48:50.109762	0	John	Miesak
9	lairamiesak@example.com	$2a$12$kqVLnUKYf6Ikme/2b28XhO5MhWKWm1EdTCRx0j4UUUK3McJM1c3Om	\N	\N	\N	2023-06-27 15:39:39.142016	2023-06-27 15:39:39.142016	0	Laira	Miesak
10	kessa@example.com	$2a$12$p1.ystqvFT0/jRDrqv2mc.onjzyWwoTlZwu2e3nSm9F8tZPYQAtfS	\N	\N	\N	2023-06-27 15:40:36.015658	2023-06-27 15:40:36.015658	0	Laira	Kessa
11	cuke@example.com	$2a$12$Us7nVWwFle1TAsRK5X9DwOFjqEJi4O40FtIHX5nG/69hVt2YnC0FS	\N	\N	\N	2023-06-28 17:58:00.398417	2023-06-28 17:58:00.398417	0	Miley	Cuke
\.


--
-- Name: appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appointments_id_seq', 1, true);


--
-- Name: availabilities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.availabilities_id_seq', 3, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 5, true);


--
-- Name: conversations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.conversations_id_seq', 18, true);


--
-- Name: jwt_denylist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jwt_denylist_id_seq', 44, true);


--
-- Name: mentors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mentors_id_seq', 9, true);


--
-- Name: oauth_access_grants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth_access_grants_id_seq', 1, false);


--
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth_access_tokens_id_seq', 1, false);


--
-- Name: oauth_applications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth_applications_id_seq', 1, false);


--
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_id_seq', 2, true);


--
-- Name: personal_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_messages_id_seq', 6, true);


--
-- Name: prices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prices_id_seq', 1, false);


--
-- Name: ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ratings_id_seq', 8, true);


--
-- Name: subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subjects_id_seq', 37, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 11, true);


--
-- Name: appointments appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: availabilities availabilities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.availabilities
    ADD CONSTRAINT availabilities_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: conversations conversations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conversations
    ADD CONSTRAINT conversations_pkey PRIMARY KEY (id);


--
-- Name: jwt_denylist jwt_denylist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jwt_denylist
    ADD CONSTRAINT jwt_denylist_pkey PRIMARY KEY (id);


--
-- Name: mentors mentors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mentors
    ADD CONSTRAINT mentors_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_grants oauth_access_grants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_access_grants
    ADD CONSTRAINT oauth_access_grants_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_tokens oauth_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_access_tokens
    ADD CONSTRAINT oauth_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: oauth_applications oauth_applications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_applications
    ADD CONSTRAINT oauth_applications_pkey PRIMARY KEY (id);


--
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- Name: personal_messages personal_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_messages
    ADD CONSTRAINT personal_messages_pkey PRIMARY KEY (id);


--
-- Name: prices prices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prices
    ADD CONSTRAINT prices_pkey PRIMARY KEY (id);


--
-- Name: ratings ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: subjects subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_appointments_on_mentor_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_appointments_on_mentor_id ON public.appointments USING btree (mentor_id);


--
-- Name: index_appointments_on_payment_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_appointments_on_payment_id ON public.appointments USING btree (payment_id);


--
-- Name: index_appointments_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_appointments_on_user_id ON public.appointments USING btree (user_id);


--
-- Name: index_availabilities_on_mentor_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_availabilities_on_mentor_id ON public.availabilities USING btree (mentor_id);


--
-- Name: index_conversations_on_mentor_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_conversations_on_mentor_id ON public.conversations USING btree (mentor_id);


--
-- Name: index_conversations_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_conversations_on_user_id ON public.conversations USING btree (user_id);


--
-- Name: index_jwt_denylist_on_jti; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_jwt_denylist_on_jti ON public.jwt_denylist USING btree (jti);


--
-- Name: index_mentors_on_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_mentors_on_email ON public.mentors USING btree (email);


--
-- Name: index_mentors_on_reset_password_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_mentors_on_reset_password_token ON public.mentors USING btree (reset_password_token);


--
-- Name: index_mentors_on_subject_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_mentors_on_subject_id ON public.mentors USING btree (subject_id);


--
-- Name: index_mentors_subjects_on_mentor_id_and_subject_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_mentors_subjects_on_mentor_id_and_subject_id ON public.mentors_subjects USING btree (mentor_id, subject_id);


--
-- Name: index_mentors_subjects_on_subject_id_and_mentor_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_mentors_subjects_on_subject_id_and_mentor_id ON public.mentors_subjects USING btree (subject_id, mentor_id);


--
-- Name: index_oauth_access_grants_on_application_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_oauth_access_grants_on_application_id ON public.oauth_access_grants USING btree (application_id);


--
-- Name: index_oauth_access_grants_on_resource_owner_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_oauth_access_grants_on_resource_owner_id ON public.oauth_access_grants USING btree (resource_owner_id);


--
-- Name: index_oauth_access_grants_on_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_oauth_access_grants_on_token ON public.oauth_access_grants USING btree (token);


--
-- Name: index_oauth_access_tokens_on_application_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_oauth_access_tokens_on_application_id ON public.oauth_access_tokens USING btree (application_id);


--
-- Name: index_oauth_access_tokens_on_refresh_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_oauth_access_tokens_on_refresh_token ON public.oauth_access_tokens USING btree (refresh_token);


--
-- Name: index_oauth_access_tokens_on_resource_owner_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_oauth_access_tokens_on_resource_owner_id ON public.oauth_access_tokens USING btree (resource_owner_id);


--
-- Name: index_oauth_access_tokens_on_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_oauth_access_tokens_on_token ON public.oauth_access_tokens USING btree (token);


--
-- Name: index_oauth_applications_on_uid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_oauth_applications_on_uid ON public.oauth_applications USING btree (uid);


--
-- Name: index_payments_on_mentor_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_payments_on_mentor_id ON public.payments USING btree (mentor_id);


--
-- Name: index_payments_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_payments_on_user_id ON public.payments USING btree (user_id);


--
-- Name: index_personal_messages_on_conversation_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_personal_messages_on_conversation_id ON public.personal_messages USING btree (conversation_id);


--
-- Name: index_personal_messages_on_mentor_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_personal_messages_on_mentor_id ON public.personal_messages USING btree (mentor_id);


--
-- Name: index_personal_messages_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_personal_messages_on_user_id ON public.personal_messages USING btree (user_id);


--
-- Name: index_prices_on_subject_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_prices_on_subject_id ON public.prices USING btree (subject_id);


--
-- Name: index_ratings_on_mentor_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_ratings_on_mentor_id ON public.ratings USING btree (mentor_id);


--
-- Name: index_ratings_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_ratings_on_user_id ON public.ratings USING btree (user_id);


--
-- Name: index_subjects_on_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_subjects_on_category_id ON public.subjects USING btree (category_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: payments fk_rails_081dc04a02; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT fk_rails_081dc04a02 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: personal_messages fk_rails_1250fcec6d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_messages
    ADD CONSTRAINT fk_rails_1250fcec6d FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: personal_messages fk_rails_41ff46a8ff; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_messages
    ADD CONSTRAINT fk_rails_41ff46a8ff FOREIGN KEY (conversation_id) REFERENCES public.conversations(id);


--
-- Name: appointments fk_rails_49108d7b44; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT fk_rails_49108d7b44 FOREIGN KEY (payment_id) REFERENCES public.payments(id);


--
-- Name: personal_messages fk_rails_56a980618a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_messages
    ADD CONSTRAINT fk_rails_56a980618a FOREIGN KEY (mentor_id) REFERENCES public.mentors(id);


--
-- Name: availabilities fk_rails_61972cca67; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.availabilities
    ADD CONSTRAINT fk_rails_61972cca67 FOREIGN KEY (mentor_id) REFERENCES public.mentors(id);


--
-- Name: payments fk_rails_6349101608; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT fk_rails_6349101608 FOREIGN KEY (mentor_id) REFERENCES public.mentors(id);


--
-- Name: oauth_access_tokens fk_rails_732cb83ab7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_access_tokens
    ADD CONSTRAINT fk_rails_732cb83ab7 FOREIGN KEY (application_id) REFERENCES public.oauth_applications(id);


--
-- Name: conversations fk_rails_7c15d62a0a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conversations
    ADD CONSTRAINT fk_rails_7c15d62a0a FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: prices fk_rails_8dca921fde; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prices
    ADD CONSTRAINT fk_rails_8dca921fde FOREIGN KEY (subject_id) REFERENCES public.subjects(id);


--
-- Name: conversations fk_rails_9d561c9e66; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conversations
    ADD CONSTRAINT fk_rails_9d561c9e66 FOREIGN KEY (mentor_id) REFERENCES public.mentors(id);


--
-- Name: appointments fk_rails_9e31213785; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT fk_rails_9e31213785 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: ratings fk_rails_a7dfeb9f5f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT fk_rails_a7dfeb9f5f FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: ratings fk_rails_b207230367; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT fk_rails_b207230367 FOREIGN KEY (mentor_id) REFERENCES public.mentors(id);


--
-- Name: oauth_access_grants fk_rails_b4b53e07b8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_access_grants
    ADD CONSTRAINT fk_rails_b4b53e07b8 FOREIGN KEY (application_id) REFERENCES public.oauth_applications(id);


--
-- Name: appointments fk_rails_dbdd84de8f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT fk_rails_dbdd84de8f FOREIGN KEY (mentor_id) REFERENCES public.mentors(id);


--
-- Name: mentors fk_rails_e7251cd92f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mentors
    ADD CONSTRAINT fk_rails_e7251cd92f FOREIGN KEY (subject_id) REFERENCES public.subjects(id);


--
-- Name: subjects fk_rails_f1b309c0b5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT fk_rails_f1b309c0b5 FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- PostgreSQL database dump complete
--

