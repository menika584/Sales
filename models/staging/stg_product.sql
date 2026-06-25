WITH src_product AS (
    SELECT *
    FROM {{ source('public', 'product') }}
)

SELECT
    order_id,
    student_id,
    COALESCE(TRIM(INITCAP(student_name)), 'Unknown') AS student_name,
    product_id,
    TRIM(product_name) AS product_name,
    COALESCE(INITCAP(category), 'Unknown') AS category,
    COALESCE(quantity, 1) AS quantity,
    COALESCE(unit_price, 0) AS unit_price,
    COALESCE(quantity, 1) * COALESCE(unit_price, 0) AS total_amount,
    order_date,
    NULLIF(TRIM(INITCAP(city)), '') AS city
FROM src_product
WHERE COALESCE(quantity, 1) > 0