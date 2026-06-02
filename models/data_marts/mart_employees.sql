with stg_employees as (

    select *
    from {{ ref('stg_employees') }}

)
    select
        employee_id,
        employee_name,
        employee_email,
        department_id,
        city,
        joining_date,
        salary,

        -- business logic
        extract(year from joining_date) as joining_year,

        case
            when salary >= 80000 then 'High'
            when salary >= 60000 then 'Medium'
            else 'Low'
        end as salary_band,

        current_date - joining_date as days_with_company

    from stg_employees
