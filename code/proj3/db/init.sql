CREATE DATABASE Company;
USE Company;
SHOW DATABASES;

-- Create tables 
CREATE TABLE Department (
  d_name VARCHAR(15) NOT NULL, 
  d_number INT NOT NULL, 
  mgr_ssn CHAR(9) NOT NULL, 
  mgr_start_date DATE, 
  PRIMARY KEY (d_number), 
  UNIQUE (d_name)
);

CREATE TABLE Employee (
  first_name VARCHAR(15) NOT NULL, 
  mid_initial CHAR, 
  last_name VARCHAR(15) NOT NULL, 
  ssn CHAR(9) NOT NULL, 
  birth_date DATE, 
  home_address VARCHAR(30), 
  sex CHAR, 
  salary DECIMAL(10,2), 
  super_SSN CHAR(9), 
  dept_num INT NOT NULL,
  FOREIGN KEY (dept_num) REFERENCES Department(d_number), 
  PRIMARY KEY (ssn)
);

-- Add encrypted salary
ALTER TABLE Employee ADD encrypted_salary VARCHAR(50);
ALTER TABLE Employee ADD salary_inx INT;
ALTER TABLE Employee ADD salary_in_thousands INT;
ALTER TABLE Employee ADD encrypted_salary_in_thousands INT;


-- SET defaults
ALTER TABLE Employee ALTER COLUMN first_name SET default '';
ALTER TABLE Employee ALTER COLUMN last_name SET default '';
ALTER TABLE Employee ALTER COLUMN dept_num SET default 0;
ALTER TABLE Employee ALTER COLUMN salary_in_thousands SET default 0;
ALTER TABLE Employee ALTER COLUMN encrypted_salary_in_thousands SET default 0;

-- Add departments
INSERT INTO Department (d_name, d_number, mgr_ssn, mgr_start_date) 
VALUES ('Research', 5, '333445555', '1988-05-22');

INSERT INTO Department (d_name, d_number, mgr_ssn, mgr_start_date) 
VALUES ('Administration', 4, '987654321', '1995-01-01');

INSERT INTO Department (d_name, d_number, mgr_ssn, mgr_start_date) 
VALUES ('Headquarters', 1, '888665555', '1981-06-19');

-- Add employees
INSERT INTO Employee (first_name, mid_initial, last_name, ssn, birth_date, home_address, sex, salary, super_SSN, dept_num, salary_inx)
VALUES ('John', 'B', 'Smith', 123456789, '1965-01-09', '731 Fondren, Houston, TX', 'M', 30000, 333445555, 5, 4);

INSERT INTO Employee (first_name, mid_initial, last_name, ssn, birth_date, home_address, sex, salary, super_SSN, dept_num, salary_inx)
VALUES ('Franklin', 'T', 'Wong', 333445555, '1955-12-08', '638 Voss, Houston, TX', 'M', 40000, 888665555, 5, 8);

INSERT INTO Employee (first_name, mid_initial, last_name, ssn, birth_date, home_address, sex, salary, super_SSN, dept_num, salary_inx)
VALUES ('Alicia', 'J', 'Zelaya', 999887777, '1968-01-19', '3321 Castle, Spring, TX', 'F', 25000, 987654321, 4, 2);

INSERT INTO Employee (first_name, mid_initial, last_name, ssn, birth_date, home_address, sex, salary, super_SSN, dept_num, salary_inx)
VALUES ('Jennifer', 'S', 'Wallace', 987654321, '1941-06-20', '291 Berry, Bellaire, TX', 'F', 43000, 888665555, 4, 12);

INSERT INTO Employee (first_name, mid_initial, last_name, ssn, birth_date, home_address, sex, salary, super_SSN, dept_num, salary_inx)
VALUES ('Ramesh', 'K', 'Narayan', 666884444, '1962-09-15', '975 Fire Oak, Houston, TX', 'M', 38000, 333445555, 5, 6);

INSERT INTO Employee (first_name, mid_initial, last_name, ssn, birth_date, home_address, sex, salary, super_SSN, dept_num, salary_inx)
VALUES ('Joyce', 'A', 'English', 453453453, '1972-07-31', '5631 Rice, Houston, TX', 'F', 25000, 333445555, 5, 2);

INSERT INTO Employee (first_name, mid_initial, last_name, ssn, birth_date, home_address, sex, salary, super_SSN, dept_num, salary_inx)
VALUES ('Ahmad', 'V', 'Jabbar', 987987987, '1969-03-29', '980 Dallas, Houston, TX', 'M', 25000, 987654321, 4, 2);

INSERT INTO Employee (first_name, mid_initial, last_name, ssn, birth_date, home_address, sex, salary, super_SSN, dept_num, salary_inx)
VALUES ('James', 'E', 'Borg', 888665555, '1937-11-10', '450 Stone, Houston, TX', 'M', 55000, NULL, 1, 14);


-- Describe tables
describe Department;
describe Employee;

-- Show tables
SELECT * FROM Department;
SELECT * FROM Employee;


-- Add encrypted salary_in_thousands and encrypted_salary
UPDATE Employee SET salary_in_thousands = 30, encrypted_salary_in_thousands = 130596 WHERE ssn = '123456789';
UPDATE Employee SET salary_in_thousands = 40, encrypted_salary_in_thousands = 1443880 WHERE ssn = '333445555';
UPDATE Employee SET salary_in_thousands = 25, encrypted_salary_in_thousands = 2558310 WHERE ssn = '453453453';
UPDATE Employee SET salary_in_thousands = 38, encrypted_salary_in_thousands = 1000397 WHERE ssn = '666884444';
UPDATE Employee SET salary_in_thousands = 55, encrypted_salary_in_thousands = 644284 WHERE ssn = '888665555';
UPDATE Employee SET salary_in_thousands = 43, encrypted_salary_in_thousands = 2275827 WHERE ssn = '987654321';
UPDATE Employee SET salary_in_thousands = 25, encrypted_salary_in_thousands = 2558310 WHERE ssn = '987987987';
UPDATE Employee SET salary_in_thousands = 25, encrypted_salary_in_thousands = 2558310 WHERE ssn = '999887777';


SELECT 
      first_name, mid_initial, last_name, 
      salary, salary_in_thousands, encrypted_salary_in_thousands 
FROM  Employee
WHERE salary_in_thousands = 38
OR    salary_in_thousands = 55;


-- 
-- Question 1
SELECT sum(salary) FROM Employee;
-- Question 2
SELECT sum(salary_in_thousands) * 1000 FROM Employee;
-- Question 3
SELECT encrypted_salary_in_thousands FROM Employee;
-- Question 4
