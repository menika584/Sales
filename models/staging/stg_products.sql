WITH src_products AS (
    SELECT * FROM {{ source('public', 'products') }}
)
SELECT
      proid as product_id,
      INITCAP(TRIM(proname)) AS product_name,
      INITCAP(TRIM(category)) AS category,
      INITCAP(TRIM(brand)) AS brand,
      COALESCE(cost_price, 0) AS cost_price
FROM src_products