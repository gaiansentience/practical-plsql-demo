#!/bin/bash
# Creates the demo schema owner (runs once at database creation)
sqlplus -s / as sysdba <<SQL
ALTER SESSION SET CONTAINER = ${ORACLE_DATABASE:-FREEPDB1};
CREATE USER ${APP_USER:-demo} IDENTIFIED BY "${APP_USER_PASSWORD:-demo_123}" QUOTA UNLIMITED ON USERS;
GRANT DB_DEVELOPER_ROLE TO ${APP_USER:-demo};
EXIT
SQL
