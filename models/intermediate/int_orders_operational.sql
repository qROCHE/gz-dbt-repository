{{ config(materialized='table') }}

select
    o.orders_id,
    o.date_date,
    o.margin,
    s.shipping_fee,
    s.logcost,
    s.ship_cost,
    o.margin + s.shipping_fee - s.logcost - s.ship_cost as operational_margin
from {{ ref('int_sales_margin') }} o
left join {{ ref('stg_raw__ship') }} s
    on o.orders_id = s.orders_id