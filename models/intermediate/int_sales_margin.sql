select
    sales.orders_id,
    sales.pdt_id,
    sales.date_date,
    sales.quantity,
    sales.revenue,
    cast(product.purchse_price as float64) as purchse_price,
    sales.revenue as revenue_total,
    sales.quantity * cast(product.purchse_price as float64) as purchase_cost,
    (sales.quantity * sales.revenue) - (sales.quantity * cast(product.purchse_price as float64)) as margin
from {{ ref('stg_raw__sales') }} as sales
left join {{ ref('stg_raw__product') }} as product
    on sales.pdt_id = product.products_id