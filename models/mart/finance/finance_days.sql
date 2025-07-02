

select
    o.date_date,
    count(distinct o.orders_id) as total_transactions,
    sum(o.revenue) as total_revenue,
    sum(o.revenue) / count(distinct o.orders_id) as average_basket,
    sum(
        CAST(o.margin AS FLOAT64)
        + CAST(s.shipping_fee AS FLOAT64)
        - CAST(s.logcost AS FLOAT64)
        - CAST(s.ship_cost AS FLOAT64)
    ) as total_operational_margin,
    sum(o.purchase_cost) as total_purchase_cost,
    sum(CAST(s.shipping_fee AS FLOAT64)) as total_shipping_fees,
    sum(CAST(s.logcost AS FLOAT64)) as total_logcosts,
    sum(o.quantity) as total_quantity
from {{ ref('int_orders_margin') }} o
left join {{ ref('stg_raw__ship') }} s
    on o.orders_id = s.orders_id
group by o.date_date
order by o.date_date