SELECT ROUND(
            SUM(
                IF(
                    d.order_date=t.min_order_date AND d.order_date=d.customer_pref_delivery_date,1,0
                    )
                )*100/SUM(
                        IF(
                            d.order_date=t.min_order_date,1,0
                        )
                ),2
            )  AS immediate_percentage
FROM delivery AS d
JOIN (SELECT customer_id,
    MIN(order_date) AS min_order_date 
    FROM Delivery
    GROUP BY customer_id) AS t 
ON t.customer_id=d.customer_id;



