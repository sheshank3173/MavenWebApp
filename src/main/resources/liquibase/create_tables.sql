--liquibase formatted sql
--changeset Gopi Muruganantham:release_1.create_tables.sql

DROP TABLE IF EXISTS users;

CREATE TABLE users
(
  username character varying(45) NOT NULL,
  password character varying(45) DEFAULT NULL::character varying,
  firstname character varying(45) NOT NULL,
  lastname character varying(45) DEFAULT NULL::character varying,
  email character varying(45) DEFAULT NULL::character varying,
  address character varying(45) DEFAULT NULL::character varying,
  phone integer,
  CONSTRAINT users_pkey PRIMARY KEY (username)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE users
  OWNER TO postgres;
  
