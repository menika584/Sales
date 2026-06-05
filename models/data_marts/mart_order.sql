WITH orders AS (

SELECT *
FROM {{ ref('stg_order') }}

)
SELECT


category,

COUNT(order_id) AS total_orders,

SUM(quantity) AS total_quantity,

SUM(quantity * price) AS total_revenue,

ROUND(
    SUM(quantity * price) / COUNT(order_id),
    2
) AS avg_order_value

FROM orders

GROUP BY category
