WITH src_departments AS (

    SELECT *
    FROM {{ source('public', 'departments') }}

)

SELECT
    departmentid   AS department_id,
    departmentname AS department_name

FROM src_departments