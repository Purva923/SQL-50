SELECT 
    'Low Salary' AS Category,
    SUM(income<20000) AS accounts_count
FROM Accounts

UNION ALL 

SELECT 
    'Average Salary' AS Category,
    SUM(income BETWEEN 20000 AND 50000) AS accounts_count
FROM Accounts

UNION ALL

SELECT 
    'High Salary' AS Category,
    SUM(income>50000) AS accounts_count
FROM Accounts;