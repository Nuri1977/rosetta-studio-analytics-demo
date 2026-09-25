with source as (

    select * from {{ ref('raw_products') }}

),

renamed as (

    select
        id as product_id,
        product_name,
        category,
        unit_price,
        active

    from source

)

select * from renamed
