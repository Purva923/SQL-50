# Write your MySQL query statement below
/*SELECT(
    SELECT salary FROM Employee
    GROUP BY salary 
    ORDER BY salary DESC
    LIMIT 1,1
) AS SecondHighestSalary;*/

select max(salary) as SecondHighestSalary from Employee where salary < (select max(salary) from Employee);
