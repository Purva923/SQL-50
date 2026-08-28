# Write your MySQL query statement below
SELECT d.name AS Department,e.Employee,e.Salary
FROM (
    SELECT departmentId,name AS Employee,salary AS Salary,
    DENSE_RANK() OVER (
        PARTITION BY departmentId
        ORDER BY salary DESC
    ) AS rnk FROM Employee
) AS e
INNER JOIN Department AS d
ON e.departmentId=d.id
WHERE e.rnk<=3;