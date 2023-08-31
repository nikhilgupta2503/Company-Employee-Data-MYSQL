CREATE DATABASE Company;

use Company;

CREATE TABLE jobs(
  id INTEGER
  ,work_year INTEGER
  ,experience_level VARCHAR(20)
  ,employment_type VARCHAR(20)
  ,job_title VARCHAR(20)
  ,salary INTEGER
  ,salary_currency VARCHAR(20)
  ,salary_in_usd INTEGER
  ,employee_residence VARCHAR(20)
  ,remote_ratio INTEGER
  ,company_location VARCHAR(20)
  ,company_size VARCHAR(20)
);
CREATE TABLE companies(
id INT,
company_name VARCHAR(20));