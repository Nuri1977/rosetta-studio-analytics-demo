
with monthly_revenue as (
    select
        date_trunc('month', order_date) as order_month,
        sum(total_amount) as monthly_revenue
    from {{ ref('fct_orders') }}
    group by 1
)

select
    order_month,
    monthly_revenue
from monthly_revenue
order by 1
