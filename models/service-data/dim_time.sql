{{ config(materialized="table") }}

WITH calendario AS (
SELECT 
  num + 1 AS TIME_ID,
  DATE_ADD(DATE '2016-01-01', INTERVAL num DAY) AS TIME_DATE
FROM UNNEST(GENERATE_ARRAY(0, DATE_DIFF(DATE '2018-12-31', DATE '2016-01-01', DAY))) AS num
)
SELECT
    TIME_ID AS time_id
  , TIME_DATE AS time_date
  , EXTRACT(YEAR from TIME_DATE) AS time_year
  , CONCAT(EXTRACT(YEAR from TIME_DATE), '-', EXTRACT(QUARTER from TIME_DATE)) AS time_quarter
  , SUBSTRING(CAST(DATE_TRUNC(TIME_DATE, MONTH) AS STRING), 1, 7) AS time_month  
FROM calendario