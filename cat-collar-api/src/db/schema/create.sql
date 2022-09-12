DROP TABLE IF EXISTS accounts CASCADE;
DROP TABLE IF EXISTS countries CASCADE;
DROP TABLE IF EXISTS owner_information CASCADE;
DROP TABLE IF EXISTS pet_types CASCADE;
DROP TABLE IF EXISTS pets CASCADE;
DROP TABLE IF EXISTS photo_urls CASCADE;

CREATE TABLE accounts(
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY NOT NULL,
  email VARCHAR (255) NOT NULL,
  password VARCHAR (255) NOT NULL,
  registration_type VARCHAR(255) NOT NULL,
  created_at timestamp default current_timestamp NOT NULL
);

CREATE TABLE countries(
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY NOT NULL,
  country_name VARCHAR(255) NOT NULL
);

CREATE TABLE owner_information(
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY NOT NULL,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  phone_number VARCHAR(255),
  email VARCHAR(255) NOT NULL,
  address VARCHAR(255),
  country_id UUID NOT NULL REFERENCES countries(id) ON DELETE CASCADE,
  account_id UUID NOT NULL REFERENCES accounts(id) ON DELETE CASCADE
);

CREATE TABLE pet_types(
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY NOT NULL,
  pet_type VARCHAR(255) NOT NULL
);

CREATE TABLE pets(
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY NOT NULL,
  nickname VARCHAR(255) NOT NULL,
  age INTEGER NOT NULL,
  color VARCHAR(255) NOT NULL,
  notes VARCHAR(600),
  breed VARCHAR(255),
  pet_type_id UUID NOT NULL REFERENCES pet_types(id) ON DELETE CASCADE,
  account_id UUID NOT NULL REFERENCES accounts(id) ON DELETE CASCADE,
  qr_code TEXT
);

CREATE TABLE photo_urls(
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY NOT NULL,
  path TEXT NOT NULL,
  pet_id UUID NOT NULL REFERENCES pets(id) ON DELETE CASCADE
);