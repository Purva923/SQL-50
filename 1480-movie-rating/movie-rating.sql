(
SELECT u.name AS results FROM Users AS u 
INNER JOIN MovieRating AS m
ON m.user_id=u.user_id
GROUP BY u.user_id
ORDER BY COUNT(*) DESC ,u.name 
LIMIT 1
)

UNION ALL

(
SELECT m.title AS results FROM Movies AS m
INNER JOIN MovieRating AS mr
ON m.movie_id=mr.movie_id
WHERE mr.created_at >= '2020-02-01'
AND mr.created_at < '2020-03-01'
GROUP BY m.movie_id
ORDER BY AVG(rating) DESC ,m.title
LIMIT 1
);