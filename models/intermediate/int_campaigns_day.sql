SELECT
    date_date,
    SUM(impression) AS ads_impression,
    SUM(click) AS ads_clicks,
    SUM(ads_cost) AS ads_cost
FROM {{ ref('int_campaigns') }}
GROUP BY date_date
ORDER BY date_date DESC