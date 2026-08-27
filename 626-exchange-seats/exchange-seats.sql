# Write your MySQL query statement below
SELECT id,student FROM(
    SELECT CASE 
            WHEN id=(SELECT COUNT(*) FROM Seat) AND id%2=1
            THEN id
            WHEN id%2=0 THEN id-1
            WHEN id%2=1 THEN id+1
        END AS id,student
        FROM Seat
) AS t
ORDER BY id;