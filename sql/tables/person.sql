
CREATE TABLE person (
  person_id SERIAL NOT NULL,
  login_name VARCHAR(32) UNIQUE,
  password CHAR(48),
  title VARCHAR(32),
  gender BOOL,
  first_name VARCHAR(64),
  middle_name VARCHAR(64),
  last_name VARCHAR(64),
  public_name VARCHAR(64),
  nickname VARCHAR(64),
  address VARCHAR(256),
  street VARCHAR(64),
  street_postcode VARCHAR(10),
  po_box VARCHAR(10),
  po_box_postcode VARCHAR(10),
  city VARCHAR(64),
  country_id INTEGER,
  email_contact VARCHAR(64) UNIQUE,
  iban VARCHAR(128),
  bic VARCHAR(32),
  bank_name VARCHAR(128),
  account_owner VARCHAR(128),
  gpg_key TEXT,
  preferences TEXT,
  f_conflict BOOL NOT NULL DEFAULT FALSE,
  f_deleted BOOL NOT NULL DEFAULT FALSE,
  f_spam BOOL NOT NULL DEFAULT FALSE,
  last_login TIMESTAMP WITH TIME ZONE,
  last_modified TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  last_modified_by INTEGER,
  current_conference_id INTEGER,
  current_language_id INTEGER,
  FOREIGN KEY (country_id) REFERENCES country (country_id) ON UPDATE CASCADE ON DELETE SET NULL,
  FOREIGN KEY (last_modified_by) REFERENCES person (person_id) ON UPDATE CASCADE ON DELETE SET NULL,
  FOREIGN KEY (current_conference_id) REFERENCES conference( conference_id ) ON UPDATE CASCADE ON DELETE SET NULL,
  FOREIGN KEY (current_language_id) REFERENCES language( language_id ) ON UPDATE CASCADE ON DELETE SET NULL,
  CHECK (login_name IS NOT NULL OR last_name IS NOT NULL OR nickname IS NOT NULL OR public_name IS NOT NULL),
  CHECK (login_name <> 'logout'),
  CHECK ( strpos( login_name, ':' ) = 0 ),
  PRIMARY KEY (person_id)
) WITHOUT OIDS;
