{{config(materialized='table')}}

SELECT
 p.PRODUCT_ID as product_id,
 p.PRODUCT_CATEGORY_NAME as product_category_name,
 p.PRODUCT_NAME_LENGHT as product_name_length,
 p.PRODUCT_DESCRIPTION_LENGHT as product_description_length

FROM {{ref('products')}} p

WHERE p.PRODUCT_ID is not null