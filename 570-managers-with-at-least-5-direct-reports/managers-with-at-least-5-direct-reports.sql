# Write your MySQL query statement below
SELECT e2.name FROM Employee AS e1
INNER JOIN Employee AS e2
ON e1.managerId=e2.id
GROUP BY e2.id,e2.name
HAVING COUNT(e1.managerId)>=5