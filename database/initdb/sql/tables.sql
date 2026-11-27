CREATE TABLE departments (
  department_id   NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  department_name VARCHAR2(60) NOT NULL
);
CREATE TABLE employees (
  employee_id   NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  employee_name VARCHAR2(60) NOT NULL,
  salary        NUMBER(10,2),
  department_id NUMBER REFERENCES departments
);
