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
    on s.seller_zip_code_prefix = h.GEOLOCATION_ZIP_CODE_PREFIX
    and s.seller_city = h.GEOLOCATION_CITY
    and s.seller_state = h.GEOLOCATION_STATE
WHERE s.seller_id is not null