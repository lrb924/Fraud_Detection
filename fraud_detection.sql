drop table if exists card_holder;
drop table if exists credit_card;
drop table if exists merchant_category;
drop table if exists merchant;
drop table if exists transaction;

CREATE TABLE card_holder (
	id INT NOT null,
	name VARCHAR(30),
	PRIMARY KEY (id)
);

CREATE TABLE credit_card (
	card VARCHAR(20) NOT NULL,
	cardholder_id INT,
	foreign key (cardholder_id) references card_holder (id),
	PRIMARY KEY (card)
);

CREATE TABLE merchant_category (
	id INT not NULL,
	name VARCHAR(30),
	primary key (id)
);

CREATE TABLE merchant (
	id INT not NULL,
	name VARCHAR(30),
	id_merchant_category INT,
	foreign key (id_merchant_category) references merchant_category (id),
	primary key (id)
);

CREATE TABLE transaction (
	id INT not NULL,
	date TIMESTAMP,
	amount FLOAT,
	card VARCHAR(20),
	id_merchant INT,
	foreign key (card) references credit_card (card),
	foreign key (id_merchant) references merchant (id),
	primary key (id)
);

