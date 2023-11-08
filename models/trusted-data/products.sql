{{ config(materialized="table") }}


SELECT
    PRODUCT_ID
  , PRODUCT_CATEGORY_NAME
  , PRODUCT_NAME_LENGHT
  , PRODUCT_DESCRIPTION_LENGHT
  , PRODUCT_PHOTOS_QTY
  , PRODUCT_WEIGHT_G
  , PRODUCT_LENGTH_CM
  , PRODUCT_HEIGHT_CM
  , PRODUCT_WIDTH_CM
FROM {{ source('python_ecommerce_raw_martin', 'products') }}
WHERE PRODUCT_ID IS NOT NULL