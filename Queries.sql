/*
1. Query the list of CITY names from STATION that do not end with vowels. 
Your result cannot contain duplicates.
*/

SELECT DISTINCT CITY FROM STATION 
WHERE CITY NOT RLIKE '^[aeiouAEIOU].*$'

/*
Query the list of CITY names from STATION that do not end with vowels. 
Your result cannot contain duplicates.
*/

SELECT DISTINCT CITY FROM STATION 
WHERE RIGHT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u');

/*
Question: Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. 
Your result cannot contain duplicates.
*/

1. SELECT DISTINCT CITY FROM STATION 
   WHERE LEFT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u') OR RIGHT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u');
2. SELECT DISTINCT city FROM station 
   WHERE city RLIKE '^[^aeiouAEIOU].*|.*[^AEIOUaeiou]$';

/*
Query the Name of any student in STUDENTS who scored higher than  Marks. 
Order your output by the last three characters of each name. 
If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
*/

SELECT name FROM STUDENTS
WHERE Marks > 75
ORDER BY LOWER(RIGHT(name,3)), id;

/*
Write a query that prints a list of employee names (i.e.: the name attribute) 
from the Employee table in alphabetical order.
*/

SELECT name FROM Employee
ORDER BY name;

/*
Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee 
having a salary greater than 2000 per month who have been employees for less than 10 months. 
Sort your result by ascending employee_id.
*/

SELECT name FROM Employee
WHERE salary > 2000 AND months < 10;