SELECT
    s.student_id,
    s.student_name,
    s.student_email,
    c.course_id,
    c.course_name,
    c.teacher_id,
    c.price AS course_price,
    o.order_id,
    o.customer_name,
    o.quantity,
    o.price AS order_price,
    o.order_date,
    o.city,
    o.status AS order_status
FROM {{ ref('stg_students') }} s
LEFT JOIN {{ ref('stg_courses') }} c
    ON s.course_id = c.course_id
LEFT JOIN {{ ref('stg_order') }} o
    ON CAST(s.student_id AS VARCHAR) = o.student_id
    AND CAST(c.course_id AS VARCHAR) = o.course_id
