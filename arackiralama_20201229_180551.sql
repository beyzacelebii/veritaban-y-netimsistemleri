--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

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

--
-- Name: arackiralama; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE arackiralama WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Turkish_Turkey.1254';


ALTER DATABASE arackiralama OWNER TO postgres;

\connect arackiralama

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

--
-- Name: arac(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.arac() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
update hakimda set arac=arac+1;
return new ;
end;
$$;


ALTER FUNCTION public.arac() OWNER TO postgres;

--
-- Name: aracara(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.aracara(num integer) RETURNS TABLE(numara integer, colour character varying, models character varying, peoplenmber character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT "aracno", "renk", "model","kisisayisi" FROM arac
                 WHERE "aracno" = num;
END;
$$;


ALTER FUNCTION public.aracara(num integer) OWNER TO postgres;

--
-- Name: dolarhesap(real); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dolarhesap(dolar real) RETURNS real
    LANGUAGE plpgsql
    AS $$ 
BEGIN
    RETURN 7.41 * dolar ;
    END;
$$;


ALTER FUNCTION public.dolarhesap(dolar real) OWNER TO postgres;

--
-- Name: fiyatguncelleme(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fiyatguncelleme() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
IF NEW."ucret" <> OLD."ucret" THEN
INSERT INTO "degisenucret"("fiyatId","eskiucret","yeniucret")
VALUES(OLD."fiyatId",OLD."ucret",NEW."ucret" , CURRENT_TIMESTAMP::TIMESTAMP);
END IF;
RETURN NEW;
END;
$$;


ALTER FUNCTION public.fiyatguncelleme() OWNER TO postgres;

--
-- Name: ilekle(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.ilekle() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
update ofisil set ilno=ilno+1;
return new ;
end;
$$;


ALTER FUNCTION public.ilekle() OWNER TO postgres;

--
-- Name: kisiara(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.kisiara(num integer) RETURNS TABLE(numara integer, isim character varying, soyisim character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT "kisino", "adi", "soyadi" FROM kisi
                 WHERE "kisino" = num;
END;
$$;


ALTER FUNCTION public.kisiara(num integer) OWNER TO postgres;

--
-- Name: personel(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.personel() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
update hakimda set personel=personel+1;
return new ;
end;
$$;


ALTER FUNCTION public.personel() OWNER TO postgres;

--
-- Name: rezervasyontarihi(date); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.rezervasyontarihi(tarihh date) RETURNS TABLE(yeri character varying, musterinum integer, trh date)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT "alısyeri", "musterino","tarih" FROM rezervasyon
                 WHERE "tarih" = tarihh;
END;
$$;


ALTER FUNCTION public.rezervasyontarihi(tarihh date) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: arac; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.arac (
    aracno integer NOT NULL,
    model character varying(40) NOT NULL,
    renk character varying(40) NOT NULL,
    kisisayisi character varying(40) NOT NULL,
    yakittipi character varying(40) NOT NULL,
    musterino integer NOT NULL,
    "fiyatId" integer NOT NULL,
    temsilcino integer NOT NULL
);


ALTER TABLE public.arac OWNER TO postgres;

--
-- Name: arac_aracno_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.arac_aracno_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.arac_aracno_seq OWNER TO postgres;

--
-- Name: arac_aracno_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.arac_aracno_seq OWNED BY public.arac.aracno;


--
-- Name: arac_fiyatId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."arac_fiyatId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."arac_fiyatId_seq" OWNER TO postgres;

--
-- Name: arac_fiyatId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."arac_fiyatId_seq" OWNED BY public.arac."fiyatId";


--
-- Name: arac_musterino_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.arac_musterino_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.arac_musterino_seq OWNER TO postgres;

--
-- Name: arac_musterino_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.arac_musterino_seq OWNED BY public.arac.musterino;


--
-- Name: arac_temsilcino_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.arac_temsilcino_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.arac_temsilcino_seq OWNER TO postgres;

--
-- Name: arac_temsilcino_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.arac_temsilcino_seq OWNED BY public.arac.temsilcino;


--
-- Name: fiyat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fiyat (
    fiyatid integer NOT NULL,
    parabirimi character varying(20) NOT NULL,
    ucret integer NOT NULL
);


ALTER TABLE public.fiyat OWNER TO postgres;

--
-- Name: fiyat_fiyatId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."fiyat_fiyatId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."fiyat_fiyatId_seq" OWNER TO postgres;

--
-- Name: fiyat_fiyatId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."fiyat_fiyatId_seq" OWNED BY public.fiyat.fiyatid;


--
-- Name: hakimda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hakimda (
    sayfano integer NOT NULL,
    personel integer NOT NULL,
    arac integer NOT NULL,
    ofis character varying(40) NOT NULL
);


ALTER TABLE public.hakimda OWNER TO postgres;

--
-- Name: hakimda_sayfano_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hakimda_sayfano_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hakimda_sayfano_seq OWNER TO postgres;

--
-- Name: hakimda_sayfano_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hakimda_sayfano_seq OWNED BY public.hakimda.sayfano;


--
-- Name: il; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.il (
    ilno integer NOT NULL,
    "iladı" character varying(20) NOT NULL
);


ALTER TABLE public.il OWNER TO postgres;

--
-- Name: il_ilno_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.il_ilno_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.il_ilno_seq OWNER TO postgres;

--
-- Name: il_ilno_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.il_ilno_seq OWNED BY public.il.ilno;


--
-- Name: ilce; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ilce (
    ilceno integer NOT NULL,
    "ilceadı" character varying(20) NOT NULL,
    ilno integer NOT NULL
);


ALTER TABLE public.ilce OWNER TO postgres;

--
-- Name: ilce_ilceno_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ilce_ilceno_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ilce_ilceno_seq OWNER TO postgres;

--
-- Name: ilce_ilceno_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ilce_ilceno_seq OWNED BY public.ilce.ilceno;


--
-- Name: iletişim; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."iletişim" (
    iletisimkodu integer NOT NULL,
    telno character varying(20) NOT NULL,
    email character varying(40) NOT NULL,
    ilceno integer NOT NULL
);


ALTER TABLE public."iletişim" OWNER TO postgres;

--
-- Name: iletişim_iletisimkodu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."iletişim_iletisimkodu_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."iletişim_iletisimkodu_seq" OWNER TO postgres;

--
-- Name: iletişim_iletisimkodu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."iletişim_iletisimkodu_seq" OWNED BY public."iletişim".iletisimkodu;


--
-- Name: kayit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kayit (
    "kisiNo" integer NOT NULL,
    email character varying(40) NOT NULL
);


ALTER TABLE public.kayit OWNER TO postgres;

--
-- Name: kisi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kisi (
    kisino integer NOT NULL,
    adi character varying(40) NOT NULL,
    soyadi character varying(40) NOT NULL
);


ALTER TABLE public.kisi OWNER TO postgres;

--
-- Name: musteri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.musteri (
    "kisiNo" integer NOT NULL,
    telefonno character varying(40) NOT NULL,
    email character varying(40) NOT NULL
);


ALTER TABLE public.musteri OWNER TO postgres;

--
-- Name: ofis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ofis (
    ofisnum integer NOT NULL,
    telno character varying(20) NOT NULL,
    konum character varying(40) NOT NULL,
    kisisayisi integer NOT NULL,
    "iletişimkodu" integer NOT NULL
);


ALTER TABLE public.ofis OWNER TO postgres;

--
-- Name: ofis_ofisnum_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ofis_ofisnum_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ofis_ofisnum_seq OWNER TO postgres;

--
-- Name: ofis_ofisnum_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ofis_ofisnum_seq OWNED BY public.ofis.ofisnum;


--
-- Name: ofisil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ofisil (
    ofisnum integer NOT NULL,
    ilno integer NOT NULL
);


ALTER TABLE public.ofisil OWNER TO postgres;

--
-- Name: ofisil_ofisnum_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ofisil_ofisnum_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ofisil_ofisnum_seq OWNER TO postgres;

--
-- Name: ofisil_ofisnum_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ofisil_ofisnum_seq OWNED BY public.ofisil.ofisnum;


--
-- Name: rezervasyon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rezervasyon (
    rezervasyonno integer NOT NULL,
    "alısyeri" character varying(20) NOT NULL,
    musterino integer NOT NULL,
    aracno integer NOT NULL,
    tarih date NOT NULL
);


ALTER TABLE public.rezervasyon OWNER TO postgres;

--
-- Name: rezervasyon_rezervasyonno_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rezervasyon_rezervasyonno_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rezervasyon_rezervasyonno_seq OWNER TO postgres;

--
-- Name: rezervasyon_rezervasyonno_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rezervasyon_rezervasyonno_seq OWNED BY public.rezervasyon.rezervasyonno;


--
-- Name: satistemsilcisi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.satistemsilcisi (
    "kisiNo" integer NOT NULL
);


ALTER TABLE public.satistemsilcisi OWNER TO postgres;

--
-- Name: sikayet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sikayet (
    sikayetkodu integer NOT NULL,
    ad character varying(40) NOT NULL,
    soyadi character varying(40) NOT NULL,
    email character varying(40) NOT NULL,
    sikayetkonusu character varying(40) NOT NULL,
    "kisiNo" integer NOT NULL
);


ALTER TABLE public.sikayet OWNER TO postgres;

--
-- Name: sikayet_kisiNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."sikayet_kisiNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."sikayet_kisiNo_seq" OWNER TO postgres;

--
-- Name: sikayet_kisiNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."sikayet_kisiNo_seq" OWNED BY public.sikayet."kisiNo";


--
-- Name: sikayet_sikayetkodu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sikayet_sikayetkodu_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sikayet_sikayetkodu_seq OWNER TO postgres;

--
-- Name: sikayet_sikayetkodu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sikayet_sikayetkodu_seq OWNED BY public.sikayet.sikayetkodu;


--
-- Name: temizliksirketi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temizliksirketi (
    temizliksirketino integer NOT NULL,
    aracsayisi integer NOT NULL,
    temizlikurun character varying(40) NOT NULL,
    aracno integer NOT NULL
);


ALTER TABLE public.temizliksirketi OWNER TO postgres;

--
-- Name: temizliksirketi_temizliksirketino_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temizliksirketi_temizliksirketino_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.temizliksirketi_temizliksirketino_seq OWNER TO postgres;

--
-- Name: temizliksirketi_temizliksirketino_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temizliksirketi_temizliksirketino_seq OWNED BY public.temizliksirketi.temizliksirketino;


--
-- Name: arac aracno; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arac ALTER COLUMN aracno SET DEFAULT nextval('public.arac_aracno_seq'::regclass);


--
-- Name: arac musterino; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arac ALTER COLUMN musterino SET DEFAULT nextval('public.arac_musterino_seq'::regclass);


--
-- Name: arac fiyatId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arac ALTER COLUMN "fiyatId" SET DEFAULT nextval('public."arac_fiyatId_seq"'::regclass);


--
-- Name: arac temsilcino; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arac ALTER COLUMN temsilcino SET DEFAULT nextval('public.arac_temsilcino_seq'::regclass);


--
-- Name: fiyat fiyatid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fiyat ALTER COLUMN fiyatid SET DEFAULT nextval('public."fiyat_fiyatId_seq"'::regclass);


--
-- Name: hakimda sayfano; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hakimda ALTER COLUMN sayfano SET DEFAULT nextval('public.hakimda_sayfano_seq'::regclass);


--
-- Name: il ilno; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.il ALTER COLUMN ilno SET DEFAULT nextval('public.il_ilno_seq'::regclass);


--
-- Name: ilce ilceno; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ilce ALTER COLUMN ilceno SET DEFAULT nextval('public.ilce_ilceno_seq'::regclass);


--
-- Name: iletişim iletisimkodu; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."iletişim" ALTER COLUMN iletisimkodu SET DEFAULT nextval('public."iletişim_iletisimkodu_seq"'::regclass);


--
-- Name: ofis ofisnum; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ofis ALTER COLUMN ofisnum SET DEFAULT nextval('public.ofis_ofisnum_seq'::regclass);


--
-- Name: ofisil ofisnum; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ofisil ALTER COLUMN ofisnum SET DEFAULT nextval('public.ofisil_ofisnum_seq'::regclass);


--
-- Name: rezervasyon rezervasyonno; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rezervasyon ALTER COLUMN rezervasyonno SET DEFAULT nextval('public.rezervasyon_rezervasyonno_seq'::regclass);


--
-- Name: sikayet sikayetkodu; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sikayet ALTER COLUMN sikayetkodu SET DEFAULT nextval('public.sikayet_sikayetkodu_seq'::regclass);


--
-- Name: sikayet kisiNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sikayet ALTER COLUMN "kisiNo" SET DEFAULT nextval('public."sikayet_kisiNo_seq"'::regclass);


--
-- Name: temizliksirketi temizliksirketino; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temizliksirketi ALTER COLUMN temizliksirketino SET DEFAULT nextval('public.temizliksirketi_temizliksirketino_seq'::regclass);


--
-- Data for Name: arac; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.arac VALUES
	(2, 'Opel', 'beyaz', '5', 'lpg', 1, 3, 1000),
	(1, 'BMW', 'siyah', '5', 'benzin', 1, 1, 1000),
	(3, 'reno', 'mavi', '5', 'lpg', 2, 2, 1001),
	(4, 'mercedes', 'kırmızı', '2', 'benzin', 3, 2, 1003),
	(5, 'mercedes', 'mavi', '5', 'benzin', 4, 1, 1002);


--
-- Data for Name: fiyat; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.fiyat VALUES
	(2, 'dolar', 500),
	(3, 'tl', 500),
	(1, 'tl', 1000);


--
-- Data for Name: hakimda; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.hakimda VALUES
	(1, 5, 5, '1');


--
-- Data for Name: il; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.il VALUES
	(54, 'sakarya'),
	(34, 'istanbul');


--
-- Data for Name: ilce; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: iletişim; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: kayit; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.kayit VALUES
	(1, 'ozge@gmail.com'),
	(2, 'esra@gmail.com');


--
-- Data for Name: kisi; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.kisi VALUES
	(1000, 'Beyza', 'Çelebi'),
	(1001, 'Berkay', 'Çelebi'),
	(1002, 'Furkan', 'Mert'),
	(1003, 'Buse', 'Mert'),
	(1, 'ozge', 'yıldız'),
	(2, 'esra', 'yurt'),
	(1004, 'Gürkan', 'Kurt'),
	(3, 'hülya', 'Bal'),
	(4, 'Samet', 'Türk'),
	(5, 'Begüm', 'Başar'),
	(6, 'Ayhan', 'Türk'),
	(7, 'Zeynep', 'Düzeltici'),
	(8, 'Zeynep', 'Baran'),
	(9, 'Özlem', 'Er'),
	(10, 'ömer', 'Berat');


--
-- Data for Name: musteri; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.musteri VALUES
	(1, '05366665454', 'ozge@gmail.com'),
	(2, '05321453265', 'esra@gmail.com'),
	(3, '05647453214', 'hulya@gmail.com'),
	(4, '05379856241', 'samet@gmail.com'),
	(5, '05697554782', 'begum@hotmail.com'),
	(6, '05321459325', 'turkayhan@gmail.com'),
	(7, '05984132564', 'zynpdzlt@gmail.com'),
	(8, '05347551455', 'zeynepbaran@gmail.com'),
	(9, '05484645688', 'özlem@gmail.com'),
	(10, '05321485960', 'omerberat@gmail.com');


--
-- Data for Name: ofis; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: ofisil; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: rezervasyon; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rezervasyon VALUES
	(1, 'izmir', 1, 1, '2021-01-04'),
	(2, 'izmir', 2, 2, '2021-01-05'),
	(3, 'sakaryA', 1, 2, '2021-01-13'),
	(4, 'ankara', 1, 1, '2021-01-04'),
	(5, 'konya', 1, 2, '2021-04-05');


--
-- Data for Name: satistemsilcisi; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.satistemsilcisi VALUES
	(1000),
	(1001),
	(1002),
	(1003),
	(1004);


--
-- Data for Name: sikayet; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sikayet VALUES
	(1111, 'ozge', 'yıldız', 'ozge@gmail.com', 'aractemizliği', 1),
	(1112, 'esra', 'yurt', 'esra@gmail.com', 'aracbakımı', 2);


--
-- Data for Name: temizliksirketi; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.temizliksirketi VALUES
	(1, 2, 'deterjan', 1),
	(2, 2, 'deterjan', 2);


--
-- Name: arac_aracno_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.arac_aracno_seq', 1, false);


--
-- Name: arac_fiyatId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."arac_fiyatId_seq"', 3, true);


--
-- Name: arac_musterino_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.arac_musterino_seq', 3, true);


--
-- Name: arac_temsilcino_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.arac_temsilcino_seq', 3, true);


--
-- Name: fiyat_fiyatId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."fiyat_fiyatId_seq"', 1, false);


--
-- Name: hakimda_sayfano_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hakimda_sayfano_seq', 2, true);


--
-- Name: il_ilno_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.il_ilno_seq', 1, false);


--
-- Name: ilce_ilceno_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ilce_ilceno_seq', 1, false);


--
-- Name: iletişim_iletisimkodu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."iletişim_iletisimkodu_seq"', 1, false);


--
-- Name: ofis_ofisnum_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ofis_ofisnum_seq', 1, false);


--
-- Name: ofisil_ofisnum_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ofisil_ofisnum_seq', 1, false);


--
-- Name: rezervasyon_rezervasyonno_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rezervasyon_rezervasyonno_seq', 5, true);


--
-- Name: sikayet_kisiNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."sikayet_kisiNo_seq"', 1, false);


--
-- Name: sikayet_sikayetkodu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sikayet_sikayetkodu_seq', 1, false);


--
-- Name: temizliksirketi_temizliksirketino_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temizliksirketi_temizliksirketino_seq', 1, false);


--
-- Name: arac aracPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arac
    ADD CONSTRAINT "aracPK" PRIMARY KEY (aracno);


--
-- Name: fiyat fiyatPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fiyat
    ADD CONSTRAINT "fiyatPK" PRIMARY KEY (fiyatid);


--
-- Name: hakimda hakimdaPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hakimda
    ADD CONSTRAINT "hakimdaPK" PRIMARY KEY (sayfano);


--
-- Name: il ilPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.il
    ADD CONSTRAINT "ilPK" PRIMARY KEY (ilno);


--
-- Name: ilce ilcePK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ilce
    ADD CONSTRAINT "ilcePK" PRIMARY KEY (ilceno);


--
-- Name: iletişim iletisimPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."iletişim"
    ADD CONSTRAINT "iletisimPK" PRIMARY KEY (iletisimkodu);


--
-- Name: kayit kayit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kayit
    ADD CONSTRAINT kayit_pkey PRIMARY KEY ("kisiNo");


--
-- Name: kisi kisi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kisi
    ADD CONSTRAINT kisi_pkey PRIMARY KEY (kisino);


--
-- Name: musteri musteri_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musteri
    ADD CONSTRAINT musteri_pkey PRIMARY KEY ("kisiNo");


--
-- Name: ofis ofisPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ofis
    ADD CONSTRAINT "ofisPK" PRIMARY KEY (ofisnum);


--
-- Name: ofisil ofisUnique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ofisil
    ADD CONSTRAINT "ofisUnique" UNIQUE (ofisnum);


--
-- Name: ofisil ofisilPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ofisil
    ADD CONSTRAINT "ofisilPK" PRIMARY KEY (ofisnum, ilno);


--
-- Name: rezervasyon rezervasyonPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rezervasyon
    ADD CONSTRAINT "rezervasyonPK" PRIMARY KEY (rezervasyonno);


--
-- Name: satistemsilcisi satistemsilcisi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.satistemsilcisi
    ADD CONSTRAINT satistemsilcisi_pkey PRIMARY KEY ("kisiNo");


--
-- Name: sikayet sikayetPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sikayet
    ADD CONSTRAINT "sikayetPK" PRIMARY KEY (sikayetkodu);


--
-- Name: temizliksirketi temizliksirketiPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temizliksirketi
    ADD CONSTRAINT "temizliksirketiPK" PRIMARY KEY (temizliksirketino);


--
-- Name: arac aracsys; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER aracsys AFTER INSERT ON public.arac FOR EACH ROW EXECUTE FUNCTION public.arac();


--
-- Name: fiyat fiyatguncelle; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER fiyatguncelle AFTER INSERT ON public.fiyat FOR EACH ROW EXECUTE FUNCTION public.fiyatguncelleme();


--
-- Name: il ilartır; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "ilartır" AFTER INSERT ON public.il FOR EACH ROW EXECUTE FUNCTION public.ilekle();


--
-- Name: satistemsilcisi personelsys; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER personelsys AFTER INSERT ON public.satistemsilcisi FOR EACH ROW EXECUTE FUNCTION public.personel();


--
-- Name: rezervasyon aracrezervasyon; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rezervasyon
    ADD CONSTRAINT aracrezervasyon FOREIGN KEY (aracno) REFERENCES public.arac(aracno) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: temizliksirketi aractemizlikFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temizliksirketi
    ADD CONSTRAINT "aractemizlikFK" FOREIGN KEY (aracno) REFERENCES public.arac(aracno) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: arac fiyataracFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arac
    ADD CONSTRAINT "fiyataracFK" FOREIGN KEY ("fiyatId") REFERENCES public.fiyat(fiyatid) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ofisil ilFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ofisil
    ADD CONSTRAINT "ilFK" FOREIGN KEY (ilno) REFERENCES public.il(ilno) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: iletişim ilceiletisim; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."iletişim"
    ADD CONSTRAINT ilceiletisim FOREIGN KEY (ilceno) REFERENCES public.ilce(ilceno) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ofis iletisimofisFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ofis
    ADD CONSTRAINT "iletisimofisFK" FOREIGN KEY ("iletişimkodu") REFERENCES public."iletişim"(iletisimkodu) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ilce ililceFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ilce
    ADD CONSTRAINT "ililceFK" FOREIGN KEY (ilno) REFERENCES public.il(ilno) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: kayit kayitPersonel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kayit
    ADD CONSTRAINT "kayitPersonel" FOREIGN KEY ("kisiNo") REFERENCES public.kisi(kisino) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: sikayet kayitsikayetFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sikayet
    ADD CONSTRAINT "kayitsikayetFK" FOREIGN KEY ("kisiNo") REFERENCES public.kayit("kisiNo") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: satistemsilcisi kisi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.satistemsilcisi
    ADD CONSTRAINT kisi FOREIGN KEY ("kisiNo") REFERENCES public.kisi(kisino) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: arac musteriarac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arac
    ADD CONSTRAINT musteriarac FOREIGN KEY (musterino) REFERENCES public.musteri("kisiNo") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: musteri musterikisi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musteri
    ADD CONSTRAINT musterikisi FOREIGN KEY ("kisiNo") REFERENCES public.kisi(kisino) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: rezervasyon musterirezervasyonFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rezervasyon
    ADD CONSTRAINT "musterirezervasyonFK" FOREIGN KEY (musterino) REFERENCES public.musteri("kisiNo") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ofisil ofisilFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ofisil
    ADD CONSTRAINT "ofisilFK" FOREIGN KEY (ofisnum) REFERENCES public.ofis(ofisnum) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ilce ofisilceFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ilce
    ADD CONSTRAINT "ofisilceFK" FOREIGN KEY (ilceno) REFERENCES public.ofis(ofisnum) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: arac satisaracFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arac
    ADD CONSTRAINT "satisaracFK" FOREIGN KEY (temsilcino) REFERENCES public.satistemsilcisi("kisiNo") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

