WITH products AS (

    SELECT *
    FROM {{ ref('stg_products') }}

)

SELECT
    category,
    brand,
    COUNT(product_id) AS total_products,
    AVG(cost_price) AS avg_cost_price,
    MAX(cost_price) AS max_cost_price,
    MIN(cost_price) AS min_cost_price

FROM products

GROUP BY
    category,
    brand