# Fintech_Module6_Challenge_SQL: Looking for Suspicious Transactions

## Data Modelling
**Entity Relationship Diagram (ERD)**
![](https://github.com/Karthi-k-a/Fintech_Module7_Challenge_SQL/blob/main/Images/erd.png)

## Data Engineering
The files for schema and query are included in the `data` folder.

## Data Analysis - Part 1

**How can you isolate (or group) the transactions of each cardholder?** <br>
The `transaction` table contains all transactions with the card number. To relate card number to cardholder, we must first join tables `card_holder` and `credit_card` using columns `id` and `cardholder_id` respectively. And then, we must join tables `credit_card` and `transaction` using column `card`. By performing these joins, we can isolate the transactions of each cardholder.

**Count the transactions that are less than $2.00 per cardholder** <br>
The `small_tran_cardholder` view in queries.sql shows the transactions that are less than $2.00 per cardholder. The file is included in the `data` folder.

**Is there any evidence to suggest that a credit card has been hacked?** <br>
Transactions less than $2 seems reasonable given the merchants in our dataset which includes restaurants, bars, coffee shops, pubs and food trucks.  

**What are the top 100 highest transactions made between 7:00 am and 9:00 am?** <br>
The `high_tran_7to9` view in queries.sql shows the transactions made between 7:00 am and 9:00 am. The file is included in the `data` folder.

**Do you see any anomalous transactions that could be fraudulent?** <br>
There are 8 transactions above $1000 and 4 transactions between $100 and $1000. It seems a little odd considering the merchants and the timing (7 am to 9 am). But again, there is a possibility that the card was used to purchase for a larger group.

**Is there a higher number of fraudulent transactions made during this time frame versus the rest of the day?** <br>
No. The `high_tran_not7to9` view in queries.sql shows the transactions made outside 7:00 am to 9:00 am. The file is included in the `data` folder. Most of the transactions in this view are more than $1000. This is possible as dinner parties and get togethers happen mostly later during the day. 


## Data Analysis - Part 2

**Transaction Data for Card Holder ID 2**
![](https://github.com/Karthi-k-a/Fintech_Module7_Challenge_SQL/blob/main/Images/cardholder_2.png)

**Transaction Data for Card Holder ID 18**
![](https://github.com/Karthi-k-a/Fintech_Module7_Challenge_SQL/blob/main/Images/cardholder_18.png)

**Combined Transaction Data for Card Holder IDs 2 and 18**
![](https://github.com/Karthi-k-a/Fintech_Module7_Challenge_SQL/blob/main/Images/cardholder_2and18.png)

**What difference do you observe between the consumption patterns? Does the difference suggest a fraudulent transaction?** <br>
Cardholder 2 averages purchases between $2 and $20 on a consistent basis whereas cardholder 18 has larger transaction values at irregular intervals. This could mean that cardholder 18 has been a victim of fraud or it could just be that cardholder 18 prefers to use cash for small purchases and credit card for larger purchases.

**Box plot representing the expenditure data from January 2018 to June 2018 for cardholder ID 25**
![](https://github.com/Karthi-k-a/Fintech_Module7_Challenge_SQL/blob/main/Images/cardholder_25.png)

**Are there any outliers for cardholder ID 25? How many outliers are there per month?** <br>
There are quite a few outliers for cardholder 25. There is 1 outlier in January, March and May; and 3 outliers in April and June.
