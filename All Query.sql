-- Select * from company
USE COMPANY;
--  What is the average salary for all the jobs in the dataset?

SELECT AVG(salary) AS AVG_SALARY FROM company;

--  What is the highest salary in the dataset and which job role does it correspond to?

SELECT job_title, MAX(salary) FROM company
GROUP BY job_title
order by MAX(salary) desc
limit 1;

--  What is the average salary for data scientists in US?

SELECT AVG(salary) FROM company
WHERE job_title = 'Data Scientist' AND company_location = 'US';

-- What is the number of jobs available for each job title?

SELECT JOB_TITLE , COUNT(*) AS TOTAL_JOB FROM company
GROUP BY JOB_TITLE ORDER BY TOTAL_JOB DESC;

--  What is the total salary paid for all data analyst jobs in DE?

SELECT job_title,SUM(salary) AS TOTAL_SALARY FROM company
WHERE job_title = 'Data Analyst' AND company_location = 'DE';

--  What are the top 5 highest paying job titles and their corresponding average salaries?

SELECT JOB_TITLE ,ROUND(AVG(SALARY)) AS AVG_SALARY FROM COMPANY
GROUP BY JOB_TITLE 
ORDER BY AVG_SALARY DESC
LIMIT 5;

--  What is the number of jobs available in each location?

select company_location,COUNT(*) AS TOTAL_JOB FROM company
GROUP BY company_location
ORDER BY TOTAL_JOB DESC
LIMIT 3;

--  What is the average salary for data engineers in Boston?

SELECT avg(salary) AS average_salary FROM COMPANY
WHERE job_title = 'Data Engineer' AND company_location = 'US';

--  What are the top 5 cities with the highest average salaries?

SELECT company_location, ROUND(AVG(SALARY)) AS average_salary FROM COMPANY
GROUP BY company_location
ORDER BY average_salary DESC
LIMIT 5;

--  What is the average salary for each job title, and what is the total number of jobs available for each job title?

SELECT job_title, ROUND(AVG(SALARY)) AS average_salary,COUNT(*) AS TOTAL_JOB FROM COMPANY
GROUP BY job_title
ORDER BY TOTAL_JOB DESC;


--  What are the top 5 job titles with the highest total salaries, and what is the total number of jobs available for each job title?

SELECT job_title, SUM(SALARY) AS TOTAL_salary,COUNT(*) AS TOTAL_JOB FROM COMPANY
GROUP BY job_title
ORDER BY TOTAL_salary DESC
LIMIT 5;

--  What are the top 5 locations with the highest total salaries, and what is the total number of jobs available for each location?

SELECT company_location, SUM(SALARY) AS TOTAL_salary,COUNT(*) AS TOTAL_JOB FROM COMPANY
GROUP BY company_location
ORDER BY TOTAL_salary DESC
LIMIT 5;

-- What is the average salary for each job title in each location, and what is the total number of jobs available for each job title in each location?

SELECT job_title, company_location,ROUND(AVG(SALARY)) AS average_salary, COUNT(*) AS TOTAL_JOB FROM COMPANY
GROUP BY job_title,company_location
ORDER BY TOTAL_JOB DESC;

--  What is the average salary for each job title in each location, and what is the percentage of jobs for each job title in each location?

SELECT job_title, company_location,ROUND(AVG(SALARY)) AS average_salary,
(COUNT(*)*100/(SELECT COUNT(*) FROM COMPANY)) AS PERCENTAGE_TOTAL_JOB  FROM COMPANY 
GROUP BY job_title,company_location
ORDER BY PERCENTAGE_TOTAL_JOB DESC;

-- What are the top 5 job titles with the highest average salaries, and what is the total number of jobs available for each job title?

SELECT job_title, ROUND(AVG(SALARY)) AS average_salary, COUNT(*) AS TOTAL_JOB FROM COMPANY
GROUP BY job_title
ORDER BY  average_salary DESC
LIMIT  5;

-- What is the average salary for each job title, and what is the percentage of jobs for each job title in the dataset?

SELECT job_title, ROUND(AVG(SALARY)) AS average_salary, 
(COUNT(*)*100/(SELECT COUNT(*) FROM COMPANY)) AS PERCENTAGE_TOTAL_JOB FROM COMPANY
GROUP BY job_title;

-- What is the total number of jobs available for each year of experience, and what is the average salary for each year of experience?

SELECT experience_level,COUNT(*) NUM_JOBS, AVG(SALARY) FROM COMPANY
GROUP BY experience_level;


-- What is the average salary for each degree level, and what is the total number of jobs available for each degree level?

select experience_level,AVG(SALARY) AS AVG_SALARY, COUNT(*) AS num_jobs FROM COMPANY
GROUP BY experience_level;

-- What are the top 5 job titles with the highest salaries, and what is the name of the company that offers the highest salary for each job title?

SELECT job_title, MAX(salary) AS HIGHEST_SALARY, companies.company_name
FROM company
INNER JOIN companies ON company.id = companies.id
GROUP BY job_title, company_name
ORDER BY HIGHEST_SALARY DESC
LIMIT 5;

-- What is the total number of jobs available for each job title, and what is the name of the company that offers the highest salary for each job title?

SELECT job_title, COUNT(*) AS num_jobs, company_name 
FROM company
INNER JOIN companies ON company.id = companies.id 
WHERE salary = (SELECT MAX(salary) FROM company WHERE job_title = company.job_title) 
GROUP BY job_title, company_name;

-- What are the top 5 cities with the highest average salaries, and what is the name of the company that offers the highest salary for each city?

SELECT company_location,ROUND(AVG(SALARY)) AS  AVG_SALARY, company_name FROM COMPANY
INNER JOIN COMPANIES ON COMPANY.ID = COMPANIES.ID
GROUP BY company_location
ORDER BY AVG_SALARY DESC
LIMIT 5;