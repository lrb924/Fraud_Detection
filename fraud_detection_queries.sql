-- How can you isolate (or group) the transactions of each card holder?
SELECT ch.name, cc.card, t.date, t.amount, m.name AS merchant, mc.name AS category
FROM transaction AS t
JOIN credit_card AS cc ON cc.card = t.card
JOIN card_holder AS ch ON ch.id = cc.cardholder_id
JOIN merchant AS m ON m.id = t.id_merchant
JOIN merchant_category AS mc ON mc.id = m.id_merchant_category
ORDER BY ch.name;

CREATE VIEW transactions_per_card_holder AS
 SELECT ch.name, cc.card, t.date, t.amount, m.name AS merchant, mc.name AS category
 FROM transaction AS t
 JOIN credit_card AS cc ON cc.card = t.card
 JOIN card_holder AS ch ON ch.id = cc.cardholder_id
 JOIN merchant AS m ON m.id = t.id_merchant
 JOIN merchant_category AS mc ON mc.id = m.id_merchant_category
 ORDER BY ch.name;


-- Count the transactions that are less than $2.00 per card holder.
SELECT COUNT(t.amount) AS "Transactions less than $2.00"
FROM transaction AS t
WHERE t.amount < 2;

SELECT *
FROM transaction AS t
WHERE t.amount < 2
ORDER BY t.card, t.amount DESC;

CREATE VIEW transactions_less_than_2 AS
 SELECT *
 FROM transaction AS t
 WHERE t.amount < 2
 ORDER BY t.card, t.amount DESC;

CREATE VIEW count_transactions_less_than_2 AS
 SELECT COUNT(t.amount) AS "Transactions less than $2.00"
 FROM transaction AS t
 WHERE t.amount < 2;


-- What are the top 100 highest transactions during 7am and 9am?
SELECT *
FROM transaction AS t
WHERE date_part('hour', t.date) >= 7 AND date_part('hour', t.date) < 9
ORDER BY amount DESC
LIMIT 100;

CREATE VIEW highest_transactions_morning AS
 SELECT *
 FROM transaction AS t
 WHERE date_part('hour', t.date) >= 7 AND date_part('hour', t.date) < 9
 ORDER BY amount DESC
 LIMIT 100;


-- Transactions less than $2.00 per card holder and made between 7am and 9am. Are more fraudulent transactions made during this time frame versus the rest of the day?
SELECT COUNT(t.amount) AS "Transactions less than $2.00 between 7am and 9am"
FROM transaction AS t
WHERE t.amount < 2 
AND date_part('hour', t.date) >= 7 
AND date_part('hour', t.date) < 9;

CREATE VIEW count_low_transactions_morning AS
 SELECT COUNT(t.amount) AS "Transactions less than $2.00 between 7am and 9am"
 FROM transaction AS t
 WHERE t.amount < 2 
 AND date_part('hour', t.date) >= 7 
 AND date_part('hour', t.date) < 9;


-- What are the top 5 merchants prone to being hacked using small transactions?
SELECT m.name AS merchant, mc.name AS category, COUNT(t.amount) AS low_transactions
FROM transaction AS t
JOIN merchant AS m ON m.id = t.id_merchant
JOIN merchant_category AS mc ON mc.id = m.id_merchant_category
WHERE t.amount < 2
GROUP BY m.name, mc.name
ORDER BY low_transactions DESC
LIMIT 5;

CREATE VIEW top_hacked_merchants_low_transactions AS
 SELECT m.name AS merchant, mc.name AS category,
 COUNT(t.amount) AS low_transactions
 FROM transaction AS t
 JOIN merchant AS m ON m.id = t.id_merchant
 JOIN merchant_category AS mc ON mc.id = m.id_merchant_category
 WHERE t.amount < 2
 GROUP BY m.name, mc.name
 ORDER BY low_transactions DESC
 LIMIT 5;