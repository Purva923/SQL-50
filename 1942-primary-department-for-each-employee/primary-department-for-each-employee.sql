# Write your MySQL query statement below
SELECT e.employee_id,e.department_id FROM Employee AS e 
JOIN (
    SELECT employee_id,COUNT(department_id) AS department_count FROM Employee
    GROUP BY employee_id
) AS t
ON t.employee_id=e.employee_id
WHERE t.department_count=1
OR e.primary_flag='Y';