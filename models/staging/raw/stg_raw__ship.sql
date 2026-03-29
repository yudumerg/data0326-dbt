with 

source as (

    select * from {{ source('raw', 'ship') }}

),

renamed as (

    select
        orders_id,
        shipping_fee,
        shipping_fee_1,
        logcost,
        ship_cost

    from source

)

   select
        shipping_fee,
        cast(ship_cost as float64) as ship_cost

    from renamed
    
    where shipping_fee <> shipping_fee_1
