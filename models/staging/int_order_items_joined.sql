-- models/staging/int_order_items_joined.sql

with order_items as (
    select * from {{ ref('stg_order_items') }}
),

products as (
    select * from {{ ref('stg_products') }}
)

select
    oi.order_item_id,
    oi.order_id,
    oi.product_id,
    p.product_name,
    p.category,
    oi.price as item_price
from order_items oi
left join products p on oi.product_id = p.product_id
