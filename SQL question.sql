--Question 1
SELECT e.department,e.name,e.age,p.plant_name,c.name COMPANY_NAME,CONCAT('RM ',e.salary) SALARY FROM
tmp_intvw_employee e
INNER JOIN tmp_intvw_plant p
ON e.plant_id = p.plant_id
INNER JOIN tmp_intvw_company c
ON c.company_id = p.company_id
ORDER BY e.department,e.name

--Question 2
SELECT c.name COMPANY_NAME,e.department,COUNT(e.department) TOTAL_EMPLOYEE FROM
tmp_intvw_employee e
INNER JOIN tmp_intvw_plant p
ON e.plant_id = p.plant_id
INNER JOIN tmp_intvw_company c
ON c.company_id = p.company_id
GROUP BY c.name,e.department
ORDER BY c.Name,e.department

--Question 3
SELECT a.SALARY_RANGE,COUNT(a.SALARY_RANGE) TOTAL_EMPLOYEE
FROM 
(SELECT 
	CASE
		WHEN e.salary BETWEEN 2001 and 3000 THEN '2001-3000'
		WHEN e.salary BETWEEN 3001 and 5000 THEN '3001-5000'
		ELSE 'More than 5000'
	END AS SALARY_RANGE
FROM
tmp_intvw_employee e) a
GROUP BY a.SALARY_RANGE

--Question 4
SELECT
    ranges.SALARY_RANGE,
    COALESCE(COUNT(e.salary), 0) AS TOTAL_EMPLOYEE
FROM (
    SELECT 'Below 2000' AS SALARY_RANGE
    UNION ALL
    SELECT '2001-3000' AS SALARY_RANGE
    UNION ALL
    SELECT '3001-5000' AS SALARY_RANGE
    UNION ALL
    SELECT 'More than 5000' AS SALARY_RANGE
) AS ranges
LEFT JOIN tmp_intvw_employee e
ON (
    (ranges.SALARY_RANGE = 'Below 2000' AND e.salary < 2000) OR
    (ranges.SALARY_RANGE = '2001-3000' AND e.salary BETWEEN 2001 AND 3000) OR
    (ranges.SALARY_RANGE = '3001-5000' AND e.salary BETWEEN 3001 AND 5000) OR
    (ranges.SALARY_RANGE = 'More than 5000' AND e.salary > 5000)
)
GROUP BY ranges.SALARY_RANGE;








