WITH src_teachers AS (
    SELECT * FROM {{ source('public', 'teachers') }}
)
SELECT
      teacherID as teacher_id,
      teacherName as teacher_name,
      LOWER(email) AS teacher_email,
      subject,
      CAST(joiningDate AS DATE) AS joining_date
FROM src_teachers