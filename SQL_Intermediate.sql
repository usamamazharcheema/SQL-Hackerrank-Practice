/*
A median is defined as a number separating the higher half of a data set from the lower half. 
Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places.
*/

SET @rowindex := -1;

WITH cte_lat AS (
  SELECT
    @rowindex := @rowindex + 1 AS rowindex,
    lat_n
  FROM
    station
  ORDER BY
    lat_n
)
SELECT
  ROUND(AVG(cte_lat.lat_n), 4) AS median_duration
FROM
  cte_lat
WHERE
  cte_lat.rowindex IN (FLOOR(@rowindex / 2) , CEIL(@rowindex / 2));