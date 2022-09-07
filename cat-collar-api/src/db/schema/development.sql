INSERT INTO pet_types (pet_type) VALUES ('cat');
INSERT INTO pet_types (pet_type) VALUES ('dog');

INSERT INTO countries (country_name) VALUES ('Canada');
INSERT INTO countries (country_name) VALUES ('Belgium');

INSERT INTO accounts (email, password, registration_type) VALUES ('belgium@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.', 'google');
INSERT INTO accounts (email, password, registration_type) VALUES ('canada@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.', 'email');


INSERT INTO owner_information (first_name, last_name, phone_number, email, address, country_id, account_id)
VALUES('Nicola', 'Tesla', 444555666, 'belgium_user@gmail.com', 'Belguim st. 6 apt 5', (SELECT id FROM countries WHERE country_name = 'Belgium'),  (SELECT id FROM accounts WHERE email = 'belgium@gmail.com'));
INSERT INTO owner_information (first_name, last_name, phone_number, email, address, country_id, account_id)
VALUES('Boris', 'Pasternak', 777777777, 'canada_user@gmail.com', 'Canada st. 3 apt 8', (SELECT id FROM countries WHERE country_name = 'Canada'),  (SELECT id FROM accounts WHERE email = 'canada@gmail.com'));


INSERT INTO pets (nickname, age, color, notes, breed, pet_type_id, account_id, qr_code)
VALUES('Zoe', 4, 'black', 'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'metis', (SELECT id FROM pet_types WHERE pet_type = 'cat'), (SELECT id FROM accounts WHERE email = 'canada@gmail.com'), 'qrcoderepresentationshouldbehere');
INSERT INTO pets (nickname, age, color, notes, breed, pet_type_id, account_id, qr_code)
VALUES('Grelkin', 6, 'ginger', 'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'metis', (SELECT id FROM pet_types WHERE pet_type = 'dog'), (SELECT id FROM accounts WHERE email = 'belgium@gmail.com'), 'qrcoderepresentationshouldbehere');


INSERT INTO photo_urls (path, pet_id) VALUES('https://picsum.photos/200/300', (SELECT id FROM pets WHERE nickname = 'Zoe'));
INSERT INTO photo_urls (path, pet_id) VALUES('https://picsum.photos/200/300', (SELECT id FROM pets WHERE nickname = 'Grelkin'));