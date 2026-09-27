
with customer_orders as (
    select
        customer_id,
        count(order_id) as total_orders,
        sum(total_amount) as lifetime_value
    from {{ ref('fct_orders') }}
    group by 1
)

select
    c.customer_id,
    c.first_name,
    c.last_name,
    co.total_orders,
    co.lifetime_value
from {{ ref('dim_customers') }} c
left join customer_orders co on c.customer_id = co.customer_id
