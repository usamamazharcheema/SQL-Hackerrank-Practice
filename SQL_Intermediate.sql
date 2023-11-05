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

/*
You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.
Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:
Root: If node is root node.
Leaf: If node is leaf node.
Inner: If node is neither root nor leaf node.
*/

SELECT  CASE 
        WHEN p IS NULL THEN CONCAT(n, ' Root')
        WHEN n IN (SELECT DISTINCT p FROM bst) THEN CONCAT(n, ' Inner')
        ELSE CONCAT(n, ' Leaf')
    END
FROM bst
ORDER BY n ASC;