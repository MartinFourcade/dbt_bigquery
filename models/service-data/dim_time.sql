{{ config(materialized="table") }}

WITH calendario AS (
SELECT 
  num + 1 AS TIME_ID, DATE_ADD(CURRENT_DATE() - (365*10), INTERVAL num DAY) AS TIME_DATE
FROM UNNEST(GENERATE_ARRAY(0, 365*10)) AS num
)
SELECT
    TIME_ID AS time_id
  , TIME_DATE AS time_date
  , EXTRACT(YEAR from TIME_DATE) AS time_year
  , CONCAT(EXTRACT(YEAR from TIME_DATE), '-', EXTRACT(QUARTER from TIME_DATE)) AS time_quarter
  , SUBSTRING(CAST(DATE_TRUNC(TIME_DATE, MONTH) AS STRING), 1, 7) AS time_month  
FROM calendario