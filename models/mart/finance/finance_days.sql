select
    o.date_date,
    count(distinct o.orders_id) as total_transactions,
    sum(o.revenue) as total_revenue,
    sum(o.revenue) / count(distinct o.orders_id) as average_basket,
    sum(o.margin + s.shipping_fee - s.logcost - s.ship_cost) as total_operational_margin,
    sum(o.purchase_cost) as total_purchase_cost,
    sum(s.shipping_fee) as total_shipping_fees,
    sum(s.logcost) as total_logcosts,
    sum(o.quantity) as total_quantity
from {{ ref('int_orders_margin') }} o
left join {{ ref('stg_raw__ship') }} s
    on o.orders_id = s.orders_id
group by o.date_date
order by o.date_date