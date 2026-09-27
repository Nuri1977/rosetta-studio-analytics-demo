{{
  config(
    materialized='incremental',
    unique_key='order_id'
  )
}}

with orders as (
    select * from {{ ref('stg_orders') }}
),

payments as (
    select * from {{ ref('stg_payments') }}
),

order_items as (
    select * from {{ ref('stg_order_items') }}
),

final as (
    select
        o.order_id,
        o.customer_id,
        o.order_date,
        o.status,
        sum(p.amount) as total_amount,
        count(oi.order_item_id) as items_count
    from orders o
    left join payments p on o.order_id = p.order_id
    left join order_items oi on o.order_id = oi.order_id
    
    {% if is_incremental() %}
      where o.order_date > (select max(order_date) from {{ this }})
    {% endif %}

    group by 1, 2, 3, 4
)

select * from final
