{{ config(materialized="table") }}


SELECT
    ORDER_ID
  , PAYMENT_SEQUENTIAL
  , UPPER(TRIM(PAYMENT_TYPE)) PAYMENT_TYPE
  , PAYMENT_INSTALLMENTS
  , PAYMENT_VALUE
FROM {{ source('python_ecommerce_raw_martin', 'order_payments') }}
WHERE ORDER_ID IS NOT NULL
