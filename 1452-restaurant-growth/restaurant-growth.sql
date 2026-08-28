# Write your MySQL query statement below
SELECT c1.visited_on,SUM(c2.amount) AS amount,ROUND(SUM(c2.amount)/7,2) AS average_amount
FROM (
    SELECT visited_on FROM Customer 
    WHERE visited_on>=(SELECT MIN(visited_on) FROM Customer)+ INTERVAL 6 DAY
    GROUP BY visited_on
) AS c1
INNER JOIN Customer AS c2
ON c1.visited_on BETWEEN c2.visited_on AND c2.visited_on+INTERVAL 6 DAY
GROUP BY c1.visited_on
ORDER BY c1.visited_on;

