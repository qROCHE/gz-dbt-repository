SELECT
    f.date_date AS date_date,
    (f.total_operational_margin - i.ads_cost) AS ads_margin,
    f.average_basket,
    f.total_operational_margin,
    i.ads_cost,
    i.ads_impression,
    i.ads_clicks,
    f.total_quantity,
    f.total_shipping_fees,
    f.total_logcosts, 
    f.total_purchase_cost
FROM {{ ref('finance_days') }} f
LEFT JOIN {{ ref('int_campaigns_day') }} i
    ON f.date_date = i.date_date
ORDER BY f.date_date DESC