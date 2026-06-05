WITH src_order AS (

    SELECT *
    FROM {{ source('public', 'order') }}

)

SELECT

    trim(order_id) as order_id,

    trim(student_id) as student_id,

    trim(course_id) as course_id,

    trim(customer_name) as customer_name,

    lower(trim(email)) as email,

    trim(product_name) as product_name,

    initcap(trim(category)) as category,

    cast(
        nullif(trim(quantity), '')
        as integer
    ) as quantity,

    cast(
        nullif(trim(price), '')
        as numeric(10,2)
    ) as price,

    cast(order_date as date) as order_date,

    initcap(trim(city)) as city,

    initcap(trim(status)) as status

FROM src_order