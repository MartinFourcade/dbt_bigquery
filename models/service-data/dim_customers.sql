{{config(materialized='table')}}

SELECT
 distinct(c.CUSTOMER_ID) as customer_id,
 c.CUSTOMER_UNIQUE_ID as customer_unique_id,
 c.CUSTOMER_ZIP_CODE_PREFIX as customer_zip_code_prefix,
 c.CUSTOMER_CITY as customer_city,
 c.CUSTOMER_STATE as customer_state,
 h.GEOLOCATION_LAT as customer_geo_lat,
 h.GEOLOCATION_LNG as customer_geo_lng
FROM {{ref('customers')}} c
LEFT JOIN {{ref('geolocation')}} h  
    on c.CUSTOMER_ZIP_CODE_PREFIX = h.GEOLOCATION_ZIP_CODE_PREFIX
    and c.CUSTOMER_CITY = h.GEOLOCATION_CITY
    and c.CUSTOMER_STATE = h.GEOLOCATION_STATE
WHERE c.CUSTOMER_ID is not null
QUALIFY ROW_NUMBER() OVER (PARTITION BY c.CUSTOMER_ID ORDER BY h.GEOLOCATION_LAT, h.GEOLOCATION_LNG DESC) = 1