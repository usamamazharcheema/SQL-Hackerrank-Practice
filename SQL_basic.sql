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

/*
Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and 
their respective average city populations (CITY.Population) rounded down to the nearest integer.
*/

SELECT country.continent, FLOOR(AVG(city.population)) FROM 
country INNER JOIN city ON city.countrycode=country.code
GROUP BY country.continent;

/*
You are given two tables: Students and Grades. Students contains three columns ID, Name and Marks.
Grades contains the three columns too Grade, Min_Mark, Max_Mark
Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. 
Ketty doesn't want the NAMES of those students who received a grade lower than 8. 
The report must be in descending order by grade -- i.e. higher grades are entered first. 
If there is more than one student with the same grade (8-10) assigned to them, order those particular students by their name alphabetically.
Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. If there is more than one 
student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order.

Write a query to help Eve.
*/

SELECT 
CASE WHEN g.grade < 8 THEN NULL
ELSE s.name END AS 'name'
, g.grade
, s.marks 
FROM students s
INNER JOIN grades g ON s.marks BETWEEN g.min_mark AND g.max_mark
ORDER BY g.grade DESC, name ASC, s.marks ASC;

/*
ulia just finished conducting a coding contest, and she needs your help assembling the leaderboard! 
Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than 
one challenge. Order your output in descending order by the total number of challenges in which the hacker 
earned a full score. If more than one hacker received full scores in same number of challenges, then sort them
by ascending hacker_id.
*/

SELECT h.hacker_id, h.name FROM Hackers h
JOIN Submissions s ON h.hacker_id = s.hacker_id
JOIN Challenges c on s.challenge_id = c.challenge_id
JOIN Difficulty d on c.difficulty_level = d.difficulty_level
WHERE s.score = d.score
GROUP BY h.hacker_id, h.name
HAVING COUNT(s.challenge_id) > 1
ORDER BY COUNT(s.challenge_id) DESC, h.hacker_id;

/*
Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, 
but did not realize her keyboard's  key was broken until after completing the calculation. She wants your 
help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual 
average salary. Write a query calculating the amount of error (i.e.:  average monthly salaries), and round it up 
to the next integer.
*/

SELECT CEIL((AVG(salary)) - (AVG(REPLACE(salary, '0', '')))) AS avg_salary FROM employees;

/*
Given the CITY and COUNTRY tables, query the sum of the populations of all cities 
where the CONTINENT is 'Asia'.
*/

SELECT SUM(CITY.population) FROM city
JOIN Country ON CITY.CountryCode = COUNTRY.Code
WHERE COUNTRY.CONTINENT = 'Asia';

/*
We define an employee's total earnings to be their monthly salary * months  worked, and the maximum total earnings to be the maximum 
total earnings for any employee in the Employee table. Write a query to find the maximum total earnings for all employees
as well as the total number of employees who have maximum total earnings. 
Then print these values as 2 space-separated integers.
*/

SELECT months*salary, COUNT(*) FROM employee
GROUP BY months*salary
ORDER BY months*salary DESC
LIMIT 1;

/*
Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 137.2345. 
Truncate your answer to 4 decimal places.
*/

SELECT ROUND(SUM(lat_n), 4) FROM station
WHERE lat_n BETWEEN 38.7880 AND 137.2345;

/*
Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345. 
Truncate your answer to 4 decimal places.
*/

SELECT ROUND(lat_n, 4) FROM station
WHERE lat_n < 137.2345
ORDER BY lat_n DESC
LIMIT 1;

/*
Consider P1(a,b) and P2(c,d) to be two points on a 2D plane.
 a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
 b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
 c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
 d happens to equal the maximum value in Western Longitude (LONG_W in STATION).
Query the Manhattan Distance between points P1 and P2 and round it to a scale of 4 decimal places.
*/

SELECT ROUND((MAX(lat_n) - MIN(lat_n)) + (MAX(long_w) - MIN(long_w)), 4) FROM station;

/*
Consider P1(a,b) and P2(c,d) to be two points on a 2D plane.
 a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
 b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
 c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
 d happens to equal the maximum value in Western Longitude (LONG_W in STATION).
Query the Euclidean Distance between points P1 and P2 and round it to a scale of 4 decimal places.
*/

SELECT ROUND(SQRT(POWER((MAX(lat_n) - MIN(lat_n)), 2) + POWER((MAX(long_w) - MIN(long_w)), 2)), 4) FROM station;

/*
Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. 
Output one of the following statements for each record in the table:
Equilateral: It's a triangle with 3 sides of equal length.
Isosceles: It's a triangle with 2 sides of equal length.
Scalene: It's a triangle with 3 sides of differing lengths.
Not A Triangle: The given values of A, B, and C don't form a triangle.
*/

SELECT CASE
       WHEN (A+B) <= C OR (B+C) <= A OR (A+C) <= B THEN 'Not A Triangle' 
       WHEN A = B AND B = C AND A = C THEN 'Equilateral'
       WHEN A = B OR B = C OR A = C THEN 'Isosceles' 
       ELSE 'Scalene' END AS QuantityText
FROM TRIANGLES;