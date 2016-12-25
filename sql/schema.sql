CREATE TABLE contact
(
  id integer NOT NULL DEFAULT nextval('contact_id_seq'::regclass),
  first_name character varying(60) NOT NULL,
  last_name character varying(40) NOT NULL,
  birth_date date,
  version integer NOT NULL DEFAULT 0,
  CONSTRAINT contact_pkey PRIMARY KEY (id),
  CONSTRAINT contact_first_name_last_name_key UNIQUE (first_name, last_name)
)

CREATE TABLE contact_hobby_detail
(
  contact_id integer NOT NULL,
  hobby_id character varying(20) NOT NULL,
  CONSTRAINT contact_hobby_detail_pkey PRIMARY KEY (contact_id, hobby_id),
  CONSTRAINT fk_contact_hobby_detail_1 FOREIGN KEY (contact_id)
      REFERENCES contact (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE,
  CONSTRAINT fk_contact_hobby_detail_2 FOREIGN KEY (hobby_id)
      REFERENCES hobby (hobby_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)

CREATE TABLE contact_tel_detail
(
  id integer NOT NULL DEFAULT nextval('contact_tel_detail_id_seq'::regclass),
  contact_id integer NOT NULL,
  tel_type character varying(20) NOT NULL,
  tel_number character varying(20) NOT NULL,
  version integer NOT NULL DEFAULT 0,
  CONSTRAINT contact_tel_detail_pkey PRIMARY KEY (id),
  CONSTRAINT fk_contact_tel_detail_1 FOREIGN KEY (contact_id)
      REFERENCES contact (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT contact_tel_detail_contact_id_tel_type_key UNIQUE (contact_id, tel_type)
)

CREATE TABLE hobby
(
  hobby_id character varying(20) NOT NULL,
  CONSTRAINT hobby_pkey PRIMARY KEY (hobby_id)
)