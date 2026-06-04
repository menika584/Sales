WITH students AS (

    SELECT *
    FROM {{ ref('stg_students') }}

),

courses AS (

    SELECT *
    FROM {{ ref('stg_courses') }}

),

teachers AS (

    SELECT *
    FROM {{ ref('stg_teachers') }}

)

SELECT
    s.student_id,
    s.student_name,
    s.student_email,
    s.age,
    c.course_id,
    c.course_name,
    c.price,
    c.course_date,
    c.status,
    t.teacher_id,
    t.teacher_name,
    t.teacher_email,
    t.subject,
    t.joining_date
FROM students s
LEFT JOIN courses c
    ON s.course_id = c.course_id
LEFT JOIN teachers t
    ON c.teacher_id = t.teacher_id