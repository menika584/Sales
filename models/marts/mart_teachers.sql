WITH teachers AS (
    SELECT * FROM {{ ref('stg_teachers') }}
)

SELECT
    teacher_id,
    teacher_name,
    teacher_email,
    subject,
    joining_date
FROM teachers