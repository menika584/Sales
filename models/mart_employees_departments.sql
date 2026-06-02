WITH stg_departments AS (

    SELECT *
    FROM {{ ref('stg_departments') }}

),

employee_data AS (

    SELECT *
    FROM {{ ref('stg_employees') }}

)

SELECT
    d.department_id,
    d.department_name,

    -- business metrics
    COUNT(e.employee_id) AS total_employees,
    SUM(e.salary) AS total_salary,
    ROUND(AVG(e.salary), 2) AS avg_salary,
    MAX(e.salary) AS max_salary,
    MIN(e.salary) AS min_salary

FROM stg_departments d
LEFT JOIN employee_data e
    ON d.department_id = e.department_id

GROUP BY
    d.department_id,
    d.department_name