{{ config(materialized="table") }}


SELECT
   UPPER(TRIM(PRODUCT_CATEGORY_NAME)) as PRODUCT_CATEGORY_NAME
  , UPPER(TRIM(PRODUCT_CATEGORY_NAME_ENGLISH)) AS PRODUCT_CATEGORY_NAME_ENGLISH
FROM {{ source('python_ecommerce_raw_martin', 'product_category_name_translation') }}
WHERE PRODUCT_CATEGORY_NAME IS NOT NULL