DROP TABLE IF EXISTS card_holder;
CREATE TABLE card_holder (
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL);

DROP TABLE IF EXISTS credit_card;
CREATE TABLE credit_card (
    card VARCHAR(20) NOT NULL PRIMARY KEY,
    cardholder_id INT NOT NULL);

DROP TABLE IF EXISTS merchant;
CREATE TABLE merchant (
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    id_merchant_category INT NOT NULL);

DROP TABLE IF EXISTS merchant_category;
CREATE TABLE merchant_category (
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL);

DROP TABLE IF EXISTS transaction;
CREATE TABLE transaction (
    id INT NOT NULL PRIMARY KEY,
    date TIMESTAMP NOT NULL,
    amount FLOAT NOT NULL,
    card VARCHAR(20) NOT NULL,
    id_merchant INT NOT NULL);
	
ALTER TABLE credit_card ADD CONSTRAINT fk_credit_card_cardholder_id 
FOREIGN KEY(cardholder_id) REFERENCES card_holder (id);

ALTER TABLE merchant ADD CONSTRAINT fk_merchant_id_merchant_category 
FOREIGN KEY(id_merchant_category) REFERENCES merchant_category (id);

ALTER TABLE transaction ADD CONSTRAINT fk_transaction_card 
FOREIGN KEY(card) REFERENCES credit_card (card);

ALTER TABLE transaction ADD CONSTRAINT fk_transaction_id_merchant 
FOREIGN KEY(id_merchant) REFERENCES merchant (id);
