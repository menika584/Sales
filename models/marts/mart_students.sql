SELECT
    s.student_id,
    s.student_name,
    s.created_date
from {{ ref('stg_students') }} s