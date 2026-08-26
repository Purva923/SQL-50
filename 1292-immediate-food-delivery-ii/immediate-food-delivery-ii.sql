SELECT 
    ROUND(
        SUM(d.order_date = d.customer_pref_delivery_date) * 100.0
        / COUNT(*),
        2
    ) AS immediate_percentage
FROM Delivery d
JOIN (
    SELECT 
        customer_id,
        MIN(order_date) AS first_order_date
    FROM Delivery
    GROUP BY customer_id
) f
ON d.customer_id = f.customer_id
AND d.order_date = f.first_order_date;


/*SELECT ROUND(COUNT(if(order_date=min_od AND customer_pref_delivery_date=min_cpdd )*100/COUNT(DISTINCT customer_id)),2)
AS immediate_percentage
FROM Delivery AS d
JOIN (SELECT customer_id,MIN(order_date) AS min_od ,MIN(customer_pref_delivery_date) 
    AS min_cpdd
    FROM Delivery
    GROUP BY customer_id;) AS t
ON d.customer_id=t.customer_id
GROUP BY customer_id;*/