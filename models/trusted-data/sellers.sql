{{ config(materialized="table") }}


SELECT
    SELLER_ID
  , SELLER_ZIP_CODE_PREFIX
  , UPPER(TRIM(SELLER_CITY)) as SELLER_CITY
  , UPPER(TRIM(SELLER_STATE)) AS SELLER_STATE
FROM {{ source('python_ecommerce_raw_martin', 'sellers') }}
WHERE SELLER_ID IS NOT NULL