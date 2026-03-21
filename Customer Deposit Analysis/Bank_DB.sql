-- Create and switch to the working database
CREATE DATABASE Bank_DB;
USE Bank_DB;

-- Check if the database exists
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'Bank_DB')
    PRINT 'Database exists';
ELSE
    PRINT 'Database does NOT exist';

-- Count total number of customers in the dataset
SELECT COUNT(*) AS [Total Customers]
FROM bank_data;

-- Get summary statistics for age and account balance
SELECT 
    MIN(age) AS [Minimum Age],
    MAX(age) AS [Maximum Age],
    AVG(age) AS [Average Age],
    AVG(balance) AS [Average Balance]
FROM bank_data;

-- Show distribution of customers who subscribed vs not subscribed
SELECT 
    deposit,
    COUNT(*) AS total,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM bank_data
GROUP BY deposit;

-- Analyze deposit subscription rate across different job categories
SELECT 
    job,
    COUNT(*) AS [Total Customers],
    SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) AS [Subscribers],
    CAST(
        100.0 * SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) / COUNT(*) 
        AS DECIMAL(10,2)
    ) AS [Conversion Rate]
FROM bank_data
GROUP BY job
ORDER BY [Conversion Rate] DESC;

-- Analyze how education level affects deposit subscription
SELECT 
    education,
    COUNT(*) AS [Total Customers],
    SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) AS [Subscribed],
    CAST(
        ROUND(
            100.0 * SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) / COUNT(*), 
            2
        ) AS DECIMAL(10,2)
    ) AS [Conversion Rate]
FROM bank_data
GROUP BY education
ORDER BY [Conversion Rate] DESC;

-- Compare subscription behavior based on housing status
SELECT 
    housing,
    COUNT(*) AS [Total Customer],
    SUM(CAST(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END AS INT)) AS Subscribed,
    ROUND(
        CAST(SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) AS FLOAT) * 100.0 / COUNT(*), 2
    ) AS [Conversion Rate]
FROM bank_data
GROUP BY housing
ORDER BY [Conversion Rate] DESC; 

-- Group customers by balance level and analyze subscription patterns
SELECT 
    CASE 
        WHEN balance < 0 THEN 'Negative Balance'
        WHEN balance BETWEEN 0 AND 1000 THEN 'Low Balance'
        WHEN balance BETWEEN 1001 AND 5000 THEN 'Medium Balance'
        ELSE 'High Balance'
    END AS [Balance Group],
    COUNT(*) AS [Total Customer],
    SUM(CAST(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END AS INT)) AS Subscribed,
    ROUND(
        CAST(SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) AS FLOAT) * 100.0 / COUNT(*), 2
    ) AS [Conversion Rate]
FROM bank_data
GROUP BY 
    CASE 
        WHEN balance < 0 THEN 'Negative Balance'
        WHEN balance BETWEEN 0 AND 1000 THEN 'Low Balance'
        WHEN balance BETWEEN 1001 AND 5000 THEN 'Medium Balance'
        ELSE 'High Balance'
    END
ORDER BY [Conversion Rate] DESC;

-- Identify top months with the highest number of successful deposits
SELECT TOP 6
    month,
    COUNT(*) AS [Total Deposits]
FROM bank_data
WHERE deposit = 'yes'
GROUP BY month
ORDER BY [Total Deposits] DESC;

-- Analyze how personal loan status affects deposit subscription
SELECT 
    CASE 
        WHEN loan = 1 THEN 'yes'
        WHEN loan = 0 THEN 'no'
    END AS [Loan Status],
    COUNT(*) AS [Total Customers],
    SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) AS Subscribed,
    CAST(
        ROUND(
            100.0 * SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) / COUNT(*), 
            2
        ) AS DECIMAL(10,2)
    ) AS [Conversion Rate]
FROM bank_data
GROUP BY 
    CASE 
        WHEN loan = 1 THEN 'yes'
        WHEN loan = 0 THEN 'no'
    END
ORDER BY  [Conversion Rate] DESC;