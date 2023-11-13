{{ config(materialized="table") }}

SELECT
    REVIEW_ID
  , ORDER_ID
  , REVIEW_SCORE
  , REVIEW_COMMENT_TITLE
  , REVIEW_COMMENT_MESSAGE
  , REVIEW_CREATION_DATE
  , REVIEW_ANSWER_TIMESTAMP
FROM {{ source('python_ecommerce_raw_martin', 'order_reviews') }}
WHERE ORDER_ID IS NOT NULL