WITH students AS (

    SELECT *
    FROM {{ ref('stg_students') }}

),

courses AS (

    SELECT *
    FROM {{ ref('stg_courses') }}

)

SELECT
    s.student_id,
    s.student_name,
    s.student_email,
    s.age,
    c.course_id,
    c.course_name,
    c.teacher_id,
    c.price,
    c.course_date,
    c.status,
    s.created_date

FROM students s
LEFT JOIN courses c
    ON s.student_id = c.student_id