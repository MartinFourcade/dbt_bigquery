{{config(materialized='table')}}

SELECT 
o.ORDER_ID as order_id,
o.CUSTOMER_ID as customer_id,
o.ORDER_STATUS as order_status,
o.ORDER_PURCHASE_TIMESTAMP as order_purchase_timestamp,
o.ORDER_DELIVERED_CUSTOMER_DATE as order_delivered_customer_date,
o.ORDER_ESTIMATED_DELIVERY_DATE as order_estimated_delivery_date,
COALESCE(oi.PRICE, 0) as price,
COALESCE(oi.FREIGHT_VALUE, 0) as freight_value,
ROUND(oi.PRICE+oi.FREIGHT_VALUE, 2) as order_gross_value,
oi.ORDER_ITEM_ID as  order_item_id,
oi.SELLER_ID as seller_id,
p.PRODUCT_ID  as product_id

FROM {{ref('orders')}} o
LEFT JOIN {{ref('order_items')}} oi on o.order_id = oi.order_id
LEFT JOIN {{ref('products')}} p on oi.product_id = p.product_id
WHERE o.order_id is not null
and p.product_id is not null