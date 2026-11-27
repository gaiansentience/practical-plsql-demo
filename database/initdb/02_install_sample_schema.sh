#!/bin/bash
# Installs sample tables, data and code as the demo user (runs once)
sqlplus -s "${APP_USER:-demo}/${APP_USER_PASSWORD:-demo_123}@//localhost:1521/${ORACLE_DATABASE:-FREEPDB1}" <<SQL
WHENEVER SQLERROR EXIT FAILURE
@/container-entrypoint-initdb.d/sql/tables.sql
@/container-entrypoint-initdb.d/sql/data.sql
@/container-entrypoint-initdb.d/sql/code.sql
EXIT
SQL
