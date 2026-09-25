with source as (

    select * from {{ ref('raw_customer_addresses') }}

),

renamed as (

    select
        address_id,
        customer_id,
        address_type,
        city,
        state,
        country,
        valid_from,
        valid_to,
        is_current

    from source

)

select * from renamed
