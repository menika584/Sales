WITH src_company AS (
    SELECT *
    FROM {{ ref('stg_company') }}
)

SELECT
    company_id,
    company_name,
    employee_id,
    location,
    joining_date
FROM src_company