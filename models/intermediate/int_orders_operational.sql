

select
    o.orders_id,
    o.date_date,
    o.margin,
    CAST(s.shipping_fee as FLOAT64) as shipping_fee,
    CAST(s.logcost as FLOAT64) as logcost,
    cast(ship_cost as float64) as ship_cost,
    CAST(o.margin as FLOAT64)
      + CAST(s.shipping_fee as FLOAT64)
      - CAST(s.logcost as FLOAT64)
      - CAST(s.ship_cost as FLOAT64) as operational_margin
from {{ ref('int_sales_margin') }} o
left join {{ ref('stg_raw__ship') }} s
    on o.orders_id = s.orders_id