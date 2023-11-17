{{config(materialized='table')}}

SELECT
 s.SELLER_ID as seller_id,
 s.SELLER_ZIP_CODE_PREFIX as seller_zip_code_prefix,
 s.SELLER_CITY as seller_city,
 s.SELLER_STATE as seller_state,
 h.GEOLOCATION_LAT as seller_geo_lat,
 h.GEOLOCATION_LNG as seller_geo_lng
FROM {{ref('sellers')}} s
LEFT JOIN {{ref('geolocation')}} h  
    on s.SELLER_ZIP_CODE_PREFIX = h.GEOLOCATION_ZIP_CODE_PREFIX
    and s.SELLER_CITY = h.GEOLOCATION_CITY
    and s.SELLER_STATE = h.GEOLOCATION_STATE
WHERE s.SELLER_ID is not null
QUALIFY ROW_NUMBER() OVER (PARTITION BY s.SELLER_ID ORDER BY h.GEOLOCATION_LAT, h.GEOLOCATION_LNG DESC) = 1