with 

source as (

    select * from {{ source('raw', 'raw_gz_adwords') }}

),

renamed as (
    SELECT
        camPGN_name AS campaign_name,
        campaign_key,
        date_date,
        paid_source,
        impression,
        click,
        CAST(ads_cost AS FLOAT64) AS ads_cost
    FROM source

)

select * from renamed
