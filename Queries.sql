/*
1. Query the list of CITY names from STATION that do not end with vowels. 
Your result cannot contain duplicates.
*/

SELECT DISTINCT CITY FROM STATION WHERE CITY NOT RLIKE '^[aeiouAEIOU].*$'

/*
Query the list of CITY names from STATION that do not end with vowels. 
Your result cannot contain duplicates.
*/

SELECT DISTINCT CITY FROM STATION WHERE RIGHT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u');

/*
Question: Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. 
Your result cannot contain duplicates.
*/

1. SELECT DISTINCT CITY FROM STATION WHERE LEFT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u') OR RIGHT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u');
2. SELECT DISTINCT city FROM station WHERE city RLIKE '^[^aeiouAEIOU].*|.*[^AEIOUaeiou]$';
