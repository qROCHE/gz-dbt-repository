
SELECT
    FORMAT_DATE('%Y-%m', f.date_date) AS datemonth,
    SUM(f.total_operational_margin) - SUM(i.ads_cost) AS ads_margin,
    AVG(f.average_basket) AS average_basket,
    SUM(f.total_operational_margin) AS total_operational_margin,
    SUM(i.ads_cost) AS ads_cost,
    SUM(i.ads_impression) AS ads_impression,
    SUM(i.ads_clicks) AS ads_clicks,
    SUM(f.total_quantity) AS total_quantity,
    SUM(f.total_purchase_cost) AS total_purchase_cost,
    SUM(f.total_shipping_fees) AS total_shipping_fees,
    SUM(f.total_logcosts) AS total_logcosts,
FROM {{ ref('finance_campaigns_day') }} f
LEFT JOIN {{ ref('int_campaigns_day') }} i
    ON f.date_date = i.date_date
GROUP BY datemonth
ORDER BY datemonth DESC

