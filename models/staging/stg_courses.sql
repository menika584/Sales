WITH src_course AS (
    SELECT *
    FROM {{ source('public', 'courses') }}
)

SELECT
    courseID AS course_id,
    courseName AS course_name,
    teacher_id,
    student_id,
    price,
    course_date,
    LOWER(status) AS status
FROM src_course