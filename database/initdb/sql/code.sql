CREATE OR REPLACE PACKAGE employee_api AS
  FUNCTION department_payroll (p_department_id IN NUMBER) RETURN NUMBER;
END employee_api;
/
CREATE OR REPLACE PACKAGE BODY employee_api AS
  FUNCTION department_payroll (p_department_id IN NUMBER) RETURN NUMBER IS
    l_total NUMBER;
  BEGIN
    SELECT NVL(SUM(salary), 0) INTO l_total FROM employees
     WHERE department_id = p_department_id;
    RETURN l_total;
  END;
END employee_api;
/
