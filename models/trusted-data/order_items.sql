{{ config(materialized="table") }}


SELECT
    ORDER_ID
  , ORDER_ITEM_ID
  , PRODUCT_ID
  , SELLER_ID
  , SHIPPING_LIMIT_DATE
  , PRICE
  , FREIGHT_VALUE
FROM {{ source('python_ecommerce_raw_martin', 'order_items') }}
WHERE ORDER_ID IS NOT NULL
and ORDER_ITEM_ID IS NOT NULL