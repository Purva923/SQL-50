# Write your MySQL query statement below
SELECT ROUND(
    SUM(IF(t.min_date+INTERVAL 1 DAY=event_date,1,0))/COUNT(DISTINCT t.player_id),2)AS fraction
FROM(
    SELECT
    player_id,
    MIN(event_date) AS min_date
    FROM Activity
    GROUP BY player_id
) AS t
INNER JOIN Activity AS a
ON a.player_id=t.player_id;