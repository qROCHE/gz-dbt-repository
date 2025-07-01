{{ config(materialized='table') }}

with sales as (

    select *
    from {{ ref('stg_raw__sales') }}

),

product as (

    select *
    from {{ ref('stg_raw__product') }}

),

joined as (

    select
        sales.orders_id,
        sales.products_id,
        sales.quantity,
        sales.price,
        product.purchase_price,
        sales.quantity * sales.price as revenue,
        sales.quantity * product.purchase_price as purchase_cost,
        (sales.quantity * sales.price) - (sales.quantity * product.purchase_price) as margin
    from sales
    left join product
        on sales.products_id = product.products_id

)

select *
from joined