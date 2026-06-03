WITH src_sales AS (

    SELECT *
    FROM {{ source('public', 'sales') }}

)

SELECT
    saleid AS sale_id,
    proid AS product_id,
    INITCAP(TRIM(customername)) AS customer_name,
    quantity,
    selling_price,
    quantity * selling_price AS revenue,
    CAST(REPLACE(saledate, '/', '-') AS DATE) AS sale_date,
    INITCAP(TRIM(city)) AS city,
    LOWER(TRIM(status)) AS status

FROM src_sales