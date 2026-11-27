# practical-plsql-demo
## Oracle Database 26 (gvenzl always-free container)

`docker compose up -d` starts `gvenzl/oracle-free` using `compose.yaml`
(override with `ORACLE_IMAGE`, `ORACLE_PASSWORD`, `APP_USER`, etc.).

- `database/initdb/` – runs once on first creation: creates the demo user and installs sample schema, data and code (`sql/`).
- `database/startdb/` – runs on every startup: checks and reports whether each feature is implemented.
