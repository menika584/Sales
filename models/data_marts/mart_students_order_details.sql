WITH students AS (

    SELECT *
    FROM {{ ref('stg_students') }}

),

orders AS (

    SELECT *
    FROM {{ ref('stg_order') }}

)

SELECT

    s.student_id,
    s.student_name,
    s.student_email,
    s.age,
    s.course_id,

    COUNT(o.order_id) AS total_orders,

    SUM(o.quantity) AS total_quantity,

    SUM(o.quantity * o.price) AS total_spent,

    MIN(o.order_date) AS first_order_date,

    MAX(o.order_date) AS last_order_date

FROM students s
LEFT JOIN orders o
    ON CAST(s.student_id AS VARCHAR) = o.student_id

GROUP BY
    s.student_id,
    s.student_name,
    s.student_email,
    s.age,
    s.course_id