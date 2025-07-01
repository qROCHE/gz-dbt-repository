{{ config(materialized='table') }}



select
  orders_id,
  date_date as date_date,
  SUM(quantity) as quantity,
  SUM(revenue) as revenue,
  SUM(purchase_cost) as purchase_cost,
  SUM(margin) as margin
from {{ ref('int_sales_margin') }}
group by orders_id, date_date
        

