-- Database: wind

-- DROP DATABASE wind;

CREATE DATABASE wind
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'pl_PL.UTF-8'
       LC_CTYPE = 'pl_PL.UTF-8'
       CONNECTION LIMIT = -1;
GRANT CONNECT, TEMPORARY ON DATABASE wind TO public;
GRANT ALL ON DATABASE wind TO postgres;
GRANT ALL ON DATABASE wind TO admin;


-- Database: wind

-- DROP DATABASE wind;


CREATE TABLE produkt_status
(
id SERIAL NOT NULL unique,
opis text NOT NULL,
aktywna boolean NOT NULL,
widoczna boolean NOT NULL
);

CREATE TABLE dluznik_typ
(
id SERIAL NOT NULL unique,
opis text NOT NULL);

CREATE TABLE firma_typ
(
id SERIAL NOT NULL unique,
opis text NOT NULL);

CREATE TABLE dluznik_2_produk_rola
(
id SERIAL NOT NULL unique,
opis text NOT NULL);

CREATE TABLE list_typ
(
id SERIAL NOT NULL unique,
opis text NOT NULL);

CREATE TABLE list_status
(
id SERIAL NOT NULL unique,
opis text NOT NULL);

CREATE TABLE rodzaj_adres
(
id SERIAL NOT NULL unique,
opis text NOT NULL);

CREATE TABLE zadluzenie_typ
(
id SERIAL NOT NULL unique,
opis text NOT NULL);

-- --------------------------------------------------------------------------------------------------------------------------------------- 


CREATE TABLE adres
(
id  SERIAL NOT NULL unique,
kraj text NOT NULL,
miasto text NOT NULL,
ulica text NOT NULL,
nr_domu text NOT NULL,
nr_lokalu int8,
kod_pozctowy text NOT NULL,
id_rodzaj_adres int8 references rodzaj_adres(id),
PRIMARY KEY ("id"));

CREATE TABLE zleceniodawca
(
id  SERIAL NOT NULL unique,
nazwa text NOT NULL,
rachunek text NOT NULL,
id_adres int8 NOT NULL references adres(id),
PRIMARY KEY ("id"));

CREATE TABLE komornik
(
id  SERIAL NOT NULL unique,
imie text NOT NULL,
nazwisko text NOT NULL,
id_adres int8 references adres(id),
nr_konta int8 NOT NULL,
PRIMARY KEY ("id"));

CREATE TABLE sad
(
id  SERIAL NOT NULL unique,
nazwa text NOT NULL,
wydzial text NOT NULL,
PRIMARY KEY ("id"));



CREATE TABLE produkt 
(
id  SERIAL NOT NULL unique,
id_zleceniodawca int8 NOT NULL,
data_start date NOT NULL,
data_stop date NOT NULL,
nr_rachunku_wplat text NOT NULL,
id_komornik int4 references komornik(id),
id_status int4 references produkt_status(id),
id_sad int8 references sad(id),
sygnatura_sadowa text,
PRIMARY KEY (id));

CREATE TABLE dluznik
(
id  SERIAL NOT NULL unique,
dluznik_typ int4 references dluznik_typ(id),
id_adres int8 references adres(id),
PRIMARY KEY ("id"));    

CREATE TABLE dluznik_osoba
(
id  SERIAL NOT NULL unique,
imie text NOT NULL,
nazwisko text NOT NULL,
pesel text NOT NULL,
id_adres int8 references adres(id),
PRIMARY KEY ("id"));

CREATE TABLE dluznik_firma
(
id  SERIAL NOT NULL unique,
nazwa text NOT NULL,
regon text NOT NULL,
krs text NOT NULL,
firma_typ int4 references firma_typ(id),
PRIMARY KEY ("id"),
UNIQUE (regon, krs, nazwa));

CREATE TABLE dluznik_2_produkt
(
id  SERIAL NOT NULL unique,
id_produkt int8 NOT NULL,
id_dluznik int8 NOT NULL,
dluznik_2_produkt_rola int4 references dluznik_2_produkt_rola(id),
PRIMARY KEY ("id"),
UNIQUE (id_produkt));

CREATE TABLE list
(
id  SERIAL NOT NULL unique,
id_dluznik int8 references dluznik(id),
id_typ_list int8 references list_typ(id),
id_list_status int8 references list_status(id),
id_adres int8 NOT NULL,
PRIMARY KEY ("id"));



CREATE TABLE faktura
(
id  SERIAL NOT NULL unique,
nazwa text NOT NULL,
data_platnosci date NOT NULL,
data_wymagalnosci date NOT NULL,
id_produkt int8 references produkt(id),
kwota_calkowita int8 NOT NULL,
kwota_pozostala_do_wplaty int8 NOT NULL,
id_typ_zadluzenia int4 references zadluzenie_typ(id));

CREATE TABLE wplata
(
id  SERIAL NOT NULL unique,
id_produkt int8 references produkt(id),
id_faktura int8 references faktura(id),
data date NOT NULL);






