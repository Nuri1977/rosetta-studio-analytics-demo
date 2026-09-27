with products as (
    select * from {{ ref('stg_products') }}
)

select
    product_id,
    product_name,
    category,
    unit_price,
    case
        when unit_price < 10 then 'Economy'
        when unit_price >= 10 and unit_price < 50 then 'Standard'
        else 'Premium'
    end as price_segment
from products
