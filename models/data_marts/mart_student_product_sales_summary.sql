WITH stg_product AS (

    SELECT *
    FROM {{ ref('stg_product') }}

)

SELECT
    student_id,
    student_name,
    COUNT(order_id) AS total_orders,
    SUM(quantity) AS total_quantity,
    SUM(total_amount) AS total_sales
FROM stg_product
GROUP BY
    student_id,
    student_name
ORDER BY total_sales DESC