WITH sales AS (

    SELECT *
    FROM {{ ref('stg_sales') }}

),

products AS (

    SELECT *
    FROM {{ ref('stg_products') }}

)

SELECT
    p.category,
    p.brand,

    COUNT(s.sale_id) AS total_orders,
    SUM(s.quantity) AS total_quantity_sold,
    SUM(s.revenue) AS total_revenue,

    ROUND(AVG(s.revenue), 2) AS avg_order_value,

    SUM(
        s.revenue - (s.quantity * p.cost_price)
    ) AS total_profit

FROM sales s
LEFT JOIN products p
    ON s.product_id = p.product_id

GROUP BY
    p.category,
    p.brand