SELECT * FROM card_holder;
SELECT * FROM credit_card;
SELECT * FROM merchant;
SELECT * FROM merchant_category;
SELECT * FROM transaction;

-- Count the transactions that are less than $2.00 per cardholder
CREATE VIEW small_tran_cardholder AS 
SELECT name, COUNT(*)
FROM card_holder AS a
JOIN credit_card AS b ON a.id = b.cardholder_id
JOIN transaction AS c ON b.card = c.card
WHERE amount < 2.00 
GROUP BY name

-- Count the transactions that are less than $2.00 per credit card
CREATE VIEW small_tran_cardnumber AS 
SELECT a.card, COUNT(*)
FROM credit_card AS a 
JOIN transaction AS b ON a.card = b.card
WHERE amount < 2.00 
GROUP BY a.card

-- Top 100 highest transactions made between 7:00 am and 9:00 am
CREATE VIEW high_tran_7to9 AS 
SELECT * FROM transaction 
WHERE EXTRACT (HOUR FROM date) >= 7 AND EXTRACT (HOUR FROM date) <= 9
ORDER BY amount DESC LIMIT 100

-- Top 100 highest transactions made at times other than between 7:00 am and 9:00 am
CREATE VIEW high_tran_not7to9 AS 
SELECT * FROM transaction 
WHERE EXTRACT (HOUR FROM date) < 7 OR EXTRACT (HOUR FROM date) > 9
ORDER BY amount DESC LIMIT 100

-- Top 5 merchants prone to being hacked using small transactions
CREATE VIEW small_tran_merchants AS 
SELECT name, COUNT(*)
FROM merchant AS a
JOIN transaction AS b ON a.id = b.id_merchant
WHERE amount < 2.00 
GROUP BY name
ORDER BY COUNT(*) DESC

SELECT * FROM small_tran_cardholder;
SELECT * FROM small_tran_cardnumber;
SELECT * FROM high_tran_7to9;
SELECT * FROM high_tran_not7to9;
SELECT * FROM small_tran_merchants;