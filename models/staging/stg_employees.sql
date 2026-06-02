WITH src_employees AS (
    SELECT * FROM {{ source('public', 'employees') }}
)
SELECT
      employeeid   AS employee_id,
      employeename AS employee_name,
      LOWER(email) AS employee_email,
      department_id,
      salary,
      CAST(joiningdate AS DATE) AS joining_date,
      LOWER(city) AS city
FROM src_employees