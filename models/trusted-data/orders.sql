{{ config(materialized="table") }}


SELECT
    ORDER_ID
  , CUSTOMER_ID
  , UPPER(TRIM(ORDER_STATUS)) ORDER_STATUS
  , ORDER_PURCHASE_TIMESTAMP
  , ORDER_APPROVED_AT
  , ORDER_DELIVERED_CARRIER_DATE
  , ORDER_DELIVERED_CUSTOMER_DATE
  , ORDER_ESTIMATED_DELIVERY_DATE
FROM {{ source('python_ecommerce_raw_martin', 'orders') }}
WHERE ORDER_ID IS NOT NULL
