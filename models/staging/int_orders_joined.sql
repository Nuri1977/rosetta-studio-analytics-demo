with orders as (
    select * from {{ ref('stg_orders') }}
),

addresses as (
    select * from {{ ref('stg_customer_addresses') }}
)

select
    o.order_id,
    o.customer_id,
    o.order_date,
    o.status,
    a.city,
    a.state,
    a.country
from orders o
left join addresses a on o.customer_id = a.customer_id
