WITH teachers AS (

    SELECT *
    FROM {{ ref('stg_teachers') }}

),

courses AS (

    SELECT *
    FROM {{ ref('stg_courses') }}

)

SELECT
    c.course_id,
    c.course_name,
    c.teacher_id,
    t.teacher_name,
    t.teacher_email,
    t.subject,
    t.joining_date,
    c.student_id,
    c.price,
    c.course_date,
    c.status

FROM courses c
LEFT JOIN teachers t
    ON c.teacher_id = t.teacher_id