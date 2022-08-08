# Module 7 Challenge: Fraud Detection

### Package Requirments
`pip install x` where x is the below listed packages
* pandas
* hvPlot
* calendar
* SQLAlchemy
  
### Purpose of Use
* Use pandas to check out csv files before creating a PostgreSQL database in order to organize tables and manipulate data contained in the csv files. Using this data, answer two questions in order to determine if fraudulent activity is present in any cardholder's transactions on their credit cards.
* The analysis is in three parts:

    1. Investigate Provided CSV Files Using Pandas
       1. Create dataframes in order to get table information without having to open the unknown csv files.

    2. Create a PostgreSQL Database
       1. Create a new database using the csv files that contain the required tables, and use a sql query to add that data to the newly created tables in the database.

    3. Data Analysis
       1. Use supplied notebook to create and analyze data visualizations and answer required questions.

### Files Navigation
* Data: Folder containing all relevant csv files to construct tables contained in the database
* `Data Exploration.ipynb`: Data exploration including investigating csv files and obtaining table column names
* `visual_data_analysis.ipynb`: Notebook to query the database and generate visualizations that supply the requested information
* `ERD.png`: image file of the ERD
* `fraud_detection.sql`: The .sql file of the table schemata

### Solution
Question 1: What difference do you observe between the consumption patterns between Cardholder 2 and Cardholder 18? Does the difference suggest a fraudulent transaction?

When analyzing the visual plots of both Cardholder 2 and Cardholder 18's transactions, it can be reasonably concluded that Cardholder 18 may have fraudulent transactions. This is based on the random spikes throughout the year that greatly differ from the majority of the transactions, especially compared to the more stable pattern of transactions from Cardholder 2.

Below is the plot of Cardholder 2's transactions, which do not show any unusual activity that can be cateforized as potential fraud.

![Cardholder 2 Transactions](https://github.com/lrb924/Module_7_Challenge/blob/main/Visualizations/Cardholder%202.png?raw=true)

Below is the plot of Cardholder 18's transactions, which show a handful of transactions that are not like the others and could possibly be considered fraud. 

![Cardholder 18 Transactions](https://github.com/lrb924/Module_7_Challenge/blob/main/Visualizations/Cardholder%2018.png?raw=true)

And here is the combined plot to clearly display the distinctions between normal transactions and fraudulent ones.

![Combined Transactions](https://github.com/lrb924/Module_7_Challenge/blob/main/Visualizations/Combined.png?raw=true)

Question 2: Do you notice any anomalies for Cardholder 25? Describe your observations and conclusions.

By analyzing the box plot above, it can be concluded that Cardholder 25 has fraudulent activity on their card for five out of the six months. It appears that April and June were especially concerning with each month containing three outlier transactions, which can be categorized as fraudulent.

Below is the box plot of Cardholder 25's transactions. It's clear there are anomalies which can be considered fraud. 

![Cardholder 25 Transactions](https://github.com/lrb924/Module_7_Challenge/blob/main/Visualizations/Cardholder%2025.png?raw=true)






