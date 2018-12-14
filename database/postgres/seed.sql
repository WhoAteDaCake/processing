--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1 (Debian 11.1-1.pgdg90+1)
-- Dumped by pg_dump version 11.1 (Debian 11.1-1.pgdg90+1)

-- Started on 2018-12-14 14:33:45 UTC

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2 (class 3079 OID 16391)
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- TOC entry 2879 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 16402)
-- Name: twitter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.twitter (
    _id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    twitter_id bigint NOT NULL,
    text text NOT NULL,
    keywords text[] NOT NULL,
    hashtags text[] NOT NULL
);


ALTER TABLE public.twitter OWNER TO postgres;

--
-- TOC entry 2752 (class 2606 OID 16410)
-- Name: twitter twitter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.twitter
    ADD CONSTRAINT twitter_pkey PRIMARY KEY (_id);


-- Completed on 2018-12-14 14:33:46 UTC

--
-- PostgreSQL database dump complete
--

