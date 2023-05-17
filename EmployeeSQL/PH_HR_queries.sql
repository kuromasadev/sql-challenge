/* #1 List the employee number, last name, first name, 
sex, and salary of each employee*/

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM PH_emp AS e
JOIN PH_salaries AS s ON e.emp_no = s.emp_no;

/*#2 List the first name, last name, and 
hire date for the employees who were hired in 1986:*/ 

SELECT first_name, last_name, hire_date
FROM PH_emp
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

/* #3 List the manager of each department along with their
department number, department name, employee number, 
 last name, and first name*/ 

SELECT d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
FROM PH_depts_mgr AS m
JOIN PH_depts AS d ON m.dept_no = d.dept_no
JOIN PH_emp AS e ON m.emp_no = e.emp_no;

/* #4 List the department number for each employee along 
with that employee’s employee number, last name, first name, 
and department name */

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM PH_emp AS e
JOIN PH_depts_emp AS de ON e.emp_no = de.emp_no
JOIN PH_depts AS d ON de.dept_no = d.dept_no;

/* #5 List the first name, last name, and sex of each employee 
whose first name is Hercules and whose last name 
begins with the letter B: */

SELECT first_name, last_name, sex
FROM PH_emp
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

/* #6 List each employee in the Sales department, 
including their employee number, last name, and first name */

SELECT e.emp_no, e.last_name, e.first_name
FROM PH_emp AS e
JOIN PH_depts_emp AS de ON e.emp_no = de.emp_no
JOIN PH_depts AS d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

/* #7 List each employee in the Sales and Development departments,
 including their employee number, last name, first name, 
 and department name: */

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM PH_emp AS e
JOIN PH_depts_emp AS de ON e.emp_no = de.emp_no
JOIN PH_depts AS d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

/* #8 List the frequency counts, in descending order,
 of all the employee last names */ 

SELECT last_name, COUNT(*) AS frequency
FROM PH_emp
GROUP BY last_name
ORDER BY frequency DESC;
