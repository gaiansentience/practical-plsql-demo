#!/bin/bash
# Runs on every startup: reports whether each feature is implemented.
# Add new checks by calling check_feature with a name and a SQL query returning a count.
U="${APP_USER:-demo}"
check_feature() {
  local name="$1" query="$2" n
  n=$(sqlplus -s "$U/${APP_USER_PASSWORD:-demo_123}@//localhost:1521/${ORACLE_DATABASE:-FREEPDB1}" <<SQL | tr -d '[:space:]'
SET HEADING OFF FEEDBACK OFF PAGESIZE 0
$query
EXIT
SQL
)
  if [ "${n:-0}" -gt 0 ] 2>/dev/null; then
    echo "FEATURE [$name]: implemented"
  else
    echo "FEATURE [$name]: NOT implemented"
  fi
}
check_feature "employees table" "SELECT COUNT(*) FROM user_tables WHERE table_name='EMPLOYEES';"
check_feature "sample data" "SELECT COUNT(*) FROM employees;"
check_feature "employee_api package" "SELECT COUNT(*) FROM user_objects WHERE object_name='EMPLOYEE_API' AND status='VALID';"
