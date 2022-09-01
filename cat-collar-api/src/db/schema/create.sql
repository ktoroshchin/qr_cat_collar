DROP TABLE IF EXISTS owner_information CASCADE;
DROP TABLE IF EXISTS pets CASCADE;
DROP TABLE IF EXISTS accounts CASCADE;
DROP TABLE IF EXISTS pet_types CASCADE;
DROP TABLE IF EXISTS countries CASCADE;
DROP TABLE IF EXISTS photo_urls CASCADE;

CREATE TABLE owner_information (
  id SERIAL PRIMARY KEY NOT NULL,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  phone_number VARCHAR(16),
  email VARCHAR(255) NOT NULL,
  address VARCHAR(255),
  country_id INTEGER REFERENCES countries(id) ON DELETE CASCADE,
  account_id INTEGER REFERENCES accounts(id) ON DELETE CASCADE,
  created_at timestamp default current_timestamp NOT NULL
);

CREATE TABLE pets (
  id SERIAL PRIMARY KEY NOT NULL,
  nickname VARCHAR(255) NOT NULL,
  age INTEGER(16) NOT NULL,
  color VARCHAR(255) NOT NULL,
  notes VARCHAR(600),
  breed VARCHAR(255),
  pet_type_id INTEGER REFERENCES pet_types(id) NOT NULL ON DELETE CASCADE,
  account_id INTEGER REFERENCES accounts(id) NOT NULL ON DELETE CASCADE,
  qr_code 
);
