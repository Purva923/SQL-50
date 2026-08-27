SELECT p1.product_id,
       IF(p2.max_change_date IS NULL, 10, p1.new_price) AS price
FROM Products AS p1
INNER JOIN (
    SELECT product_id, MAX(change_date) AS max_change_date
    FROM Products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
) AS p2
ON p1.product_id = p2.product_id
AND p1.change_date = p2.max_change_date

UNION ALL
SELECT product_id,10 AS price FROM Products
GROUP BY product_id
HAVING MIN(change_date)>'2019-08-16';