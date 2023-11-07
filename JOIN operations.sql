-- 1. Retrieve all employees with their salaries.
SELECT employees.employee_name, salaries.salary_amount
FROM employees
LEFT JOIN salaries ON employees.id = salaries.employee_id;

-- 2. Retrieve all employees with salaries less than 2000.
SELECT employees.employee_name, salaries.salary_amount
FROM employees
LEFT JOIN salaries ON employees.id = salaries.employee_id
WHERE salaries.salary_amount < 2000;

-- 3. Retrieve all salary positions with no assigned employees.
SELECT job_titles.job_title
FROM job_titles
LEFT JOIN employees ON job_titles.id = employees.job_title_id
WHERE employees.id IS NULL;

-- 4. Retrieve all salary positions with salaries less than 2000 and no assigned employees.
SELECT job_titles.job_title
FROM job_titles
LEFT JOIN employees ON job_titles.id = employees.job_title_id
LEFT JOIN salaries ON employees.id = salaries.employee_id
WHERE employees.id IS NULL OR salaries.salary_amount < 2000;

-- 5. Find all employees with no assigned salaries.
SELECT employees.employee_name
FROM employees
LEFT JOIN salaries ON employees.id = salaries.employee_id
WHERE salaries.salary_amount IS NULL;

-- 6. Retrieve all employees with their job titles.
SELECT employees.employee_name, job_titles.job_title
FROM employees
INNER JOIN job_titles ON employees.job_title_id = job_titles.id;

-- 7. Retrieve names and job titles of Java developers.
SELECT employees.employee_name, job_titles.job_title
FROM employees
INNER JOIN job_titles ON employees.job_title_id = job_titles.id
WHERE job_titles.job_title = 'Java Developer';

-- 8. Retrieve names and job titles of Python developers.
SELECT employees.employee_name, job_titles.job_title
FROM employees
INNER JOIN job_titles ON employees.job_title_id = job_titles.id
WHERE job_titles.job_title = 'Python Developer';

-- 9. Retrieve names and job titles of all QA engineers.
SELECT employees.employee_name, job_titles.job_title
FROM employees
INNER JOIN job_titles ON employees.job_title_id = job_titles.id
WHERE job_titles.job_title LIKE 'QA Engineer%';

-- 10. Retrieve names and job titles of manual QA engineers.
SELECT employees.employee_name, job_titles.job_title
FROM employees
INNER JOIN job_titles ON employees.job_title_id = job_titles.id
WHERE job_titles.job_title = 'Manual QA Engineer';

-- 11. Retrieve names and job titles of automation QA engineers.
SELECT employees.employee_name, job_titles.job_title
FROM employees
INNER JOIN job_titles ON employees.job_title_id = job_titles.id
WHERE job_titles.job_title = 'Automation QA Engineer';

-- 12. Retrieve names and salaries of Junior specialists.
SELECT employees.employee_name, salaries.salary_amount
FROM employees
INNER JOIN job_titles ON employees.job_title_id = job_titles.id
INNER JOIN salaries ON employees.id = salaries.employee_id
WHERE job_titles.job_title = 'Junior';

-- 13. Retrieve names and salaries of Middle specialists.
SELECT employees.employee_name, salaries.salary_amount
FROM employees
INNER JOIN job_titles ON employees.job_title_id = job_titles.id
INNER JOIN salaries ON employees.id = salaries.employee_id
WHERE job_titles.job_title = 'Middle';

-- 14. Retrieve names and salaries of Senior specialists.
SELECT employees.employee_name, salaries.salary_amount
FROM employees
INNER JOIN job_titles ON employees.job_title_id = job_titles.id
INNER JOIN salaries ON employees.id = salaries.employee_id
WHERE job_titles.job_title = 'Senior';

-- 15. Retrieve salaries of Java developers.
SELECT salaries.salary_amount
FROM employees
INNER JOIN job_titles ON employees.job_title_id = job_titles.id
INNER JOIN salaries ON employees.id = salaries.employee_id
WHERE job_titles.job_title = 'Java Developer';

-- 16. Retrieve salaries of Python developers.
SELECT salaries.salary_amount
FROM employees
INNER JOIN job_titles ON employees.job_title_id = job_titles.id
INNER JOIN salaries ON employees.id = salaries.employee_id
WHERE job_titles.job_title = 'Python Developer';

-- 17. Retrieve names and salaries of Junior Python developers.
SELECT employees.employee_name, salaries.salary_amount
FROM employees
INNER JOIN job_titles ON employees.job_title_id = job_titles.id
INNER JOIN salaries ON employees.id = salaries.employee_id
WHERE job_titles.job_title = 'Python Developer' AND job_titles.job_level = 'Junior';

-- 18. Retrieve names and salaries of Middle JavaScript developers.
SELECT employees.employee_name, salaries.salary_amount
FROM employees
INNER JOIN job_titles ON employees.job_title_id = job_titles.id
INNER JOIN salaries ON employees.id = salaries.employee_id
WHERE job_titles.job_title = 'JavaScript Developer' AND job_titles.job_level = 'Middle';

-- 19. Retrieve names and salaries of Senior Java developers.
SELECT employees.employee_name, salaries.salary_amount
FROM employees
INNER JOIN job_titles ON employees.job_title_id = job_titles.id
INNER JOIN salaries ON employees.id = salaries.employee_id
WHERE job_titles.job_title = 'Java Developer' AND job_titles.job_level = 'Senior';

-- 20. Retrieve salaries of Junior QA engineers.
SELECT salaries.salary_amount
FROM employees
INNER JOIN job_titles ON employees.job_title_id = job_titles.id
INNER JOIN salaries ON employees.id = salaries.employee_id
WHERE job_titles.job_title = 'QA Engineer' AND job_titles.job_level = 'Junior';

-- 21. Retrieve the average salary of all Junior specialists.
SELECT AVG(salaries.salary_amount)
FROM employees
INNER JOIN job_titles ON employees.job_title_id = job_titles.id
INNER JOIN salaries ON employees.id = salaries.employee_id
WHERE job_titles.job_level = 'Junior';

-- 22. Retrieve the sum of salaries for JavaScript developers.
SELECT SUM(salaries.salary_amount)
FROM employees
INNER JOIN job_titles ON employees.job_title_id = job_titles.id
INNER JOIN salaries ON employees.id = salaries.employee_id
WHERE job_titles.job_title = 'JavaScript Developer';

-- 23. Retrieve the minimum salary of QA engineers.
SELECT MIN(salaries.salary_amount)
FROM employees
INNER JOIN job_titles ON employees.job_title_id = job_titles.id
INNER JOIN salaries ON employees.id = salaries.employee_id
WHERE job_titles.job_title = 'QA Engineer';

-- 24. Retrieve the maximum salary of QA engineers.
SELECT MAX(salaries.salary_amount)
FROM employees
INNER JOIN job_titles ON employees.job_title_id = job_titles.id
INNER JOIN salaries ON employees.id = salaries.employee_id
WHERE job_titles.job_title = 'QA Engineer';

-- 25. Retrieve the count of QA engineers.
SELECT COUNT(employees.id)
FROM employees
INNER JOIN job_titles ON employees.job_title_id = job_titles.id
WHERE job_titles.job_title = 'QA Engineer';

-- 26. Retrieve the count of Middle specialists.
SELECT COUNT(employees.id)
FROM employees
INNER JOIN job_titles ON employees
