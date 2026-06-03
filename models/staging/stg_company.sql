WITH src_company AS (
    SELECT *
    FROM {{ source('public', 'company') }}
)

SELECT
      comid as company_id,
      INITCAP(TRIM(comname)) AS company_name,
      empid AS employee_id,
      INITCAP(TRIM(location)) AS location,
      CAST(joiningdate AS DATE) AS joining_date
FROM src_company