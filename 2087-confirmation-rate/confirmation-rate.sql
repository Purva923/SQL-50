# Write your MySQL query statement below
SELECT s.user_id,COALESCE(ROUND(SUM(c.action='confirmed')/COUNT(*),2),0) AS confirmation_rate
FROM Signups AS s
LEFT JOIN Confirmations AS c
ON s.user_id=c.user_id
GROUP BY s.user_id;