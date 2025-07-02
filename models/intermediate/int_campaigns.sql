select
  'adwords' as source,
  campaign_key,
  campaign_name,
  paid_source,
  ads_cost,
  date_date,
  impression,
  click
from {{ ref('stg_raw_adwords') }}  

union all

select
  'bing' as source,
  campaign_key,
  campaign_name,
  paid_source,
  ads_cost,
  date_date,
  impression,
  click
from {{ ref('stg_raw_bing') }}

union all

select
  'criteo' as source,
  campaign_key,
  campaign_name,
  paid_source,
  ads_cost,
  date_date,
  impression,
  click
from {{ ref('stg_raw_criteo') }}

union all

select
  'facebook' as source,
  campaign_key,
  campaign_name,
  paid_source,
  ads_cost,
  date_date,
  impression,
  click
from {{ ref('stg_raw_facebook') }}