with company as (
    select *
    from {{ ref('stg_company') }}
),

employees as (
    select *
    from {{ ref('stg_employees') }}
),

departments as (
    select *
    from {{ ref('stg_departments') }}
)

select
    -- Company
    c.company_id,
    c.company_name,
    c.location,

    -- Employee
    e.employee_id,
    e.employee_name,
    e.employee_email,
    e.salary,
    e.joining_date,
    e.city,

    -- Department
    d.department_id,
    d.department_name

from company c
left join employees e
    on c.employee_id = e.employee_id

left join departments d
    on e.department_id = d.department_id