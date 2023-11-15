{{config(materialized='table')}}

SELECT

op.ORDER_ID as order_id,
oi.ORDER_ITEM_ID as order_item_id,
oi.PRODUCT_ID as product_id,
oi.SELLER_ID as seller_id, 
o.CUSTOMER_ID as customer_id,
op.PAYMENT_TYPE as payment_type,
op.PAYMENT_INSTALLMENTS as payment_installments,
op.PAYMENT_VALUE as payment_value

FROM {{ref('order_payments')}} op
LEFT JOIN {{ref('order_items')}} oi on oi.order_id = op.order_id
LEFT JOIN {{ref('orders')}} o on oi.order_id = o.order_id
WHERE op.order_id is not null
and o.customer_id is not null
and oi.seller_id is not null

