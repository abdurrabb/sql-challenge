--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

-- Started on 2021-08-06 09:13:44 EDT

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
-- TOC entry 200 (class 1259 OID 33282)
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    dept_no character varying NOT NULL,
    dept_name character varying NOT NULL
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 33290)
-- Name: dept_emp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dept_emp (
    emp_no integer NOT NULL,
    dept_no character varying NOT NULL
);


ALTER TABLE public.dept_emp OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 33356)
-- Name: dept_manager; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dept_manager (
    dept_no character varying NOT NULL,
    emp_no integer NOT NULL
);


ALTER TABLE public.dept_manager OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 33304)
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    emp_no integer NOT NULL,
    emp_title_id character varying NOT NULL,
    birth_date date NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    sex character varying NOT NULL,
    hire_date date NOT NULL
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 33312)
-- Name: salaries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salaries (
    emp_no integer NOT NULL,
    salary integer NOT NULL
);


ALTER TABLE public.salaries OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 33317)
-- Name: titles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.titles (
    title_id character varying NOT NULL,
    title character varying NOT NULL
);


ALTER TABLE public.titles OWNER TO postgres;

--
-- TOC entry 3139 (class 2606 OID 33289)
-- Name: departments pk_departments; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT pk_departments PRIMARY KEY (dept_no);


--
-- TOC entry 3141 (class 2606 OID 33297)
-- Name: dept_emp pk_dept_emp; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT pk_dept_emp PRIMARY KEY (emp_no, dept_no);


--
-- TOC entry 3149 (class 2606 OID 33363)
-- Name: dept_manager pk_dept_manager; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT pk_dept_manager PRIMARY KEY (dept_no, emp_no);


--
-- TOC entry 3143 (class 2606 OID 33311)
-- Name: employees pk_employees; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT pk_employees PRIMARY KEY (emp_no);


--
-- TOC entry 3145 (class 2606 OID 33316)
-- Name: salaries pk_salaries; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salaries
    ADD CONSTRAINT pk_salaries PRIMARY KEY (emp_no);


--
-- TOC entry 3147 (class 2606 OID 33324)
-- Name: titles pk_titles; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titles
    ADD CONSTRAINT pk_titles PRIMARY KEY (title_id);


--
-- TOC entry 3150 (class 2606 OID 33345)
-- Name: salaries fk_salaries_emp_no; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salaries
    ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no);


-- Completed on 2021-08-06 09:13:44 EDT

--
-- PostgreSQL database dump complete
--

