{{ config(materialized='table') }}

with o as (

    select *
    from {{ ref('int_orders_margin') }}

),

s as (

    select
        orders_id,
        shipping_fee, 
        ship_cost
    from {{ ref('stg_raw__ship') }}

),

joined as (

    select
        o.orders_id,
        o.date_date,
        -- Calcul de l'opérational margin
        o.margin + s.shipping_fee - s.log_cost - s.ship_cost as operational_margin
    from o
    left join s
        on o.orders_id = s.orders_id
        group by orders_id, date_date
        order by date_date DESC, orders_id DESC
        
      

)