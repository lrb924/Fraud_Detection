CREATE TABLE card_holder (
	id INT NOT NULL.
	name VARCHAR(30),
	PRIMARY KEY (id)
);

CREATE TABLE credit_card (
	card VARCHAR(20) NOT NULL,
	cardholder_id INT,
	FOREIGN KEY cardholder_id REFERENCES card_holder (id),
	PRIMARY KEY (card)
);

CREATE TABLE merchant_category (
	id INT NOT NULL,
	name VARCHAR(30),
	PRIMARY KEY (id)
);

CREATE TABLE merchant (
	id INT NOT NULL,
	name VARCHAR(30),
	id_merchant_category INT,
	FOREIGN KEY id_merchant_category REFERENCES merchant_category (id),
	PRIMARY KEY (id)
);

CREATE TABLE transaction (
	id INT NOT NULL,
	date TIMESTAMP,
	amount FLOAT,
	card VARCHAR(20),
	id_merchant INT
	FOREIGN KEY card REFERENCES credit_card (card),
	FOREIGN KEY id_merchant REFERENCES merchant (id),
	PRIMARY KEY (id)
);